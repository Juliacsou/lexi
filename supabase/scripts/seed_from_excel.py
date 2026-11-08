import os
import re
import json
import openpyxl
import urllib.request
import urllib.error

FILE_AUTOIDS = '/home/antigravity/Lexi_C1_Blocos_Supabase_AutoIDs_v1_1.xlsx'
FILE_FLASHCARDS = '/home/antigravity/Lexi_C1_Flashcards_Sinonimos_Aplicacoes_v1_0.xlsx'
FILE_EXERCISES = '/home/antigravity/Lexi_C1_Foundations_Bloco01_35_Exercicios.xlsx'
OUTPUT_SQL = '/home/antigravity/Juliacsou/lexi/supabase/seed.sql'

def escape_sql(val):
    if val is None:
        return 'NULL'
    if isinstance(val, (int, float)):
        return str(val)
    val = str(val).replace("'", "''")
    return f"'{val}'"

def parse_data():
    print('Reading AutoIDs workbook...')
    wb_ids = openpyxl.load_workbook(FILE_AUTOIDS, data_only=True)
    
    # 1. Levels
    levels = []
    ws_lvl = wb_ids['levels']
    for row in list(ws_lvl.iter_rows(values_only=True))[1:]:
        if not row[0]: continue
        levels.append({
            'code': row[0],
            'title': row[1],
            'description': row[2],
            'order_index': row[3] or 1
        })
    print(f'Parsed {len(levels)} levels.')

    # 2. Workbooks
    workbooks = []
    ws_wb = wb_ids['workbooks']
    for row in list(ws_wb.iter_rows(values_only=True))[1:]:
        if not row[1]: continue
        workbooks.append({
            'level_code': row[0],
            'code': row[1],
            'title': row[2],
            'difficulty_tier': int(row[3]),
            'volume_number': int(row[4]),
            'total_blocks_planned': int(row[5]),
            'unlock_threshold_percent': float(row[6]),
            'prerequisite_code': row[7],
            'publication_status': 'published', # Set published so workbooks appear in app with gating
            'order_index': int(row[3])
        })
    print(f'Parsed {len(workbooks)} workbooks.')

    # 3. Blocks
    blocks = []
    ws_blk = wb_ids['blocks']
    for row in list(ws_blk.iter_rows(values_only=True))[1:]:
        if not row[1]: continue
        blocks.append({
            'workbook_code': row[0],
            'code': row[1],
            'title': row[2],
            'order_index': int(row[3])
        })
    print(f'Parsed {len(blocks)} blocks.')

    # 4. Words (from Flashcards file for full synonyms and applications)
    print('Reading Flashcards workbook...')
    wb_flash = openpyxl.load_workbook(FILE_FLASHCARDS, data_only=True)
    ws_words = wb_flash['words']
    words = []
    for row in list(ws_words.iter_rows(values_only=True))[1:]:
        if not row[1]: continue
        raw_syns = str(row[4] or '')
        syns_list = [s.strip() for s in raw_syns.split(',') if s.strip()]
        words.append({
            'block_code': row[0],
            'word': str(row[1]).strip(),
            'part_of_speech': str(row[2]).strip().lower(),
            'order_index': int(row[3] or 1),
            'synonyms': syns_list,
            'application_1': str(row[5] or '').strip(),
            'application_2': str(row[6] or '').strip()
        })
    print(f'Parsed {len(words)} words.')

    # 5. Exercises
    print('Reading Exercises workbook...')
    wb_ex = openpyxl.load_workbook(FILE_EXERCISES, data_only=True)
    ws_ex = wb_ex['exercises']
    exercises = []
    for row in list(ws_ex.iter_rows(values_only=True))[1:]:
        if not row[0]: continue
        raw_options = row[4]
        if isinstance(raw_options, str):
            try:
                options_list = json.loads(raw_options)
            except:
                options_list = [o.strip() for o in raw_options.split(',')]
        else:
            options_list = []
        exercises.append({
            'block_code': row[0],
            'word': str(row[1]).strip(),
            'type': str(row[2]).strip(),
            'prompt': str(row[3]).strip(),
            'options': options_list,
            'correct_answer': str(row[5]).strip(),
            'explanation': str(row[6]).strip(),
            'order_index': int(row[7] or 1)
        })
    print(f'Parsed {len(exercises)} exercises.')

    return levels, workbooks, blocks, words, exercises

def generate_sql(levels, workbooks, blocks, words, exercises):
    print(f'Generating SQL seed script -> {OUTPUT_SQL}...')
    lines = []
    lines.append('-- ==============================================================================')
    lines.append('-- LEXI SEED SCRIPT (Level C1, 5 Workbooks, 100 Blocks, 1000 Words, 35 Exercises)')
    lines.append('-- Generated automatically from approved Excel dictionaries')
    lines.append('-- ==============================================================================\n')
    lines.append('BEGIN;\n')

    # 1. Levels
    lines.append('-- 1. LEVELS')
    for lvl in levels:
        lines.append(f"""INSERT INTO public.levels (code, title, description, order_index)
VALUES ({escape_sql(lvl['code'])}, {escape_sql(lvl['title'])}, {escape_sql(lvl['description'])}, {lvl['order_index']})
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;""")
    lines.append('')

    # 2. Workbooks (Step 1: without prerequisite FK)
    lines.append('-- 2. WORKBOOKS (Initial insert without prerequisite FK)')
    for wb in workbooks:
        lines.append(f"""INSERT INTO public.workbooks (level_id, code, title, difficulty_tier, volume_number, total_blocks_planned, unlock_threshold_percent, publication_status, order_index)
VALUES ((SELECT id FROM public.levels WHERE code = {escape_sql(wb['level_code'])}), {escape_sql(wb['code'])}, {escape_sql(wb['title'])}, {wb['difficulty_tier']}, {wb['volume_number']}, {wb['total_blocks_planned']}, {wb['unlock_threshold_percent']}, {escape_sql(wb['publication_status'])}, {wb['order_index']})
ON CONFLICT (level_id, difficulty_tier, volume_number) DO UPDATE 
SET title = EXCLUDED.title, total_blocks_planned = EXCLUDED.total_blocks_planned, unlock_threshold_percent = EXCLUDED.unlock_threshold_percent, publication_status = EXCLUDED.publication_status;""")
    lines.append('')

    # Workbooks (Step 2: link prerequisite FK)
    lines.append('-- 2.1 WORKBOOKS (Linking prerequisite_workbook_id)')
    for wb in workbooks:
        if wb['prerequisite_code']:
            lines.append(f"""UPDATE public.workbooks 
SET prerequisite_workbook_id = (SELECT id FROM public.workbooks WHERE code = {escape_sql(wb['prerequisite_code'])})
WHERE code = {escape_sql(wb['code'])};""")
    lines.append('')

    # 3. Blocks
    lines.append('-- 3. BLOCKS')
    for blk in blocks:
        lines.append(f"""INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = {escape_sql(blk['workbook_code'])}), {escape_sql(blk['code'])}, {escape_sql(blk['title'])}, {blk['order_index']})
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;""")
    lines.append('')

    # 4. Words
    lines.append('-- 4. WORDS (1,000 Target Words)')
    for w in words:
        escaped_syns = [f"'{s.replace(chr(39), chr(39)*2)}'" for s in w['synonyms']]
        syns_escaped = "ARRAY[" + ", ".join(escaped_syns) + "]::text[]"
        lines.append(f"""INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = {escape_sql(w['block_code'])}), {escape_sql(w['word'])}, {escape_sql(w['part_of_speech'])}, {syns_escaped}, {escape_sql(w['application_1'])}, {escape_sql(w['application_2'])}, {w['order_index']})
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;""")
    lines.append('')

    # 5. Exercises
    lines.append('-- 5. EXERCISES (Block 01 - 35 Exercises)')
    for ex in exercises:
        opts_json = json.dumps(ex['options']).replace("'", "''")
        lines.append(f"""INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = {escape_sql(ex['block_code'])}),
    (SELECT id FROM public.words WHERE word = {escape_sql(ex['word'])}),
    {escape_sql(ex['type'])},
    {escape_sql(ex['prompt'])},
    '{opts_json}'::jsonb,
    {escape_sql(ex['correct_answer'])},
    {escape_sql(ex['explanation'])},
    {ex['order_index']}
);""")
    lines.append('')
    lines.append('COMMIT;')

    with open(OUTPUT_SQL, 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))
    print(f'Successfully written {len(lines)} lines to {OUTPUT_SQL}!')

if __name__ == '__main__':
    levels, workbooks, blocks, words, exercises = parse_data()
    generate_sql(levels, workbooks, blocks, words, exercises)
