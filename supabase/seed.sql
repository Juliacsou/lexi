-- ==============================================================================
-- LEXI SEED SCRIPT (Level C1, 5 Workbooks, 100 Blocks, 1000 Words, 35 Exercises)
-- Generated automatically from approved Excel dictionaries
-- ==============================================================================

BEGIN;

-- 1. LEVELS
INSERT INTO public.levels (code, title, description, order_index)
VALUES ('C1', 'C1 — Advanced', 'Advanced English vocabulary (Lexi)', 1)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

-- 2. WORKBOOKS (Initial insert without prerequisite FK)
INSERT INTO public.workbooks (level_id, code, title, difficulty_tier, volume_number, total_blocks_planned, unlock_threshold_percent, publication_status, order_index)
VALUES ((SELECT id FROM public.levels WHERE code = 'C1'), 'C1-FND-01', 'C1 Foundations 1', 1, 1, 20, 70.0, 'published', 1)
ON CONFLICT (level_id, difficulty_tier, volume_number) DO UPDATE 
SET title = EXCLUDED.title, total_blocks_planned = EXCLUDED.total_blocks_planned, unlock_threshold_percent = EXCLUDED.unlock_threshold_percent, publication_status = EXCLUDED.publication_status;
INSERT INTO public.workbooks (level_id, code, title, difficulty_tier, volume_number, total_blocks_planned, unlock_threshold_percent, publication_status, order_index)
VALUES ((SELECT id FROM public.levels WHERE code = 'C1'), 'C1-MOM-01', 'C1 Momentum 1', 2, 1, 20, 70.0, 'published', 2)
ON CONFLICT (level_id, difficulty_tier, volume_number) DO UPDATE 
SET title = EXCLUDED.title, total_blocks_planned = EXCLUDED.total_blocks_planned, unlock_threshold_percent = EXCLUDED.unlock_threshold_percent, publication_status = EXCLUDED.publication_status;
INSERT INTO public.workbooks (level_id, code, title, difficulty_tier, volume_number, total_blocks_planned, unlock_threshold_percent, publication_status, order_index)
VALUES ((SELECT id FROM public.levels WHERE code = 'C1'), 'C1-FLU-01', 'C1 Fluency 1', 3, 1, 20, 70.0, 'published', 3)
ON CONFLICT (level_id, difficulty_tier, volume_number) DO UPDATE 
SET title = EXCLUDED.title, total_blocks_planned = EXCLUDED.total_blocks_planned, unlock_threshold_percent = EXCLUDED.unlock_threshold_percent, publication_status = EXCLUDED.publication_status;
INSERT INTO public.workbooks (level_id, code, title, difficulty_tier, volume_number, total_blocks_planned, unlock_threshold_percent, publication_status, order_index)
VALUES ((SELECT id FROM public.levels WHERE code = 'C1'), 'C1-PRE-01', 'C1 Precision 1', 4, 1, 20, 70.0, 'published', 4)
ON CONFLICT (level_id, difficulty_tier, volume_number) DO UPDATE 
SET title = EXCLUDED.title, total_blocks_planned = EXCLUDED.total_blocks_planned, unlock_threshold_percent = EXCLUDED.unlock_threshold_percent, publication_status = EXCLUDED.publication_status;
INSERT INTO public.workbooks (level_id, code, title, difficulty_tier, volume_number, total_blocks_planned, unlock_threshold_percent, publication_status, order_index)
VALUES ((SELECT id FROM public.levels WHERE code = 'C1'), 'C1-MAS-01', 'C1 Mastery 1', 5, 1, 20, 70.0, 'published', 5)
ON CONFLICT (level_id, difficulty_tier, volume_number) DO UPDATE 
SET title = EXCLUDED.title, total_blocks_planned = EXCLUDED.total_blocks_planned, unlock_threshold_percent = EXCLUDED.unlock_threshold_percent, publication_status = EXCLUDED.publication_status;

-- 2.1 WORKBOOKS (Linking prerequisite_workbook_id)
UPDATE public.workbooks 
SET prerequisite_workbook_id = (SELECT id FROM public.workbooks WHERE code = 'C1-FND-01')
WHERE code = 'C1-MOM-01';
UPDATE public.workbooks 
SET prerequisite_workbook_id = (SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01')
WHERE code = 'C1-FLU-01';
UPDATE public.workbooks 
SET prerequisite_workbook_id = (SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01')
WHERE code = 'C1-PRE-01';
UPDATE public.workbooks 
SET prerequisite_workbook_id = (SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01')
WHERE code = 'C1-MAS-01';

-- 3. BLOCKS
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FND-01'), 'VOC-C1-FND-01-B01', 'Block 01', 1)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FND-01'), 'VOC-C1-FND-01-B02', 'Block 02', 2)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FND-01'), 'VOC-C1-FND-01-B03', 'Block 03', 3)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FND-01'), 'VOC-C1-FND-01-B04', 'Block 04', 4)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FND-01'), 'VOC-C1-FND-01-B05', 'Block 05', 5)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FND-01'), 'VOC-C1-FND-01-B06', 'Block 06', 6)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FND-01'), 'VOC-C1-FND-01-B07', 'Block 07', 7)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FND-01'), 'VOC-C1-FND-01-B08', 'Block 08', 8)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FND-01'), 'VOC-C1-FND-01-B09', 'Block 09', 9)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FND-01'), 'VOC-C1-FND-01-B10', 'Block 10', 10)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FND-01'), 'VOC-C1-FND-01-B11', 'Block 11', 11)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FND-01'), 'VOC-C1-FND-01-B12', 'Block 12', 12)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FND-01'), 'VOC-C1-FND-01-B13', 'Block 13', 13)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FND-01'), 'VOC-C1-FND-01-B14', 'Block 14', 14)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FND-01'), 'VOC-C1-FND-01-B15', 'Block 15', 15)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FND-01'), 'VOC-C1-FND-01-B16', 'Block 16', 16)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FND-01'), 'VOC-C1-FND-01-B17', 'Block 17', 17)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FND-01'), 'VOC-C1-FND-01-B18', 'Block 18', 18)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FND-01'), 'VOC-C1-FND-01-B19', 'Block 19', 19)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FND-01'), 'VOC-C1-FND-01-B20', 'Block 20', 20)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01'), 'VOC-C1-MOM-01-B01', 'Block 01', 1)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01'), 'VOC-C1-MOM-01-B02', 'Block 02', 2)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01'), 'VOC-C1-MOM-01-B03', 'Block 03', 3)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01'), 'VOC-C1-MOM-01-B04', 'Block 04', 4)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01'), 'VOC-C1-MOM-01-B05', 'Block 05', 5)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01'), 'VOC-C1-MOM-01-B06', 'Block 06', 6)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01'), 'VOC-C1-MOM-01-B07', 'Block 07', 7)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01'), 'VOC-C1-MOM-01-B08', 'Block 08', 8)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01'), 'VOC-C1-MOM-01-B09', 'Block 09', 9)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01'), 'VOC-C1-MOM-01-B10', 'Block 10', 10)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01'), 'VOC-C1-MOM-01-B11', 'Block 11', 11)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01'), 'VOC-C1-MOM-01-B12', 'Block 12', 12)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01'), 'VOC-C1-MOM-01-B13', 'Block 13', 13)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01'), 'VOC-C1-MOM-01-B14', 'Block 14', 14)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01'), 'VOC-C1-MOM-01-B15', 'Block 15', 15)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01'), 'VOC-C1-MOM-01-B16', 'Block 16', 16)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01'), 'VOC-C1-MOM-01-B17', 'Block 17', 17)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01'), 'VOC-C1-MOM-01-B18', 'Block 18', 18)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01'), 'VOC-C1-MOM-01-B19', 'Block 19', 19)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MOM-01'), 'VOC-C1-MOM-01-B20', 'Block 20', 20)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01'), 'VOC-C1-FLU-01-B01', 'Block 01', 1)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01'), 'VOC-C1-FLU-01-B02', 'Block 02', 2)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01'), 'VOC-C1-FLU-01-B03', 'Block 03', 3)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01'), 'VOC-C1-FLU-01-B04', 'Block 04', 4)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01'), 'VOC-C1-FLU-01-B05', 'Block 05', 5)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01'), 'VOC-C1-FLU-01-B06', 'Block 06', 6)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01'), 'VOC-C1-FLU-01-B07', 'Block 07', 7)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01'), 'VOC-C1-FLU-01-B08', 'Block 08', 8)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01'), 'VOC-C1-FLU-01-B09', 'Block 09', 9)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01'), 'VOC-C1-FLU-01-B10', 'Block 10', 10)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01'), 'VOC-C1-FLU-01-B11', 'Block 11', 11)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01'), 'VOC-C1-FLU-01-B12', 'Block 12', 12)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01'), 'VOC-C1-FLU-01-B13', 'Block 13', 13)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01'), 'VOC-C1-FLU-01-B14', 'Block 14', 14)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01'), 'VOC-C1-FLU-01-B15', 'Block 15', 15)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01'), 'VOC-C1-FLU-01-B16', 'Block 16', 16)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01'), 'VOC-C1-FLU-01-B17', 'Block 17', 17)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01'), 'VOC-C1-FLU-01-B18', 'Block 18', 18)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01'), 'VOC-C1-FLU-01-B19', 'Block 19', 19)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-FLU-01'), 'VOC-C1-FLU-01-B20', 'Block 20', 20)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01'), 'VOC-C1-PRE-01-B01', 'Block 01', 1)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01'), 'VOC-C1-PRE-01-B02', 'Block 02', 2)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01'), 'VOC-C1-PRE-01-B03', 'Block 03', 3)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01'), 'VOC-C1-PRE-01-B04', 'Block 04', 4)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01'), 'VOC-C1-PRE-01-B05', 'Block 05', 5)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01'), 'VOC-C1-PRE-01-B06', 'Block 06', 6)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01'), 'VOC-C1-PRE-01-B07', 'Block 07', 7)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01'), 'VOC-C1-PRE-01-B08', 'Block 08', 8)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01'), 'VOC-C1-PRE-01-B09', 'Block 09', 9)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01'), 'VOC-C1-PRE-01-B10', 'Block 10', 10)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01'), 'VOC-C1-PRE-01-B11', 'Block 11', 11)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01'), 'VOC-C1-PRE-01-B12', 'Block 12', 12)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01'), 'VOC-C1-PRE-01-B13', 'Block 13', 13)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01'), 'VOC-C1-PRE-01-B14', 'Block 14', 14)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01'), 'VOC-C1-PRE-01-B15', 'Block 15', 15)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01'), 'VOC-C1-PRE-01-B16', 'Block 16', 16)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01'), 'VOC-C1-PRE-01-B17', 'Block 17', 17)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01'), 'VOC-C1-PRE-01-B18', 'Block 18', 18)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01'), 'VOC-C1-PRE-01-B19', 'Block 19', 19)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-PRE-01'), 'VOC-C1-PRE-01-B20', 'Block 20', 20)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MAS-01'), 'VOC-C1-MAS-01-B01', 'Block 01', 1)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MAS-01'), 'VOC-C1-MAS-01-B02', 'Block 02', 2)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MAS-01'), 'VOC-C1-MAS-01-B03', 'Block 03', 3)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MAS-01'), 'VOC-C1-MAS-01-B04', 'Block 04', 4)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MAS-01'), 'VOC-C1-MAS-01-B05', 'Block 05', 5)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MAS-01'), 'VOC-C1-MAS-01-B06', 'Block 06', 6)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MAS-01'), 'VOC-C1-MAS-01-B07', 'Block 07', 7)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MAS-01'), 'VOC-C1-MAS-01-B08', 'Block 08', 8)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MAS-01'), 'VOC-C1-MAS-01-B09', 'Block 09', 9)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MAS-01'), 'VOC-C1-MAS-01-B10', 'Block 10', 10)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MAS-01'), 'VOC-C1-MAS-01-B11', 'Block 11', 11)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MAS-01'), 'VOC-C1-MAS-01-B12', 'Block 12', 12)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MAS-01'), 'VOC-C1-MAS-01-B13', 'Block 13', 13)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MAS-01'), 'VOC-C1-MAS-01-B14', 'Block 14', 14)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MAS-01'), 'VOC-C1-MAS-01-B15', 'Block 15', 15)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MAS-01'), 'VOC-C1-MAS-01-B16', 'Block 16', 16)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MAS-01'), 'VOC-C1-MAS-01-B17', 'Block 17', 17)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MAS-01'), 'VOC-C1-MAS-01-B18', 'Block 18', 18)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MAS-01'), 'VOC-C1-MAS-01-B19', 'Block 19', 19)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;
INSERT INTO public.blocks (workbook_id, code, title, order_index)
VALUES ((SELECT id FROM public.workbooks WHERE code = 'C1-MAS-01'), 'VOC-C1-MAS-01-B20', 'Block 20', 20)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, order_index = EXCLUDED.order_index;

-- 4. WORDS (1,000 Target Words)
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'), 'loyalty', 'noun', ARRAY['devotion', 'faithfulness', 'allegiance', 'steadfast support']::text[], 'Her loyalty to the team never changed, even when the project became difficult.', 'Customer loyalty takes time to build and can disappear after one bad experience.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'), 'reluctant', 'adjective', ARRAY['hesitant', 'unwilling', 'disinclined', 'resistant']::text[], 'I''m reluctant to accept the offer before I know the full cost.', 'He was reluctant to bring up the issue during the meeting.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'), 'viable', 'adjective', ARRAY['workable', 'feasible', 'practical', 'achievable']::text[], 'Working remotely is a viable option for most of our team.', 'The cheaper plan looked appealing, but it wasn''t financially viable.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'), 'fade', 'verb', ARRAY['diminish', 'weaken', 'dwindle', 'disappear gradually']::text[], 'The noise outside began to fade once the traffic cleared.', 'My excitement started to fade when I saw how complicated the process was.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'), 'transparent', 'adjective', ARRAY['open', 'honest', 'straightforward', 'clear']::text[], 'We need to be transparent about why the launch was delayed.', 'The company promised a more transparent hiring process.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'), 'tactic', 'noun', ARRAY['strategy', 'approach', 'method', 'maneuver']::text[], 'Offering a free trial was a smart tactic for attracting new customers.', 'Her usual tactic is to ask questions rather than argue.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'), 'sentiment', 'noun', ARRAY['feeling', 'attitude', 'opinion', 'mood']::text[], 'The general sentiment in the office was positive after the announcement.', 'I understand the sentiment, but I don''t agree with the decision.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'), 'enrich', 'verb', ARRAY['improve', 'enhance', 'broaden', 'deepen']::text[], 'Travel can enrich your understanding of other cultures.', 'The examples really enrich the explanation and make it easier to follow.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'), 'defect', 'noun', ARRAY['flaw', 'fault', 'imperfection', 'shortcoming']::text[], 'The manufacturer replaced the phone because of a screen defect.', 'A minor defect in the software caused the app to crash.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'), 'superb', 'adjective', ARRAY['excellent', 'outstanding', 'exceptional', 'first-rate']::text[], 'The food was superb, especially the homemade pasta.', 'She did a superb job explaining a complex topic to the group.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B02'), 'sustain', 'verb', ARRAY['maintain', 'support', 'uphold', 'keep going']::text[], 'It''s hard to sustain that pace without taking a break.', 'Small businesses need steady sales to sustain their operations.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B02'), 'revenge', 'noun', ARRAY['retaliation', 'retribution', 'payback', 'vengeance']::text[], 'He wanted revenge after being treated unfairly at work.', 'Seeking revenge rarely solves the problem that started the conflict.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B02'), 'toxic', 'adjective', ARRAY['harmful', 'poisonous', 'unhealthy', 'damaging']::text[], 'That conversation turned toxic as soon as people started insulting each other.', 'The cleanup team found toxic chemicals in the old building.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B02'), 'clash', 'noun', ARRAY['conflict', 'disagreement', 'confrontation', 'dispute']::text[], 'We had a clash over the budget, but we eventually found a compromise.', 'A clash of personalities made the project harder than expected.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B02'), 'eager', 'adjective', ARRAY['keen', 'enthusiastic', 'excited', 'impatient to begin']::text[], 'She''s eager to learn how the new software works.', 'The kids were eager to open their presents after breakfast.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B02'), 'hopeful', 'adjective', ARRAY['optimistic', 'encouraged', 'confident', 'positive']::text[], 'I''m hopeful that we can finish the project by Friday.', 'The doctor sounded hopeful about her recovery.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B02'), 'obsess', 'verb', ARRAY['fixate on', 'dwell on', 'be consumed by', 'think constantly about']::text[], 'Try not to obsess over one negative comment online.', 'He tends to obsess about small mistakes even after a successful presentation.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B02'), 'flaw', 'noun', ARRAY['defect', 'weakness', 'imperfection', 'shortcoming']::text[], 'There''s a major flaw in the plan that we need to address.', 'I love the apartment, but the lack of natural light is a flaw.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B02'), 'consent', 'noun', ARRAY['permission', 'approval', 'agreement', 'authorization']::text[], 'You need the customer''s consent before sharing their personal data.', 'She gave her consent after the doctor explained the procedure.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B02'), 'distress', 'noun', ARRAY['anxiety', 'anguish', 'suffering', 'upset']::text[], 'The unexpected news caused a lot of distress in the family.', 'You could hear the distress in his voice when he called.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B03'), 'worthy', 'adjective', ARRAY['deserving', 'meritorious', 'worthwhile', 'admirable']::text[], 'That''s a worthy cause, and I''d be happy to contribute.', 'She proved herself worthy of the responsibility.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B03'), 'confront', 'verb', ARRAY['face', 'tackle', 'address', 'challenge']::text[], 'We need to confront the issue instead of ignoring it.', 'I finally decided to confront him about the missing documents.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B03'), 'odds', 'noun', ARRAY['chances', 'likelihood', 'probability', 'prospects']::text[], 'The odds of finding a parking spot here are pretty low.', 'Despite the odds, they managed to finish the project on time.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B03'), 'revive', 'verb', ARRAY['restore', 'renew', 'bring back', 'reinvigorate']::text[], 'A quick walk helped revive my energy after lunch.', 'The new manager hopes to revive interest in the struggling product.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B03'), 'oblige', 'verb', ARRAY['accommodate', 'comply with a request', 'do a favor for', 'help willingly']::text[], 'The hotel staff were happy to oblige when we asked for an extra towel.', 'I would gladly oblige if you needed help with the boxes.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B03'), 'soar', 'verb', ARRAY['rise sharply', 'climb rapidly', 'surge', 'shoot up']::text[], 'Ticket prices tend to soar during the holidays.', 'Her confidence began to soar after the first successful presentation.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B03'), 'persist', 'verb', ARRAY['continue', 'endure', 'carry on', 'remain']::text[], 'A problem can persist even after you restart your phone.', 'She continued to persist despite several setbacks.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B03'), 'mere', 'adjective', ARRAY['only', 'just', 'nothing more than', 'no more than']::text[], 'A mere five minutes of exercise can help me clear my head.', 'It wasn''t a mere suggestion; it was a firm instruction.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B03'), 'breakthrough', 'noun', ARRAY['major advance', 'turning point', 'significant discovery', 'leap forward']::text[], 'We finally had a breakthrough after weeks of testing.', 'The new treatment could be a breakthrough for patients with this condition.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B03'), 'renowned', 'adjective', ARRAY['famous', 'well-known', 'celebrated', 'acclaimed']::text[], 'The restaurant is renowned for its seafood.', 'She''s a renowned researcher who speaks at conferences around the world.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B04'), 'niche', 'noun', ARRAY['specialized area', 'narrow market', 'particular segment', 'specific interest']::text[], 'The company found a niche selling accessories for older cars.', 'He writes about a niche topic, but his audience is very loyal.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B04'), 'bounce', 'verb', ARRAY['rebound', 'spring back', 'ricochet', 'recover']::text[], 'The ball hit the wall and started to bounce across the floor.', 'Sales usually bounce back after the slow summer months.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B04'), 'betray', 'verb', ARRAY['deceive', 'double-cross', 'be disloyal to', 'break someone''s trust']::text[], 'It hurt when a close friend chose to betray my confidence.', 'Don''t betray the ending of the movie before I''ve seen it.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B04'), 'retrieve', 'verb', ARRAY['recover', 'get back', 'regain', 'fetch']::text[], 'Can you retrieve the document from the shared folder?', 'I went back to the café to retrieve my forgotten jacket.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B04'), 'robust', 'adjective', ARRAY['strong', 'sturdy', 'resilient', 'solid']::text[], 'We need a robust system that won''t fail during peak traffic.', 'The new suitcase feels much more robust than the old one.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B04'), 'mercy', 'noun', ARRAY['compassion', 'clemency', 'forgiveness', 'leniency']::text[], 'The judge showed mercy because it was his first offense.', 'After three hours in the heat, we were at the mercy of the weather.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B04'), 'shrug', 'verb', ARRAY['raise one''s shoulders', 'gesture indifferently', 'signal uncertainty', 'dismiss with a gesture']::text[], 'He just gave a shrug when I asked why the meeting was canceled.', 'I tried to shrug off the criticism and focus on improving.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B04'), 'outlook', 'noun', ARRAY['perspective', 'attitude', 'forecast', 'prospects']::text[], 'Her positive outlook makes difficult days easier.', 'The economic outlook for next year remains uncertain.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B04'), 'cling', 'verb', ARRAY['hold tightly', 'grip', 'stick to', 'hold on']::text[], 'The child continued to cling to her mother''s hand in the crowd.', 'It''s easy to cling to old habits when a new routine feels unfamiliar.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B04'), 'backup', 'noun', ARRAY['reserve', 'substitute', 'alternative', 'spare']::text[], 'Always keep a backup of your important files.', 'We have a backup plan in case the venue cancels.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B05'), 'glimpse', 'noun', ARRAY['quick look', 'brief view', 'peek', 'fleeting sight']::text[], 'I caught a glimpse of the new office as we walked past.', 'The trailer gives us a glimpse of what the next season will be like.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B05'), 'bonus', 'noun', ARRAY['extra payment', 'reward', 'perk', 'additional benefit']::text[], 'The team received a bonus for exceeding its sales target.', 'Free delivery is a nice bonus when you order online.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B05'), 'chaos', 'noun', ARRAY['disorder', 'confusion', 'turmoil', 'mayhem']::text[], 'The airport was in chaos after several flights were canceled.', 'The house was complete chaos while we were renovating the kitchen.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B05'), 'thoughtful', 'adjective', ARRAY['considerate', 'attentive', 'caring', 'kind']::text[], 'It was thoughtful of you to remember her birthday.', 'She gave a thoughtful answer rather than responding immediately.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B05'), 'thrilled', 'adjective', ARRAY['delighted', 'overjoyed', 'ecstatic', 'excited']::text[], 'I''m thrilled that you got the job!', 'The kids were thrilled to see snow for the first time.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B05'), 'shrink', 'verb', ARRAY['contract', 'decrease', 'reduce', 'get smaller']::text[], 'My favorite sweater started to shrink after I washed it in hot water.', 'The company had to shrink its budget when sales fell.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B05'), 'pushback', 'noun', ARRAY['resistance', 'opposition', 'objections', 'criticism']::text[], 'We got some pushback when we proposed changing the schedule.', 'Expect a little pushback if you introduce the policy without explaining it.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B05'), 'stumble', 'verb', ARRAY['trip', 'lose one''s footing', 'falter', 'make a misstep']::text[], 'I almost stumble every time I walk across that uneven sidewalk.', 'It''s normal to stumble over unfamiliar words when speaking another language.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B05'), 'absent', 'adjective', ARRAY['missing', 'away', 'not present', 'unavailable']::text[], 'Three people were absent from the training session.', 'His name was absent from the list, so we checked the registration.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B05'), 'absurd', 'adjective', ARRAY['ridiculous', 'unreasonable', 'nonsensical', 'preposterous']::text[], 'It''s absurd to expect everyone to answer messages at midnight.', 'The price was so absurd that we decided to look elsewhere.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B06'), 'sigh', 'noun', ARRAY['exhalation', 'breath of relief', 'weary breath', 'deep breath']::text[], 'She let out a sigh of relief when she heard the good news.', 'He gave a long sigh and closed his laptop for the night.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B06'), 'haunt', 'verb', ARRAY['trouble', 'torment', 'linger in someone''s mind', 'keep returning to']::text[], 'That embarrassing moment still seems to haunt him years later.', 'The memory of that accident continues to haunt the neighborhood.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B06'), 'fate', 'noun', ARRAY['destiny', 'fortune', 'eventual outcome', 'lot in life']::text[], 'We won''t know the fate of the project until the board votes.', 'By a strange twist of fate, we ended up on the same flight.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B06'), 'shatter', 'verb', ARRAY['break apart', 'smash', 'destroy', 'crush']::text[], 'Be careful not to shatter the glass when you move the table.', 'The unexpected rejection seemed to shatter his confidence.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B06'), 'timely', 'adjective', ARRAY['well-timed', 'opportune', 'prompt', 'happening at the right moment']::text[], 'Your timely reminder saved me from missing the deadline.', 'The report came at a timely moment, just before the client meeting.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B06'), 'vague', 'adjective', ARRAY['unclear', 'imprecise', 'ambiguous', 'hazy']::text[], 'The instructions were too vague for anyone to follow.', 'He gave a vague answer when I asked about the budget.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B06'), 'grief', 'noun', ARRAY['sorrow', 'sadness', 'heartbreak', 'mourning']::text[], 'She needed time to deal with her grief after losing her father.', 'The family received a lot of support during their grief.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B06'), 'handful', 'noun', ARRAY['small number', 'few', 'small amount', 'limited group']::text[], 'Only a handful of people showed up to the early meeting.', 'My nephew is a handful when he skips his afternoon nap.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B06'), 'outrage', 'noun', ARRAY['anger', 'indignation', 'fury', 'public anger']::text[], 'The sudden price increase caused outrage among customers.', 'She expressed outrage at how unfairly the staff had been treated.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B06'), 'fatal', 'adjective', ARRAY['deadly', 'lethal', 'life-threatening', 'causing death']::text[], 'The accident could have been fatal without a seat belt.', 'A fatal error caused the program to stop unexpectedly.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B07'), 'cautious', 'adjective', ARRAY['careful', 'wary', 'prudent', 'guarded']::text[], 'I''m cautious about sharing personal information online.', 'She gave a cautious response because the figures weren''t final.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B07'), 'linger', 'verb', ARRAY['remain', 'stay on', 'persist', 'hang around']::text[], 'The smell of fresh bread continued to linger in the kitchen.', 'We decided to linger after dinner and finish our conversation.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B07'), 'lengthy', 'adjective', ARRAY['long', 'prolonged', 'extended', 'time-consuming']::text[], 'We had a lengthy discussion about the next release.', 'The application process is surprisingly lengthy.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B07'), 'dual', 'adjective', ARRAY['double', 'twofold', 'having two parts', 'combined']::text[], 'She has a dual role as a designer and project manager.', 'This charger has a dual purpose: it powers both my phone and laptop.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B07'), 'conceal', 'verb', ARRAY['hide', 'cover up', 'keep secret', 'disguise']::text[], 'He tried to conceal his disappointment when the trip was canceled.', 'The cabinet was designed to conceal the cables behind the TV.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B07'), 'portray', 'verb', ARRAY['depict', 'present', 'represent', 'describe']::text[], 'The article tries to portray the situation fairly.', 'The actor managed to portray a difficult character with real warmth.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B07'), 'thrive', 'verb', ARRAY['flourish', 'prosper', 'do well', 'succeed']::text[], 'Some plants thrive in bright sunlight.', 'She seems to thrive when she''s given difficult problems to solve.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B07'), 'endure', 'verb', ARRAY['withstand', 'tolerate', 'bear', 'survive']::text[], 'I don''t think I could endure another six-hour delay.', 'The building was designed to endure extreme weather conditions.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B07'), 'neglect', 'noun', ARRAY['inattention', 'disregard', 'lack of care', 'failure to maintain']::text[], 'The garden suffered from neglect while the owners were away.', 'Years of neglect left the building in poor condition.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B07'), 'humble', 'adjective', ARRAY['modest', 'unassuming', 'down-to-earth', 'unpretentious']::text[], 'Despite her success, she''s still a humble person.', 'He came from humble beginnings and worked his way up.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B08'), 'stark', 'adjective', ARRAY['striking', 'sharp', 'severe', 'unmistakable']::text[], 'There''s a stark difference between the two offers.', 'The room looked stark without any pictures or furniture.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B08'), 'grin', 'noun', ARRAY['wide smile', 'broad smile', 'beam', 'delighted smile']::text[], 'He walked in with a grin after hearing he''d been promoted.', 'I couldn''t hide my grin when she told me the surprise was for me.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B08'), 'defy', 'verb', ARRAY['resist', 'challenge', 'disobey', 'go against']::text[], 'The little team managed to defy expectations and win.', 'It''s risky to defy safety rules just to save a few minutes.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B08'), 'bare', 'adjective', ARRAY['uncovered', 'exposed', 'empty', 'plain']::text[], 'The walls were bare after we took down the pictures.', 'He walked across the beach in his bare feet.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B08'), 'disclose', 'verb', ARRAY['reveal', 'make known', 'divulge', 'share']::text[], 'Please disclose any potential conflicts of interest before the meeting.', 'She didn''t want to disclose her salary during the interview.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B08'), 'handy', 'adjective', ARRAY['useful', 'convenient', 'practical', 'helpful']::text[], 'This small flashlight is handy during power cuts.', 'It''s handy to keep a copy of your passport on your phone.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B08'), 'nonsense', 'noun', ARRAY['rubbish', 'absurdity', 'foolishness', 'meaningless talk']::text[], 'That rumor is complete nonsense, so don''t spread it.', 'We spent the whole evening talking nonsense and laughing.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B08'), 'striking', 'adjective', ARRAY['remarkable', 'noticeable', 'impressive', 'eye-catching']::text[], 'There''s a striking similarity between the two designs.', 'The sunset was so striking that everyone stopped to take photos.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B08'), 'hostile', 'adjective', ARRAY['unfriendly', 'antagonistic', 'aggressive', 'opposed']::text[], 'The customer became hostile when we explained the policy.', 'The new proposal received a hostile reaction from several managers.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B08'), 'vanish', 'verb', ARRAY['disappear', 'fade away', 'go missing', 'dissolve into nothing']::text[], 'My keys always seem to vanish when I''m running late.', 'The discount will vanish at midnight, so check the deadline.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B09'), 'worthwhile', 'adjective', ARRAY['valuable', 'rewarding', 'beneficial', 'worth the effort']::text[], 'The course was expensive, but it was worthwhile.', 'It''s worthwhile to practice speaking for a few minutes every day.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B09'), 'bizarre', 'adjective', ARRAY['strange', 'weird', 'peculiar', 'outlandish']::text[], 'I had a bizarre dream about missing my own wedding.', 'It was bizarre to see the office completely empty on a Monday.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B09'), 'postpone', 'verb', ARRAY['delay', 'defer', 'reschedule', 'put off']::text[], 'We may need to postpone the meeting until next week.', 'They decided to postpone the wedding because of the storm.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B09'), 'leap', 'noun', ARRAY['jump', 'bound', 'sudden increase', 'big advance']::text[], 'The company made a huge leap in sales last quarter.', 'It takes a leap of faith to leave a secure job for a new idea.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B09'), 'blunt', 'adjective', ARRAY['direct', 'frank', 'straightforward', 'plainspoken']::text[], 'I appreciate honest feedback, but his comments were too blunt.', 'She was blunt about the risks of launching too early.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B09'), 'frankly', 'adverb', ARRAY['honestly', 'candidly', 'openly', 'to be direct']::text[], 'Frankly, I expected a better result from that test.', 'I don''t think the plan is realistic, frankly.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B09'), 'query', 'noun', ARRAY['question', 'inquiry', 'request for information', 'doubt']::text[], 'Send us a query if you''re having trouble with your account.', 'The database query took longer than expected to run.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B09'), 'flawed', 'adjective', ARRAY['defective', 'imperfect', 'faulty', 'unsound']::text[], 'The proposal is flawed because it ignores staffing costs.', 'We returned the product after discovering it was flawed.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B09'), 'breakdown', 'noun', ARRAY['failure', 'collapse', 'malfunction', 'disruption']::text[], 'The train stopped because of a mechanical breakdown.', 'A breakdown in communication caused the confusion.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B09'), 'resume', 'verb', ARRAY['restart', 'continue', 'pick up again', 'carry on']::text[], 'Let''s resume the discussion after lunch.', 'Classes will resume on Monday after the holiday.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B10'), 'mainstream', 'adjective', ARRAY['conventional', 'widely accepted', 'popular', 'established']::text[], 'Streaming music has become mainstream in recent years.', 'The idea was once unusual but is now part of mainstream thinking.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B10'), 'strive', 'verb', ARRAY['try hard', 'work toward', 'make every effort', 'aim']::text[], 'We strive to give every customer a clear answer.', 'She continues to strive for a better work-life balance.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B10'), 'grace', 'noun', ARRAY['elegance', 'poise', 'refinement', 'dignity']::text[], 'She handled the awkward question with grace.', 'The dancer moved across the stage with remarkable grace.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B10'), 'boast', 'verb', ARRAY['brag', 'show off', 'talk proudly', 'pride oneself']::text[], 'He likes to boast about how early he wakes up.', 'The hotel can boast a fantastic view of the mountains.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B10'), 'glance', 'noun', ARRAY['quick look', 'peek', 'brief look', 'fleeting look']::text[], 'I took a glance at my phone and realized it was late.', 'At first glance, the two contracts looked identical.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B10'), 'harsh', 'adjective', ARRAY['severe', 'tough', 'cruel', 'rough']::text[], 'The manager''s criticism felt unnecessarily harsh.', 'The plants couldn''t survive the harsh winter weather.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B10'), 'tempt', 'verb', ARRAY['entice', 'attract', 'lure', 'persuade']::text[], 'Don''t tempt me with dessert when I''m trying to eat less sugar.', 'The discount might tempt some customers to upgrade.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B10'), 'guilt', 'noun', ARRAY['remorse', 'regret', 'self-reproach', 'sense of wrongdoing']::text[], 'She felt guilt about missing her friend''s graduation.', 'He carried a lot of guilt after the argument.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B10'), 'disrupt', 'verb', ARRAY['interrupt', 'disturb', 'upset', 'interfere with']::text[], 'The roadworks could disrupt traffic for several days.', 'One unexpected question managed to disrupt the whole presentation.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B10'), 'mentor', 'noun', ARRAY['adviser', 'coach', 'guide', 'experienced counselor']::text[], 'My mentor helped me prepare for my first management role.', 'My mentor suggested that I apply for the course.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B11'), 'frustration', 'noun', ARRAY['irritation', 'annoyance', 'exasperation', 'disappointment']::text[], 'I could hear the frustration in her voice when the website failed again.', 'After weeks of delays, everyone''s frustration was understandable.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B11'), 'overwhelm', 'verb', ARRAY['overload', 'overpower', 'overburden', 'flood']::text[], 'Too many notifications can overwhelm you during the workday.', 'The number of requests began to overwhelm the support team.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B11'), 'guidance', 'noun', ARRAY['advice', 'direction', 'support', 'instruction']::text[], 'I could use some guidance on choosing the right course.', 'The new employees received guidance from their team leader.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B11'), 'legitimate', 'adjective', ARRAY['valid', 'justified', 'lawful', 'genuine']::text[], 'That''s a legitimate concern, and we should address it.', 'Make sure you''re buying tickets from a legitimate seller.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B11'), 'fairness', 'noun', ARRAY['justice', 'impartiality', 'equity', 'even-handedness']::text[], 'Employees questioned the fairness of the new bonus policy.', 'It''s important to treat both sides with fairness.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B11'), 'rational', 'adjective', ARRAY['reasonable', 'logical', 'sensible', 'clear-headed']::text[], 'Let''s make a rational decision instead of rushing.', 'Her explanation was rational, even if we disagreed.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B11'), 'burden', 'noun', ARRAY['load', 'responsibility', 'strain', 'hardship']::text[], 'I don''t want to be a burden while you''re busy.', 'The extra paperwork became a burden for small businesses.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B11'), 'fragile', 'adjective', ARRAY['delicate', 'breakable', 'vulnerable', 'easily damaged']::text[], 'Be careful with that box; the contents are fragile.', 'Their agreement is still fragile after last week''s argument.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B11'), 'fierce', 'adjective', ARRAY['intense', 'strong', 'aggressive', 'powerful']::text[], 'Competition for those jobs is fierce.', 'A fierce storm kept everyone inside all evening.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B11'), 'rage', 'noun', ARRAY['fury', 'anger', 'wrath', 'outrage']::text[], 'He struggled to control his rage after hearing the accusation.', 'There was a lot of rage online about the new policy.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B12'), 'engaging', 'adjective', ARRAY['interesting', 'captivating', 'appealing', 'absorbing']::text[], 'The speaker was engaging, even when the subject got technical.', 'It''s easier to finish a book when the writing is engaging.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B12'), 'overlook', 'verb', ARRAY['miss', 'fail to notice', 'ignore', 'neglect']::text[], 'It''s easy to overlook a small typo in a long report.', 'Don''t overlook the cheaper option just because it''s less popular.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B12'), 'buddy', 'noun', ARRAY['friend', 'pal', 'mate', 'companion']::text[], 'I went to the game with an old buddy from college.', 'My workout buddy keeps me motivated on difficult days.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B12'), 'clarity', 'noun', ARRAY['clearness', 'precision', 'lucidity', 'transparency']::text[], 'Could you explain that again for clarity?', 'The instructions need more clarity before we publish them.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B12'), 'affection', 'noun', ARRAY['fondness', 'warmth', 'tenderness', 'love']::text[], 'You can tell she has a lot of affection for her grandparents.', 'The dog showed his affection by following us everywhere.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B12'), 'intriguing', 'adjective', ARRAY['fascinating', 'interesting', 'captivating', 'thought-provoking']::text[], 'That''s an intriguing idea; I''d like to hear more.', 'The podcast raised an intriguing question about memory.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B12'), 'authentic', 'adjective', ARRAY['genuine', 'real', 'original', 'true']::text[], 'The restaurant serves authentic regional dishes.', 'People responded well because her story felt authentic.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B12'), 'tolerate', 'verb', ARRAY['put up with', 'endure', 'bear', 'accept']::text[], 'I can tolerate a little noise, but not all night.', 'We shouldn''t tolerate rude behavior at work.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B12'), 'compromise', 'noun', ARRAY['agreement', 'middle ground', 'concession', 'settlement']::text[], 'We reached a compromise after talking through both options.', 'Choosing a smaller apartment was a compromise we could live with.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B12'), 'vibrant', 'adjective', ARRAY['lively', 'energetic', 'colorful', 'dynamic']::text[], 'The neighborhood has a vibrant music scene.', 'She chose a vibrant shade of blue for the kitchen.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B13'), 'resentful', 'adjective', ARRAY['bitter', 'aggrieved', 'indignant', 'harboring resentment']::text[], 'He felt resentful after being passed over for promotion.', 'I don''t want to become resentful over something we can discuss.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B13'), 'notify', 'verb', ARRAY['inform', 'alert', 'advise', 'tell']::text[], 'Please notify me when the package arrives.', 'The system will notify you if your password changes.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B13'), 'utterly', 'adverb', ARRAY['completely', 'totally', 'entirely', 'absolutely']::text[], 'I was utterly exhausted after the overnight flight.', 'The explanation was utterly confusing to me.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B13'), 'notable', 'adjective', ARRAY['remarkable', 'noteworthy', 'significant', 'prominent']::text[], 'There was a notable improvement in her pronunciation.', 'Several notable guests attended the opening event.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B13'), 'objection', 'noun', ARRAY['protest', 'opposition', 'complaint', 'reservation']::text[], 'Does anyone have an objection to moving the meeting?', 'My only objection is that the plan will cost too much.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B13'), 'compelling', 'adjective', ARRAY['convincing', 'persuasive', 'powerful', 'gripping']::text[], 'She made a compelling case for changing the policy.', 'The documentary tells a compelling story about the community.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B13'), 'credible', 'adjective', ARRAY['believable', 'trustworthy', 'convincing', 'reliable']::text[], 'We need a credible source before sharing that claim.', 'His explanation sounded credible after we checked the dates.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B13'), 'tremendous', 'adjective', ARRAY['enormous', 'huge', 'immense', 'exceptional']::text[], 'The team made tremendous progress in just two weeks.', 'Thanks for your tremendous help with the move.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B13'), 'dilemma', 'noun', ARRAY['predicament', 'difficult choice', 'quandary', 'tough decision']::text[], 'I''m facing a dilemma: take the new job or stay near family.', 'The company has a dilemma about raising prices.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B13'), 'horizon', 'noun', ARRAY['skyline', 'distant view', 'visible boundary', 'outlook']::text[], 'Dark clouds were gathering on the horizon.', 'We can already see new opportunities on the horizon.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B14'), 'meaningful', 'adjective', ARRAY['significant', 'worthwhile', 'important', 'purposeful']::text[], 'I''d rather have one meaningful conversation than dozens of messages.', 'The survey led to meaningful changes in the workplace.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B14'), 'overwhelmed', 'adjective', ARRAY['overloaded', 'swamped', 'overburdened', 'stressed']::text[], 'I felt overwhelmed by all the messages after my vacation.', 'She felt overwhelmed when all three deadlines moved to Friday.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B14'), 'interfere', 'verb', ARRAY['meddle', 'intrude', 'disrupt', 'obstruct']::text[], 'I don''t want to interfere with your plans.', 'The noise from the construction site can interfere with calls.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B14'), 'seemingly', 'adverb', ARRAY['apparently', 'outwardly', 'on the face of it', 'at first sight']::text[], 'It was a seemingly simple task that took all afternoon.', 'He was seemingly calm despite the long delay.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B14'), 'frustrated', 'adjective', ARRAY['annoyed', 'discouraged', 'exasperated', 'irritated']::text[], 'I get frustrated when the app loses my progress.', 'She sounded frustrated after her flight was canceled twice.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B14'), 'persistent', 'adjective', ARRAY['determined', 'tenacious', 'unrelenting', 'lasting']::text[], 'She''s persistent about following up until she gets an answer.', 'The doctor asked about my persistent cough.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B14'), 'competent', 'adjective', ARRAY['capable', 'skilled', 'proficient', 'qualified']::text[], 'He''s a competent driver, even in heavy traffic.', 'We need someone competent to manage the new system.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B14'), 'reassure', 'verb', ARRAY['comfort', 'calm', 'put at ease', 'restore confidence']::text[], 'I called to reassure her that everything was going to plan.', 'A clear explanation can reassure customers during a delay.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B14'), 'suspicious', 'adjective', ARRAY['distrustful', 'wary', 'doubtful', 'skeptical']::text[], 'I was suspicious of the message because the link looked strange.', 'I am suspicious of offers that ask for payment up front.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B14'), 'compassion', 'noun', ARRAY['empathy', 'kindness', 'sympathy', 'concern']::text[], 'She treated the frustrated customer with compassion.', 'A little compassion can make a difficult conversation easier.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B15'), 'solely', 'adverb', ARRAY['only', 'exclusively', 'entirely', 'just']::text[], 'The decision wasn''t based solely on price.', 'This entrance is solely for staff members.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B15'), 'legacy', 'noun', ARRAY['lasting impact', 'inheritance', 'heritage', 'enduring contribution']::text[], 'The founder''s legacy is still visible in how the company operates.', 'She wants to leave a legacy of better public education.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B15'), 'appealing', 'adjective', ARRAY['attractive', 'inviting', 'enticing', 'tempting']::text[], 'The new apartment looks appealing, but it''s far from work.', 'A flexible schedule is appealing to many employees.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B15'), 'supportive', 'adjective', ARRAY['encouraging', 'helpful', 'understanding', 'reassuring']::text[], 'My colleagues were incredibly supportive during the transition.', 'It''s easier to learn when your teacher is supportive.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B15'), 'empower', 'verb', ARRAY['enable', 'equip', 'give authority to', 'strengthen']::text[], 'The training will empower employees to solve problems independently.', 'Good managers empower their teams instead of controlling every decision.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B15'), 'terrific', 'adjective', ARRAY['fantastic', 'excellent', 'wonderful', 'great']::text[], 'We had a terrific time at the concert.', 'You''ve done a terrific job on this presentation.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B15'), 'disastrous', 'adjective', ARRAY['catastrophic', 'terrible', 'devastating', 'ruinous']::text[], 'The launch was disastrous because the website kept crashing.', 'The unexpected storm had disastrous effects on local farms.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B15'), 'diminish', 'verb', ARRAY['reduce', 'decrease', 'weaken', 'lessen']::text[], 'The pain began to diminish after a few hours.', 'That mistake doesn''t diminish everything you''ve achieved.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B15'), 'selective', 'adjective', ARRAY['choosy', 'discriminating', 'particular', 'carefully chosen']::text[], 'She''s selective about the projects she takes on.', 'The university is highly selective about admissions.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B15'), 'remedy', 'noun', ARRAY['solution', 'cure', 'fix', 'treatment']::text[], 'We need a remedy for the recurring payment issue.', 'A warm drink is my favorite remedy for a sore throat.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B16'), 'mandatory', 'adjective', ARRAY['required', 'compulsory', 'obligatory', 'nonoptional']::text[], 'Attendance is mandatory for all new employees.', 'Security training is mandatory before you can access the system.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B16'), 'exceptional', 'adjective', ARRAY['outstanding', 'extraordinary', 'remarkable', 'excellent']::text[], 'Her customer service was exceptional.', 'We had exceptional weather during the trip.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B16'), 'escalate', 'verb', ARRAY['intensify', 'worsen', 'increase', 'grow']::text[], 'Please don''t let a small disagreement escalate into an argument.', 'The support team will escalate the issue if it isn''t resolved today.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B16'), 'misleading', 'adjective', ARRAY['deceptive', 'confusing', 'inaccurate', 'giving a false impression']::text[], 'That headline is misleading because it leaves out the key detail.', 'The map was misleading, so we took the wrong exit.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B16'), 'overly', 'adverb', ARRAY['excessively', 'too', 'unduly', 'more than necessary']::text[], 'The instructions are overly complicated for a basic task.', 'Don''t be overly worried about one imperfect result.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B16'), 'consistency', 'noun', ARRAY['steadiness', 'uniformity', 'reliability', 'regularity']::text[], 'Consistency matters more than studying for five hours once a month.', 'The team needs more consistency in how it answers customer questions.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B16'), 'collaborate', 'verb', ARRAY['cooperate', 'work together', 'team up', 'join forces']::text[], 'We should collaborate on the report instead of writing separate versions.', 'The two artists decided to collaborate on a new song.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B16'), 'upcoming', 'adjective', ARRAY['forthcoming', 'approaching', 'scheduled', 'on the way']::text[], 'Have you prepared for your upcoming interview?', 'The app will show your upcoming appointments on the home screen.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B16'), 'irrelevant', 'adjective', ARRAY['unrelated', 'beside the point', 'inapplicable', 'not pertinent']::text[], 'That detail is irrelevant to the question we''re trying to answer.', 'I removed several irrelevant results from the search.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B16'), 'notorious', 'adjective', ARRAY['infamous', 'widely known for something bad', 'ill-famed', 'disreputable']::text[], 'The road is notorious for traffic jams in the morning.', 'That company is notorious for changing its prices without warning.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B17'), 'congratulate', 'verb', ARRAY['commend', 'praise', 'applaud', 'offer congratulations to']::text[], 'I called to congratulate her on the promotion.', 'Everyone wanted to congratulate the team after the win.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B17'), 'influential', 'adjective', ARRAY['powerful', 'impactful', 'persuasive', 'important']::text[], 'She became an influential voice in the industry.', 'An influential review can change how people see a product.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B17'), 'stereotype', 'noun', ARRAY['oversimplified image', 'cliché', 'generalization', 'fixed assumption']::text[], 'That joke relies on an unfair stereotype.', 'The film tries to challenge a familiar stereotype about teenagers.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B17'), 'vulnerable', 'adjective', ARRAY['exposed', 'defenseless', 'susceptible', 'at risk']::text[], 'People can feel vulnerable when they start a new job.', 'Older devices are more vulnerable to security threats.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B17'), 'overwhelming', 'adjective', ARRAY['intense', 'overpowering', 'enormous', 'hard to manage']::text[], 'The response to the charity event was overwhelming.', 'Moving to a new country can be an overwhelming experience.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B17'), 'desirable', 'adjective', ARRAY['attractive', 'sought-after', 'appealing', 'preferable']::text[], 'Flexible hours are a desirable benefit for many employees.', 'The apartment is in a desirable neighborhood near the park.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B17'), 'straightforward', 'adjective', ARRAY['simple', 'clear', 'uncomplicated', 'easy to understand']::text[], 'The installation was straightforward and took only ten minutes.', 'Be straightforward about what you can and cannot deliver.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B17'), 'privilege', 'noun', ARRAY['special right', 'advantage', 'benefit', 'exclusive opportunity']::text[], 'It''s a privilege to work with such a talented team.', 'Having reliable internet is a privilege in some rural areas.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B17'), 'exaggerate', 'verb', ARRAY['overstate', 'embellish', 'inflate', 'magnify']::text[], 'Don''t exaggerate the problem before we know the facts.', 'He tends to exaggerate how difficult the exam was.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B17'), 'accessible', 'adjective', ARRAY['easy to reach', 'approachable', 'available', 'easy to use']::text[], 'The building is accessible by public transport.', 'The guide makes a complicated topic accessible to beginners.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B18'), 'frustrating', 'adjective', ARRAY['annoying', 'irritating', 'discouraging', 'exasperating']::text[], 'It''s frustrating when the website logs you out unexpectedly.', 'The delay was frustrating, but at least everyone got home safely.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B18'), 'applaud', 'verb', ARRAY['praise', 'commend', 'cheer', 'express approval of']::text[], 'I applaud your decision to take time off for your health.', 'The audience stood up to applaud the performers.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B18'), 'dedicated', 'adjective', ARRAY['committed', 'devoted', 'hardworking', 'loyal']::text[], 'She''s a dedicated teacher who always helps struggling students.', 'We have a dedicated phone line for customer support.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B18'), 'superior', 'adjective', ARRAY['better', 'higher-quality', 'more advanced', 'above average']::text[], 'The newer model has a superior camera.', 'She acted as though her opinion was superior to everyone else''s.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B18'), 'grasp', 'noun', ARRAY['understanding', 'comprehension', 'command', 'firm knowledge']::text[], 'She has a good grasp of how the system works.', 'His grasp of the subject improved after a few lessons.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B18'), 'grip', 'noun', ARRAY['hold', 'grasp', 'clutch', 'firm control']::text[], 'Keep a firm grip on the handrail as you go down.', 'The movie had such a grip on me that I forgot to check my phone.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B18'), 'countless', 'adjective', ARRAY['innumerable', 'numerous', 'endless', 'too many to count']::text[], 'I''ve watched that video countless times.', 'Countless people rely on public transport every day.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B18'), 'default', 'noun', ARRAY['standard setting', 'preset', 'automatic option', 'preselected choice']::text[], 'The app saves your language preference by default.', 'I changed the default notification settings as soon as I installed it.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B18'), 'alike', 'adjective', ARRAY['similar', 'comparable', 'much the same', 'resembling each other']::text[], 'The twins look alike, but their personalities are different.', 'Parents and teachers alike noticed her improvement.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B18'), 'dignity', 'noun', ARRAY['self-respect', 'honor', 'worth', 'composure']::text[], 'She handled the criticism with dignity.', 'Everyone deserves to be treated with dignity at work.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B19'), 'mature', 'adjective', ARRAY['grown-up', 'sensible', 'responsible', 'levelheaded']::text[], 'He gave a mature response instead of getting defensive.', 'The design feels more mature than the previous version.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B19'), 'ease', 'noun', ARRAY['comfort', 'relief', 'lack of difficulty', 'calmness']::text[], 'The new process was designed to improve ease of use.', 'She spoke with ease in front of a large audience.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B19'), 'stir', 'verb', ARRAY['mix', 'move around', 'agitate', 'blend']::text[], 'Stir the sauce gently until it thickens.', 'His speech managed to stir strong emotions in the crowd.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B19'), 'upgrade', 'noun', ARRAY['improvement', 'enhancement', 'newer version', 'higher-level option']::text[], 'My old laptop could really use an upgrade.', 'We paid for an upgrade to a room with a better view.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B19'), 'squeeze', 'verb', ARRAY['press', 'compress', 'crush', 'fit tightly']::text[], 'Squeeze a little lemon juice into the water.', 'We managed to squeeze everyone into one car.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B19'), 'spark', 'verb', ARRAY['trigger', 'ignite', 'inspire', 'set off']::text[], 'That article helped spark a conversation about mental health.', 'A small misunderstanding can spark a bigger argument.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B19'), 'sheer', 'adjective', ARRAY['absolute', 'pure', 'complete', 'nothing but']::text[], 'We finished the project through sheer determination.', 'The sheer number of options made it difficult to choose.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B19'), 'yield', 'noun', ARRAY['output', 'return', 'amount produced', 'harvest']::text[], 'The investment offered a higher yield than expected.', 'The farm''s yield was lower after a dry summer.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B19'), 'hint', 'noun', ARRAY['clue', 'suggestion', 'indication', 'subtle sign']::text[], 'Can you give me a hint without telling me the answer?', 'There was a hint of disappointment in her voice.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B19'), 'eligible', 'adjective', ARRAY['qualified', 'entitled', 'meeting the requirements', 'allowed']::text[], 'You''re eligible for a refund if you cancel today.', 'Only registered members are eligible to vote.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B20'), 'sceptical', 'adjective', ARRAY['doubtful', 'unconvinced', 'suspicious', 'questioning']::text[], 'I''m sceptical that the new policy will solve the problem.', 'She was sceptical about the offer until she read the contract.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B20'), 'cease', 'verb', ARRAY['stop', 'end', 'discontinue', 'come to a halt']::text[], 'The company will cease production of the older model in June.', 'The noise should cease once the construction work ends.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B20'), 'denial', 'noun', ARRAY['refusal', 'rejection', 'contradiction', 'unwillingness to accept']::text[], 'He was in denial about how serious the problem had become.', 'The insurer sent a written denial of the claim.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B20'), 'stake', 'noun', ARRAY['interest', 'share', 'investment', 'something at risk']::text[], 'We all have a stake in making this project succeed.', 'There''s a lot at stake when you choose where to invest your savings.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B20'), 'courtesy', 'noun', ARRAY['politeness', 'consideration', 'civility', 'thoughtfulness']::text[], 'A quick reply is a basic courtesy when someone asks for help.', 'The hotel offered a courtesy shuttle to the airport.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B20'), 'accountable', 'adjective', ARRAY['responsible', 'answerable', 'liable', 'expected to explain']::text[], 'Managers should be accountable for their decisions.', 'The contract makes the supplier accountable for late deliveries.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B20'), 'consensus', 'noun', ARRAY['general agreement', 'shared opinion', 'common ground', 'collective decision']::text[], 'We reached a consensus after discussing the options.', 'There''s no consensus yet on when the new feature should launch.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B20'), 'caution', 'noun', ARRAY['care', 'prudence', 'wariness', 'vigilance']::text[], 'Use caution when opening messages from unknown senders.', 'The doctor advised caution before returning to strenuous exercise.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B20'), 'strain', 'noun', ARRAY['pressure', 'stress', 'tension', 'burden']::text[], 'The tight deadline put a strain on our team.', 'Travel expenses are becoming a strain on the family budget.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B20'), 'inappropriate', 'adjective', ARRAY['unsuitable', 'improper', 'unacceptable', 'out of place']::text[], 'That joke was inappropriate for a work meeting.', 'It''s inappropriate to share someone else''s private photos without asking.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B01'), 'backlash', 'noun', ARRAY['negative reaction', 'resistance', 'public criticism', 'strong opposition']::text[], 'The announcement triggered a backlash from longtime customers.', 'We didn''t expect so much backlash over a small change to the app.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B01'), 'candor', 'noun', ARRAY['honesty', 'frankness', 'openness', 'directness']::text[], 'I appreciated her candor about the challenges ahead.', 'His candor made the feedback easier to trust.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B01'), 'await', 'verb', ARRAY['wait for', 'expect', 'anticipate', 'stand by for']::text[], 'We still await confirmation from the hotel.', 'Several unanswered questions await us before the launch.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B01'), 'prominent', 'adjective', ARRAY['well-known', 'notable', 'leading', 'highly visible']::text[], 'A prominent journalist interviewed the founder.', 'The logo should have a more prominent position on the homepage.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B01'), 'mutual', 'adjective', ARRAY['shared', 'reciprocal', 'common', 'joint']::text[], 'Our partnership is based on mutual trust.', 'They reached a mutual agreement to end the contract.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B01'), 'adverse', 'adjective', ARRAY['unfavorable', 'harmful', 'negative', 'damaging']::text[], 'Bad weather had an adverse effect on attendance.', 'The drug may cause adverse reactions in some people.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B01'), 'accordingly', 'adverb', ARRAY['therefore', 'as a result', 'consequently', 'in response']::text[], 'The deadline has changed, so please plan accordingly.', 'Traffic was heavy, and we adjusted our schedule accordingly.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B01'), 'coincide', 'verb', ARRAY['occur together', 'happen at the same time', 'overlap', 'correspond']::text[], 'My vacation dates coincide with the conference.', 'The two reports coincide on the main findings.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B01'), 'hazard', 'noun', ARRAY['danger', 'risk', 'threat', 'potential harm']::text[], 'Loose cables are a safety hazard in the office.', 'Poor visibility can be a serious hazard on this road.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B01'), 'momentum', 'noun', ARRAY['progress', 'drive', 'impetus', 'forward movement']::text[], 'The team gained momentum after the first successful release.', 'It''s hard to maintain momentum when priorities change every week.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B02'), 'assurance', 'noun', ARRAY['guarantee', 'promise', 'reassurance', 'certainty']::text[], 'We need assurance that the data will remain private.', 'She gave me her assurance that the package would arrive tomorrow.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B02'), 'capability', 'noun', ARRAY['ability', 'capacity', 'competence', 'potential']::text[], 'The new phone has a useful capability for recording high-quality video.', 'We need to assess the team''s capability before taking on more work.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B02'), 'initiate', 'verb', ARRAY['begin', 'start', 'launch', 'set in motion']::text[], 'You can initiate a refund through your account.', 'The manager decided to initiate a review of the process.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B02'), 'appreciation', 'noun', ARRAY['gratitude', 'recognition', 'thankfulness', 'admiration']::text[], 'I sent a note of appreciation after the event.', 'The award was a sign of appreciation for her hard work.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B02'), 'companion', 'noun', ARRAY['friend', 'partner', 'associate', 'someone who accompanies you']::text[], 'She was a wonderful travel companion.', 'My dog has been my constant companion for years.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B02'), 'availability', 'noun', ARRAY['accessibility', 'readiness', 'supply', 'being available']::text[], 'Please check my availability before booking the call.', 'Product availability may vary between stores.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B02'), 'apprehensive', 'adjective', ARRAY['anxious', 'uneasy', 'nervous', 'worried']::text[], 'I felt apprehensive before my first public presentation.', 'She''s apprehensive about moving to a new city alone.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B02'), 'premium', 'noun', ARRAY['high-end', 'superior-quality', 'top-tier', 'deluxe']::text[], 'The premium plan includes unlimited storage.', 'I don''t think the premium version is worth the extra cost.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B02'), 'foster', 'verb', ARRAY['encourage', 'nurture', 'promote', 'cultivate']::text[], 'Regular feedback can foster trust between colleagues.', 'The school wants to foster a love of reading.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B02'), 'arguably', 'adverb', ARRAY['possibly', 'perhaps', 'by some accounts', 'it could be argued']::text[], 'This is arguably the best restaurant in the neighborhood.', 'The second option is arguably more practical for a small team.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B03'), 'immense', 'adjective', ARRAY['enormous', 'vast', 'tremendous', 'huge']::text[], 'The new system saved us an immense amount of time.', 'She felt immense relief when the results came back.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B03'), 'chronic', 'adjective', ARRAY['persistent', 'long-lasting', 'recurring', 'ongoing']::text[], 'He''s been dealing with chronic back pain for years.', 'The company has a chronic problem with late deliveries.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B03'), 'hardware', 'noun', ARRAY['equipment', 'physical components', 'devices', 'machinery']::text[], 'The software runs well, but the hardware is outdated.', 'We had to replace some hardware after the power surge.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B03'), 'presume', 'verb', ARRAY['assume', 'suppose', 'take for granted', 'infer']::text[], 'I presume you''ve already seen the updated schedule.', 'Don''t presume everyone agrees just because nobody objected.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B03'), 'distort', 'verb', ARRAY['twist', 'misrepresent', 'warp', 'alter']::text[], 'Social media can distort how we see other people''s lives.', 'A poor connection can distort your voice during a call.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B03'), 'merely', 'adverb', ARRAY['only', 'simply', 'just', 'nothing more than']::text[], 'I was merely asking a question, not criticizing you.', 'The discount is merely a temporary offer.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B03'), 'instinct', 'noun', ARRAY['intuition', 'gut feeling', 'impulse', 'natural response']::text[], 'My first instinct was to call and check that she was safe.', 'Sometimes you have to trust your instinct when something feels wrong.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B03'), 'dictate', 'verb', ARRAY['determine', 'control', 'prescribe', 'lay down']::text[], 'Budget limits often dictate what we can build.', 'Don''t let one negative review dictate your whole decision.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B03'), 'breach', 'noun', ARRAY['violation', 'infringement', 'break', 'failure to comply']::text[], 'The company reported a serious data breach.', 'Sharing that file without permission would be a breach of policy.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B03'), 'transit', 'noun', ARRAY['transportation', 'passage', 'travel', 'movement between places']::text[], 'The package was damaged while in transit.', 'The city has invested heavily in public transit.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B04'), 'align', 'verb', ARRAY['coordinate', 'bring into agreement', 'match', 'harmonize']::text[], 'We need to align our schedules before the workshop.', 'The new design should align with the brand guidelines.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B04'), 'attain', 'verb', ARRAY['achieve', 'reach', 'accomplish', 'obtain']::text[], 'She worked hard to attain fluency in English.', 'We hope to attain our sales target by December.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B04'), 'heighten', 'verb', ARRAY['increase', 'intensify', 'amplify', 'sharpen']::text[], 'The news seemed to heighten everyone''s anxiety.', 'Good lighting can heighten the sense of space in a room.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B04'), 'deploy', 'verb', ARRAY['roll out', 'put into use', 'implement', 'position']::text[], 'The team plans to deploy the update tonight.', 'We need to deploy more staff during the busiest hours.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B04'), 'boundary', 'noun', ARRAY['limit', 'border', 'dividing line', 'edge']::text[], 'It''s important to set a boundary between work and personal time.', 'The fence marks the boundary of the property.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B04'), 'embed', 'verb', ARRAY['integrate', 'insert', 'incorporate', 'place within']::text[], 'You can embed the video directly into the webpage.', 'We want to embed security checks into the process.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B04'), 'trademark', 'noun', ARRAY['brand mark', 'registered mark', 'identifying symbol', 'protected brand name']::text[], 'The company registered its trademark last year.', 'That cheerful greeting has become her trademark.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B04'), 'restraint', 'noun', ARRAY['self-control', 'moderation', 'discipline', 'reserve']::text[], 'He showed remarkable restraint during the argument.', 'The budget requires some restraint in our spending.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B04'), 'brutal', 'adjective', ARRAY['harsh', 'cruel', 'severe', 'merciless']::text[], 'The interview was brutal, but I learned a lot.', 'They worked through a brutal heatwave last summer.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B04'), 'trailer', 'noun', ARRAY['preview', 'teaser', 'promotional clip', 'advance footage']::text[], 'Have you seen the new trailer for that movie?', 'The trailer made the series look more exciting than it was.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B05'), 'commerce', 'noun', ARRAY['trade', 'business', 'buying and selling', 'commercial activity']::text[], 'Online commerce has changed how small shops operate.', 'The city depends on tourism and commerce for local jobs.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B05'), 'acute', 'adjective', ARRAY['severe', 'intense', 'serious', 'critical']::text[], 'The hospital was dealing with an acute shortage of staff.', 'She felt acute embarrassment after sending the message to the wrong person.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B05'), 'constraint', 'noun', ARRAY['restriction', 'limitation', 'obstacle', 'limiting condition']::text[], 'Time is our biggest constraint on this project.', 'We redesigned the feature to fit within our biggest constraint: time.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B05'), 'elevate', 'verb', ARRAY['raise', 'lift', 'improve', 'enhance']::text[], 'A good sauce can elevate a simple meal.', 'The promotion will elevate her to a leadership role.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B05'), 'emergence', 'noun', ARRAY['appearance', 'rise', 'development', 'arrival']::text[], 'The emergence of new competitors surprised the team.', 'We discussed the emergence of flexible work arrangements.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B05'), 'alert', 'adjective', ARRAY['watchful', 'attentive', 'vigilant', 'aware']::text[], 'Stay alert when driving through unfamiliar streets.', 'She was alert enough to notice the mistake immediately.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B05'), 'cater', 'verb', ARRAY['serve', 'accommodate', 'provide for', 'meet the needs of']::text[], 'The restaurant can cater to people with food allergies.', 'Our courses cater to beginners and advanced learners.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B05'), 'dense', 'adjective', ARRAY['thick', 'compact', 'crowded', 'tightly packed']::text[], 'The fog was so dense that we could barely see ahead.', 'The article is informative but a little too dense for beginners.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B05'), 'backdrop', 'noun', ARRAY['background', 'setting', 'surrounding scene', 'context']::text[], 'The mountains made a beautiful backdrop for our photos.', 'The announcement came against a backdrop of rising costs.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B05'), 'buffer', 'noun', ARRAY['cushion', 'reserve', 'protective layer', 'safeguard']::text[], 'Build a time buffer into your schedule in case the train is late.', 'A small cash buffer helps when unexpected bills arrive.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B06'), 'dismissal', 'noun', ARRAY['removal', 'termination', 'firing', 'rejection']::text[], 'His sudden dismissal surprised everyone in the office.', 'The court''s dismissal of the complaint ended the case.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B06'), 'allowance', 'noun', ARRAY['stipend', 'permitted amount', 'allocation', 'set amount']::text[], 'Employees receive a meal allowance when traveling.', 'There''s a baggage allowance of one small carry-on bag.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B06'), 'advocate', 'noun', ARRAY['supporter', 'champion', 'defender', 'promoter']::text[], 'She''s a strong advocate for accessible public transport.', 'The customer advocate helped resolve a complicated complaint.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B06'), 'alliance', 'noun', ARRAY['partnership', 'coalition', 'association', 'union']::text[], 'The two companies formed an alliance to enter a new market.', 'A strong alliance between teams made the project possible.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B06'), 'distinctive', 'adjective', ARRAY['unique', 'recognizable', 'characteristic', 'unmistakable']::text[], 'The café has a distinctive smell of freshly roasted coffee.', 'Her voice is distinctive enough to recognize immediately.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B06'), 'compile', 'verb', ARRAY['collect', 'assemble', 'gather', 'put together']::text[], 'I''ll compile the results into one report.', 'The app can compile your study history automatically.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B06'), 'destructive', 'adjective', ARRAY['damaging', 'harmful', 'ruinous', 'devastating']::text[], 'Their argument became destructive rather than productive.', 'The storm caused destructive flooding in several towns.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B06'), 'contrary', 'adjective', ARRAY['opposite', 'conflicting', 'inconsistent', 'opposing']::text[], 'Contrary to what I expected, the meeting ended early.', 'The evidence points to a contrary conclusion.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B06'), 'decisive', 'adjective', ARRAY['conclusive', 'firm', 'definite', 'determining']::text[], 'We need to make a decisive choice before Friday.', 'Her goal was the decisive moment of the match.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B06'), 'generic', 'adjective', ARRAY['standard', 'nonspecific', 'unbranded', 'ordinary']::text[], 'The email sounded generic and didn''t address my question.', 'A generic charger may not work as well as the original.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B07'), 'relevance', 'noun', ARRAY['importance', 'pertinence', 'applicability', 'connection to the matter']::text[], 'I don''t see the relevance of that example to our discussion.', 'The speaker explained the relevance of the new policy.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B07'), 'circulate', 'verb', ARRAY['distribute', 'share', 'pass around', 'spread']::text[], 'I''ll circulate the agenda before the meeting.', 'A rumor began to circulate around the office.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B07'), 'merit', 'noun', ARRAY['value', 'worth', 'quality', 'strong point']::text[], 'There''s some merit in your suggestion, but let''s check the numbers.', 'We should judge each application based on merit.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B07'), 'gathering', 'noun', ARRAY['meeting', 'get-together', 'assembly', 'social event']::text[], 'We''re hosting a small family gathering this weekend.', 'The annual gathering brings together people from across the industry.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B07'), 'landmark', 'noun', ARRAY['famous building', 'notable place', 'recognizable site', 'historic attraction']::text[], 'We stopped to take a photo beside the city''s most famous landmark.', 'The old clock tower is a well-known local landmark.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B07'), 'competence', 'noun', ARRAY['ability', 'skill', 'capability', 'proficiency']::text[], 'Her competence was clear from the first week.', 'The course helped me build competence in data analysis.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B07'), 'cultivate', 'verb', ARRAY['develop', 'nurture', 'foster', 'encourage']::text[], 'It takes time to cultivate good study habits.', 'She has worked hard to cultivate strong relationships with clients.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B07'), 'allocate', 'verb', ARRAY['assign', 'distribute', 'designate', 'set aside']::text[], 'Let''s allocate more time to testing before we launch.', 'The council decided to allocate funds to road repairs.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B07'), 'merger', 'noun', ARRAY['combination', 'consolidation', 'union', 'joining of companies']::text[], 'The merger created one of the country''s largest retailers.', 'Employees were anxious about what the merger would mean for their jobs.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B07'), 'exclusive', 'adjective', ARRAY['restricted', 'private', 'limited', 'available only to some']::text[], 'This offer is exclusive to existing subscribers.', 'The club hosts exclusive events for members.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B08'), 'behalf', 'noun', ARRAY['in someone''s place', 'as a representative', 'in someone''s interest', 'for someone']::text[], 'I''m writing on behalf of the customer support team.', 'She accepted the award on behalf of her colleagues.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B08'), 'complexity', 'noun', ARRAY['complication', 'intricacy', 'difficulty', 'sophistication']::text[], 'The complexity of the setup surprised us.', 'We underestimated the complexity of moving all our data.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B08'), 'bulk', 'noun', ARRAY['majority', 'main part', 'greater portion', 'large quantity']::text[], 'The bulk of the work is already finished.', 'Buying in bulk can save money if you have storage space.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B08'), 'collective', 'adjective', ARRAY['shared', 'joint', 'combined', 'group-based']::text[], 'This was a collective effort, not one person''s achievement.', 'We need collective agreement before changing the rules.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B08'), 'mobility', 'noun', ARRAY['movement', 'ability to move', 'freedom of movement', 'flexibility']::text[], 'The exercises improved his mobility after surgery.', 'Better transport can increase mobility for people without cars.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B08'), 'disturbing', 'adjective', ARRAY['upsetting', 'troubling', 'unsettling', 'alarming']::text[], 'I found the news report deeply disturbing.', 'The documentary included some disturbing scenes.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B08'), 'appetite', 'noun', ARRAY['hunger', 'desire for food', 'craving', 'urge to eat']::text[], 'I lost my appetite after the long journey.', 'There''s little appetite for another expensive redesign.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B08'), 'execution', 'noun', ARRAY['implementation', 'carrying out', 'performance', 'delivery']::text[], 'The idea is good, but the execution needs work.', 'We discussed the execution of the marketing plan.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B08'), 'functional', 'adjective', ARRAY['working', 'operational', 'usable', 'practical']::text[], 'The website looks basic, but it''s fully functional.', 'We need a functional prototype before adding animations.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B08'), 'complement', 'verb', ARRAY['enhance', 'supplement', 'go well with', 'complete']::text[], 'The new illustrations complement the simple layout.', 'A short walk can complement your daily workout.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B09'), 'proposition', 'noun', ARRAY['proposal', 'suggestion', 'offer', 'idea']::text[], 'It''s an interesting proposition, but we''d need more funding.', 'The company presented a new value proposition to customers.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B09'), 'anonymous', 'adjective', ARRAY['unnamed', 'unidentified', 'undisclosed', 'nameless']::text[], 'You can leave anonymous feedback through the form.', 'An anonymous donor paid for the community project.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B09'), 'trustee', 'noun', ARRAY['guardian', 'custodian', 'administrator', 'fiduciary']::text[], 'She serves as a trustee of the local charity.', 'The trustee is responsible for managing the funds properly.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B09'), 'pipeline', 'noun', ARRAY['sequence of projects', 'planned work', 'stream of opportunities', 'ongoing workflow']::text[], 'We have several new features in the pipeline.', 'The sales pipeline looks stronger this month.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B09'), 'compensate', 'verb', ARRAY['reimburse', 'repay', 'make up for', 'offset']::text[], 'The airline offered to compensate us for the delay.', 'A faster processor may compensate for the limited memory.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B09'), 'aspiration', 'noun', ARRAY['ambition', 'goal', 'hope', 'dream']::text[], 'Her main aspiration is to open her own business.', 'Helping other people is an aspiration she has had since childhood.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B09'), 'noble', 'adjective', ARRAY['honorable', 'admirable', 'virtuous', 'high-minded']::text[], 'Volunteering every weekend is a noble commitment.', 'His intentions were noble, but the plan wasn''t realistic.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B09'), 'abuse', 'noun', ARRAY['mistreatment', 'misuse', 'exploitation', 'ill-treatment']::text[], 'The company introduced rules to prevent abuse of customer data.', 'The report described years of abuse at the institution.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B09'), 'strategic', 'adjective', ARRAY['planned', 'deliberate', 'calculated', 'goal-oriented']::text[], 'We need a more strategic approach to marketing.', 'Moving the meeting was a strategic decision to include more people.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B09'), 'footage', 'noun', ARRAY['video', 'film', 'recorded images', 'video recording']::text[], 'The security footage showed what happened outside.', 'We reviewed the footage from yesterday''s interview.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B10'), 'vessel', 'noun', ARRAY['boat', 'ship', 'craft', 'watercraft']::text[], 'The fishing vessel returned to port before the storm.', 'A research vessel collected samples along the coast.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B10'), 'analogy', 'noun', ARRAY['comparison', 'parallel', 'similarity', 'illustrative comparison']::text[], 'She used a simple analogy to explain cloud storage.', 'That analogy helped me understand the problem immediately.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B10'), 'landlord', 'noun', ARRAY['property owner', 'lessor', 'rental owner', 'person renting out property']::text[], 'My landlord agreed to repair the heating system.', 'We told the landlord about the leak in the kitchen.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B10'), 'counsellor', 'noun', ARRAY['adviser', 'therapist', 'guidance professional', 'counselor']::text[], 'The school counsellor helped him explore career options.', 'She booked an appointment with a counsellor to talk through her concerns.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B10'), 'gallon', 'noun', ARRAY['unit of volume', 'four US quarts', 'liquid capacity measure', 'approximately 3.8 liters (US)']::text[], 'We bought a gallon of paint for the bedroom.', 'This car uses almost a gallon of fuel on my daily commute.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B10'), 'flourish', 'verb', ARRAY['thrive', 'prosper', 'bloom', 'do exceptionally well']::text[], 'Small businesses can flourish when the neighborhood grows.', 'Her confidence began to flourish after a few months of practice.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B10'), 'banner', 'noun', ARRAY['large sign', 'display', 'headline strip', 'promotional graphic']::text[], 'We hung a banner above the entrance for the event.', 'The website''s banner announces the new collection.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B10'), 'prestigious', 'adjective', ARRAY['respected', 'highly regarded', 'renowned', 'esteemed']::text[], 'She received an offer from a prestigious university.', 'Winning that award is a prestigious achievement.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B10'), 'debris', 'noun', ARRAY['rubble', 'wreckage', 'fragments', 'scattered remains']::text[], 'We found debris all over the road after the storm.', 'Construction crews cleared the debris from the empty lot.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B10'), 'inadequate', 'adjective', ARRAY['insufficient', 'unsuitable', 'lacking', 'not good enough']::text[], 'The instructions were inadequate for a first-time user.', 'The room''s heating was inadequate during winter.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B11'), 'debut', 'noun', ARRAY['first appearance', 'introduction', 'premiere', 'first performance']::text[], 'She made her television debut last year.', 'The new product will make its debut at next month''s event.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B11'), 'weed', 'noun', ARRAY['unwanted plant', 'invasive plant', 'wild growth', 'nuisance plant']::text[], 'I found a weed growing between the paving stones.', 'There''s a weed growing between the paving stones.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B11'), 'patron', 'noun', ARRAY['customer', 'regular visitor', 'client', 'paying guest']::text[], 'The café has a loyal patron who comes every morning.', 'A regular patron recommended the restaurant to us.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B11'), 'dam', 'noun', ARRAY['barrier', 'embankment', 'water barrier', 'reservoir wall']::text[], 'The dam provides electricity for several towns.', 'Water levels rose behind the dam after the heavy rain.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B11'), 'readily', 'adverb', ARRAY['easily', 'willingly', 'without difficulty', 'promptly']::text[], 'The information is readily available on the website.', 'She readily agreed to help us prepare the event.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B11'), 'accumulate', 'verb', ARRAY['collect', 'gather', 'build up', 'amass']::text[], 'Emails accumulate quickly when you''re on vacation.', 'We managed to accumulate enough points for a free flight.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B11'), 'applicable', 'adjective', ARRAY['relevant', 'appropriate', 'suitable', 'pertinent']::text[], 'The discount is applicable only to online orders.', 'Those rules aren''t applicable to this situation.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B11'), 'cocktail', 'noun', ARRAY['mixed drink', 'blended beverage', 'mixed alcoholic drink', 'drink mixture']::text[], 'She ordered a fruit cocktail without alcohol.', 'We served a simple cocktail at the reception.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B11'), 'warehouse', 'noun', ARRAY['storage building', 'distribution center', 'storage facility', 'depot']::text[], 'The online store ships orders from a large warehouse.', 'We visited the warehouse to check the new stock.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B11'), 'outlet', 'noun', ARRAY['store', 'retail location', 'point of sale', 'sales channel']::text[], 'There''s a factory outlet just outside the city.', 'The brand opened a new outlet at the shopping center.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B12'), 'taxpayer', 'noun', ARRAY['tax-paying citizen', 'tax contributor', 'person who pays taxes', 'taxable resident']::text[], 'Every taxpayer should be able to view the public spending report.', 'Every taxpayer can view the public spending report.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B12'), 'gambling', 'noun', ARRAY['betting', 'wagering', 'games of chance', 'risking money on outcomes']::text[], 'He decided to stop gambling after losing too much money.', 'The city has introduced stricter rules for online gambling.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B12'), 'barrel', 'noun', ARRAY['large container', 'cask', 'drum', 'cylindrical vessel']::text[], 'We stored the rainwater in a barrel behind the house.', 'The price of oil rose by several dollars a barrel.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B12'), 'ministry', 'noun', ARRAY['government department', 'ministerial office', 'government agency', 'administrative department']::text[], 'The health ministry published new guidance yesterday.', 'She works for the ministry responsible for education.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B12'), 'differentiate', 'verb', ARRAY['distinguish', 'tell apart', 'separate', 'identify differences']::text[], 'It''s difficult to differentiate the two models just by looking at them.', 'Good customer service can differentiate a small business from its competitors.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B12'), 'marketplace', 'noun', ARRAY['market', 'trading platform', 'commercial venue', 'online market']::text[], 'She sells handmade jewelry on an online marketplace.', 'The marketplace is crowded with similar products.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B12'), 'amateur', 'adjective', ARRAY['nonprofessional', 'inexperienced', 'recreational', 'unpaid']::text[], 'He''s an amateur photographer with a great eye for detail.', 'The tournament is open to amateur players.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B12'), 'flexibility', 'noun', ARRAY['adaptability', 'versatility', 'freedom to adjust', 'adjustability']::text[], 'The job offers flexibility around working hours.', 'We need more flexibility if the project schedule changes.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B12'), 'undoubtedly', 'adverb', ARRAY['certainly', 'unquestionably', 'clearly', 'without doubt']::text[], 'She''s undoubtedly the most experienced person on the team.', 'That was undoubtedly one of the best meals of the trip.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B12'), 'veteran', 'noun', ARRAY['experienced person', 'longtime professional', 'seasoned worker', 'old hand']::text[], 'He''s a veteran of the technology industry.', 'The company hired a veteran engineer to guide the project.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B13'), 'sensitivity', 'noun', ARRAY['awareness', 'delicacy', 'responsiveness', 'consideration']::text[], 'She handled the subject with great sensitivity.', 'The microphone''s sensitivity can be adjusted in settings.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B13'), 'benchmark', 'noun', ARRAY['standard', 'reference point', 'yardstick', 'measure of comparison']::text[], 'We use last year''s results as a benchmark.', 'The competitor''s app has become a benchmark for usability.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B13'), 'depict', 'verb', ARRAY['portray', 'represent', 'illustrate', 'show']::text[], 'The painting seems to depict a family at dinner.', 'The chart should depict the changes more clearly.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B13'), 'villager', 'noun', ARRAY['village resident', 'local inhabitant', 'person from the village', 'rural resident']::text[], 'A villager showed us the way to the lake.', 'Another villager helped us find our way back.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B13'), 'subscriber', 'noun', ARRAY['member', 'paying user', 'registered follower', 'subscription holder']::text[], 'Every subscriber gets access to the monthly newsletter.', 'Each subscriber receives a welcome email after registering.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B13'), 'councillor', 'noun', ARRAY['council member', 'local representative', 'elected official', 'municipal representative']::text[], 'A local councillor attended the neighborhood meeting.', 'Residents contacted their councillor about road safety.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B13'), 'efficiency', 'noun', ARRAY['productivity', 'effectiveness', 'economy', 'streamlined performance']::text[], 'The new process improved efficiency without reducing quality.', 'Working in focused blocks can help with efficiency.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B13'), 'undermine', 'verb', ARRAY['weaken', 'damage', 'erode', 'undercut']::text[], 'Constant interruptions can undermine your concentration.', 'The rumor threatened to undermine public trust in the company.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B13'), 'drift', 'verb', ARRAY['wander', 'move slowly', 'stray', 'float along']::text[], 'The boat began to drift away from the shore.', 'Our conversation started to drift toward weekend plans.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B13'), 'cognitive', 'adjective', ARRAY['mental', 'intellectual', 'related to thinking', 'involving cognition']::text[], 'The exercises are designed to improve cognitive skills.', 'Lack of sleep can affect cognitive performance.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B14'), 'compliance', 'noun', ARRAY['adherence', 'conformity', 'observance', 'following the rules']::text[], 'The company checks compliance with data protection rules.', 'We need to improve compliance before the next audit.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B14'), 'specimen', 'noun', ARRAY['sample', 'example', 'representative item', 'collected sample']::text[], 'The lab asked for a blood specimen.', 'We saw a rare butterfly specimen at the museum.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B14'), 'catalogue', 'noun', ARRAY['product list', 'inventory', 'collection', 'directory']::text[], 'The full catalogue is available online.', 'I found the item in the store''s printed catalogue.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B14'), 'motorist', 'noun', ARRAY['driver', 'vehicle driver', 'road user', 'person behind the wheel']::text[], 'A motorist stopped to help when our car broke down.', 'Every motorist should check the road closures before traveling.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B14'), 'transparency', 'noun', ARRAY['openness', 'honesty', 'clarity', 'accountability']::text[], 'Customers expect transparency about how their data is used.', 'More transparency would make the pricing easier to understand.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B14'), 'provoke', 'verb', ARRAY['trigger', 'cause', 'spark', 'incite']::text[], 'That comment could provoke an argument.', 'A vague announcement might provoke more questions than answers.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B14'), 'melody', 'noun', ARRAY['tune', 'musical line', 'song phrase', 'sequence of notes']::text[], 'I recognized the melody even without the lyrics.', 'She hummed the melody while making breakfast.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B14'), 'discard', 'verb', ARRAY['throw away', 'dispose of', 'get rid of', 'reject']::text[], 'Please discard the outdated version of the document.', 'Don''t discard the box until you''re sure the product works.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B14'), 'devise', 'verb', ARRAY['design', 'invent', 'develop', 'come up with']::text[], 'We need to devise a simpler way to collect feedback.', 'We need to devise a backup plan for the event.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B14'), 'neighbouring', 'adjective', ARRAY['adjacent', 'nearby', 'bordering', 'next-door']::text[], 'We visited a neighbouring town for lunch.', 'The noise from the neighbouring apartment kept us awake.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B15'), 'columnist', 'noun', ARRAY['opinion writer', 'newspaper commentator', 'regular contributor', 'editorial writer']::text[], 'A local columnist criticized the decision.', 'She works as a columnist for a national newspaper.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B15'), 'activist', 'noun', ARRAY['campaigner', 'advocate', 'organizer', 'person campaigning for change']::text[], 'A climate activist spoke at the university.', 'The activist helped organize a neighborhood cleanup.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B15'), 'collaboration', 'noun', ARRAY['teamwork', 'cooperation', 'joint effort', 'partnership']::text[], 'The project succeeded because of close collaboration between teams.', 'Their collaboration produced a popular new album.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B15'), 'deficit', 'noun', ARRAY['shortfall', 'shortage', 'gap', 'amount lacking']::text[], 'The organization reported a budget deficit.', 'I had a sleep deficit after several late nights.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B15'), 'compel', 'verb', ARRAY['force', 'require', 'oblige', 'drive']::text[], 'The evidence may compel the company to change its policy.', 'Budget limits can compel even big companies to make difficult choices.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B15'), 'density', 'noun', ARRAY['concentration', 'compactness', 'thickness', 'crowding']::text[], 'The density of traffic increases after five o''clock.', 'The city''s population density is higher near the center.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B15'), 'creep', 'verb', ARRAY['move slowly', 'inch along', 'sneak', 'crawl']::text[], 'Traffic began to creep forward after the accident.', 'Prices tend to creep up when nobody is paying attention.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B15'), 'displace', 'verb', ARRAY['replace', 'remove', 'push aside', 'force out']::text[], 'Automation may displace some routine tasks.', 'A severe flood can displace hundreds of residents.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B15'), 'systematic', 'adjective', ARRAY['methodical', 'organized', 'structured', 'thorough']::text[], 'We need a systematic way to track errors.', 'Her systematic approach made the investigation easier.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B15'), 'reliability', 'noun', ARRAY['dependability', 'consistency', 'trustworthiness', 'stability']::text[], 'The product''s reliability matters more to me than its design.', 'We tested the reliability of the backup system.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B16'), 'dispose', 'verb', ARRAY['get rid of', 'throw away', 'discard', 'eliminate']::text[], 'How should we dispose of these old batteries safely?', 'The company will dispose of the damaged equipment.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B16'), 'dependence', 'noun', ARRAY['reliance', 'need for support', 'dependency', 'reliance on someone']::text[], 'Our dependence on one supplier creates a risk.', 'He wanted to reduce his dependence on his phone.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B16'), 'dissolve', 'verb', ARRAY['disappear', 'break down', 'melt away', 'disband']::text[], 'Stir until the sugar begins to dissolve.', 'The committee agreed to dissolve after finishing its work.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B16'), 'academy', 'noun', ARRAY['institute', 'school', 'training center', 'educational institution']::text[], 'She enrolled in a design academy last year.', 'The academy offers evening classes for working adults.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B16'), 'subtle', 'adjective', ARRAY['slight', 'understated', 'delicate', 'barely noticeable']::text[], 'There was a subtle change in her tone.', 'I prefer the subtle flavor of this sauce.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B16'), 'comply', 'verb', ARRAY['obey', 'follow', 'adhere to', 'conform']::text[], 'All employees must comply with the safety policy.', 'The supplier agreed to comply with the new requirements.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B16'), 'deficiency', 'noun', ARRAY['shortage', 'inadequacy', 'insufficiency', 'lack']::text[], 'The test revealed a vitamin deficiency.', 'The report identified a deficiency in the security process.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B16'), 'autonomy', 'noun', ARRAY['independence', 'self-government', 'freedom of choice', 'self-direction']::text[], 'She enjoys the autonomy to plan her own day.', 'Giving employees more autonomy can improve motivation.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B16'), 'attribute', 'noun', ARRAY['characteristic', 'feature', 'quality', 'trait']::text[], 'Patience is a useful attribute for a teacher.', 'The model''s best attribute is its battery life.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B16'), 'convict', 'verb', ARRAY['find guilty', 'declare guilty', 'sentence after trial', 'establish guilt']::text[], 'The court may convict him if the evidence is strong.', 'A jury decided to convict the defendant on two charges.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B17'), 'appoint', 'verb', ARRAY['designate', 'nominate', 'select', 'assign']::text[], 'The company will appoint a new director next month.', 'We need to appoint someone to lead the meeting.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B17'), 'burst', 'verb', ARRAY['explode', 'break open', 'erupt', 'suddenly give way']::text[], 'The balloon might burst if you fill it too much.', 'She couldn''t help but burst into laughter at the joke.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B17'), 'blade', 'noun', ARRAY['cutting edge', 'sharp metal part', 'knife edge', 'cutting implement']::text[], 'Be careful when replacing the blade on that tool.', 'The blender''s blade was damaged and needed replacing.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B17'), 'profound', 'adjective', ARRAY['deep', 'significant', 'far-reaching', 'intense']::text[], 'The experience had a profound effect on her.', 'He has a profound understanding of the subject.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B17'), 'drain', 'verb', ARRAY['empty', 'remove liquid from', 'draw off', 'deplete']::text[], 'Remember to drain the water before moving the washing machine.', 'Long meetings drain my energy.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B17'), 'beneficiary', 'noun', ARRAY['recipient', 'person who benefits', 'entitled person', 'designated recipient']::text[], 'She became the main beneficiary of the insurance policy.', 'The scholarship will make a student its direct beneficiary.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B17'), 'conquer', 'verb', ARRAY['overcome', 'defeat', 'master', 'triumph over']::text[], 'She''s trying to conquer her fear of public speaking.', 'The team managed to conquer several technical challenges.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B17'), 'absence', 'noun', ARRAY['lack', 'nonappearance', 'nonattendance', 'being away']::text[], 'I noticed his absence at the morning meeting.', 'In the absence of clear instructions, we followed the old process.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B17'), 'delegate', 'noun', ARRAY['representative', 'envoy', 'appointed member', 'spokesperson']::text[], 'Each department sent a delegate to the conference.', 'A delegate from the company joined the negotiations.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B17'), 'divert', 'verb', ARRAY['redirect', 'reroute', 'shift', 'turn aside']::text[], 'Police had to divert traffic after the accident.', 'Let''s divert some of the budget to customer support.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B18'), 'angel', 'noun', ARRAY['kindhearted helper', 'lifesaver', 'compassionate person', 'generous supporter']::text[], 'The volunteer was an absolute angel during the event.', 'The stranger who helped us change the tire was an angel.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B18'), 'bleed', 'verb', ARRAY['lose blood', 'hemorrhage', 'discharge blood', 'let blood flow']::text[], 'My finger started to bleed after I cut it.', 'The colors might bleed if you wash the clothes in hot water.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B18'), 'broadband', 'noun', ARRAY['high-speed internet', 'fast internet connection', 'wideband access', 'broadband internet service']::text[], 'The village finally has reliable broadband.', 'Our broadband connection keeps dropping during video calls.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B18'), 'crawl', 'verb', ARRAY['creep', 'move slowly', 'inch forward', 'move on hands and knees']::text[], 'The baby has just learned to crawl.', 'Traffic started to crawl as we approached the city.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B18'), 'implementation', 'noun', ARRAY['execution', 'rollout', 'application', 'putting into practice']::text[], 'The implementation of the new system took six months.', 'We need a clear plan for implementation before signing the contract.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B18'), 'compute', 'verb', ARRAY['calculate', 'work out', 'process', 'determine mathematically']::text[], 'The software can compute the total automatically.', 'It takes a few seconds to compute the result.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B18'), 'beloved', 'adjective', ARRAY['cherished', 'dear', 'treasured', 'much-loved']::text[], 'The café was a beloved neighborhood meeting place.', 'She kept a photo of her beloved grandmother on her desk.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B18'), 'commence', 'verb', ARRAY['begin', 'start', 'initiate', 'get underway']::text[], 'The workshop will commence at nine o''clock.', 'Construction is expected to commence next spring.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B18'), 'allege', 'verb', ARRAY['claim', 'assert', 'accuse', 'maintain without proof']::text[], 'Several customers allege that the company overcharged them.', 'Some former employees allege that safety rules were ignored.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B18'), 'feat', 'noun', ARRAY['achievement', 'accomplishment', 'exploit', 'impressive act']::text[], 'Running a marathon is an incredible feat.', 'Finishing the project in a week was no small feat.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B19'), 'crush', 'verb', ARRAY['squash', 'compress', 'smash', 'flatten']::text[], 'Don''t crush the boxes when you stack them.', 'The negative review seemed to crush his confidence.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B19'), 'condemn', 'verb', ARRAY['denounce', 'criticize strongly', 'censure', 'express disapproval of']::text[], 'The mayor was quick to condemn the violent attack.', 'We should condemn discriminatory behavior wherever it occurs.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B19'), 'dispute', 'noun', ARRAY['disagreement', 'argument', 'conflict', 'controversy']::text[], 'The neighbors had a dispute about the property line.', 'A billing dispute delayed the payment.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B19'), 'cluster', 'noun', ARRAY['group', 'bunch', 'collection', 'concentration']::text[], 'We found a cluster of cafés near the station.', 'The chart shows a cluster of errors around the same feature.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B19'), 'crude', 'adjective', ARRAY['rough', 'basic', 'unrefined', 'poorly made']::text[], 'We built a crude prototype to test the idea.', 'The comedian was criticized for his crude jokes.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B19'), 'descend', 'verb', ARRAY['go down', 'move downward', 'drop', 'come down']::text[], 'We started to descend the mountain before sunset.', 'Temperatures tend to descend sharply after dark.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B19'), 'conserve', 'verb', ARRAY['save', 'preserve', 'protect', 'use sparingly']::text[], 'We try to conserve electricity by switching off unused devices.', 'The museum works to conserve old photographs.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B19'), 'closure', 'noun', ARRAY['ending', 'resolution', 'conclusion', 'sense of completion']::text[], 'Talking about what happened gave her some closure.', 'The road closure will last until Friday.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B19'), 'deprive', 'verb', ARRAY['deny', 'withhold', 'take away', 'prevent from having']::text[], 'Working late can deprive you of much-needed sleep.', 'Don''t deprive yourself of breaks during a busy day.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B19'), 'canvas', 'noun', ARRAY['heavy fabric', 'painting surface', 'drawing cloth', 'blank surface']::text[], 'She bought a blank canvas and a set of paints.', 'The bag is made of durable canvas.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B20'), 'backing', 'noun', ARRAY['support', 'endorsement', 'financial help', 'sponsorship']::text[], 'The project has the backing of senior management.', 'They secured financial backing for their new business.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B20'), 'duo', 'noun', ARRAY['pair', 'twosome', 'two-person team', 'couple']::text[], 'The musical duo performed at the festival.', 'Those two make a great duo when they work together.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B20'), 'amend', 'verb', ARRAY['revise', 'modify', 'correct', 'change']::text[], 'We need to amend the contract before signing it.', 'The team agreed to amend the schedule after the delay.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B20'), 'conceive', 'verb', ARRAY['imagine', 'envision', 'think up', 'formulate']::text[], 'It''s hard to conceive of a world without the internet.', 'It is easier to conceive a solution once we understand the problem.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B20'), 'bless', 'verb', ARRAY['wish well', 'consecrate', 'give a blessing to', 'favor']::text[], 'The priest will bless the couple after the ceremony.', 'The priest will bless the new community center next weekend.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B20'), 'bind', 'verb', ARRAY['tie', 'fasten', 'secure', 'join together']::text[], 'Use tape to bind the papers together.', 'The agreement will bind both parties for two years.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B20'), 'descent', 'noun', ARRAY['downward movement', 'decline', 'drop', 'downward journey']::text[], 'The plane began its descent toward the airport.', 'The trail''s steep descent was harder than we expected.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B20'), 'detain', 'verb', ARRAY['hold', 'keep in custody', 'delay', 'prevent from leaving']::text[], 'Police may detain a suspect for questioning.', 'Security staff may detain visitors who enter restricted areas.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B20'), 'carve', 'verb', ARRAY['cut', 'shape', 'sculpt', 'engrave']::text[], 'He learned to carve small figures out of wood.', 'It''s difficult to carve out time for exercise on busy days.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MOM-01-B20'), 'costly', 'adjective', ARRAY['expensive', 'high-priced', 'financially burdensome', 'dear']::text[], 'Replacing the roof would be costly.', 'A small mistake at the start turned into a costly delay.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B01'), 'ruling', 'noun', ARRAY['decision', 'judgment', 'official verdict', 'authoritative determination']::text[], 'The court issued a ruling on the case this morning.', 'The referee''s ruling caused an argument between the teams.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B01'), 'tighten', 'verb', ARRAY['make tighter', 'secure more firmly', 'strengthen', 'reduce slack']::text[], 'Tighten the lid so the bottle doesn''t leak.', 'We may need to tighten security after the attempted break-in.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B01'), 'aspire', 'verb', ARRAY['aim', 'hope', 'strive', 'seek to achieve']::text[], 'I aspire to speak English confidently at work.', 'Many young designers aspire to work on projects like this.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B01'), 'verdict', 'noun', ARRAY['decision', 'judgment', 'conclusion', 'final opinion']::text[], 'The jury reached a verdict late last night.', 'What''s your verdict on the new restaurant?', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B01'), 'endless', 'adjective', ARRAY['never-ending', 'limitless', 'continuous', 'seemingly infinite']::text[], 'We spent an endless afternoon waiting for the results.', 'The kids asked endless questions during the drive.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B01'), 'deployment', 'noun', ARRAY['rollout', 'implementation', 'launch', 'putting into service']::text[], 'The deployment of the update is scheduled for tonight.', 'We had to pause the deployment after finding a bug.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B01'), 'sue', 'verb', ARRAY['take legal action against', 'bring a lawsuit against', 'file a claim against', 'litigate against']::text[], 'The customer threatened to sue the company over the damages.', 'You shouldn''t sue someone without understanding the legal costs.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B01'), 'large-scale', 'adjective', ARRAY['extensive', 'widespread', 'broad', 'wide-ranging']::text[], 'The city announced a large-scale renovation project.', 'We aren''t ready for a large-scale launch yet.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B01'), 'unveil', 'verb', ARRAY['reveal', 'present', 'introduce', 'disclose']::text[], 'The company will unveil its new product on Tuesday.', 'They plan to unveil the restored mural next month.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B01'), 'logic', 'noun', ARRAY['reasoning', 'rationale', 'sound thinking', 'coherent argument']::text[], 'I understand the logic behind your decision.', 'There''s no logic in paying extra for something we won''t use.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B02'), 'squad', 'noun', ARRAY['team', 'group', 'unit', 'crew']::text[], 'The coach announced the final squad for the match.', 'Our small squad handled customer questions all weekend.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B02'), 'retreat', 'noun', ARRAY['withdrawal', 'pullback', 'step backward', 'backing away']::text[], 'The company announced a retreat from the overseas market.', 'The company announced a retreat from its overseas expansion plans.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B02'), 'hail', 'verb', ARRAY['praise', 'acclaim', 'applaud', 'celebrate']::text[], 'Critics hail the film as one of the year''s best.', 'The mayor was quick to hail the volunteers as heroes.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B02'), 'snap', 'verb', ARRAY['lash out', 'lose patience', 'react sharply', 'speak angrily']::text[], 'I sometimes snap at people when I am exhausted.', 'She did not mean to snap at you; it was a stressful day.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B02'), 'handling', 'noun', ARRAY['management', 'treatment', 'approach', 'way of dealing']::text[], 'The company apologized for its handling of the complaint.', 'Her careful handling of the situation prevented an argument.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B02'), 'surplus', 'noun', ARRAY['excess', 'extra amount', 'oversupply', 'more than needed']::text[], 'The café donates surplus food at the end of the day.', 'We had a budget surplus after cutting unnecessary costs.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B02'), 'inspect', 'verb', ARRAY['examine', 'check', 'scrutinize', 'look over']::text[], 'Please inspect the package before signing for delivery.', 'The mechanic will inspect the brakes tomorrow.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B02'), 'proclaim', 'verb', ARRAY['announce', 'declare', 'state publicly', 'make known']::text[], 'The mayor will proclaim the results tomorrow.', 'He likes to proclaim that he never watches television.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B02'), 'sacred', 'adjective', ARRAY['holy', 'revered', 'hallowed', 'deeply respected']::text[], 'The site is sacred to the local community.', 'Sunday morning is sacred family time in our house.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B02'), 'sphere', 'noun', ARRAY['area', 'field', 'domain', 'realm']::text[], 'She''s well known in the sphere of public health.', 'That decision is outside my sphere of responsibility.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B03'), 'grind', 'verb', ARRAY['crush', 'mill', 'pulverize', 'reduce to powder']::text[], 'I grind fresh coffee beans every morning.', 'I grind spices just before cooking to get a stronger flavor.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B03'), 'intent', 'noun', ARRAY['purpose', 'aim', 'intention', 'objective']::text[], 'My intent wasn''t to criticize your work.', 'The email was written with the intent to clarify the policy.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B03'), 'meantime', 'noun', ARRAY['interim', 'interval', 'intervening period', 'time in between']::text[], 'The repairs will take a week; in the meantime, use the side entrance.', 'I''ll prepare dinner, and you can set the table in the meantime.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B03'), 'rotate', 'verb', ARRAY['turn', 'spin', 'revolve', 'alternate']::text[], 'Rotate your phone to see the chart in landscape mode.', 'We rotate responsibilities so everyone gets experience.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B03'), 'pronounced', 'adjective', ARRAY['obvious', 'noticeable', 'marked', 'distinct']::text[], 'There was a pronounced improvement in her confidence.', 'The difference in price is more pronounced this year.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B03'), 'merge', 'verb', ARRAY['combine', 'unite', 'join', 'blend']::text[], 'We need to merge the two customer lists.', 'The two teams will merge into one department next month.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B03'), 'seize', 'verb', ARRAY['grab', 'take hold of', 'capture', 'grasp']::text[], 'She managed to seize the opportunity before it disappeared.', 'Customs officers may seize goods that break the rules.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B03'), 'rumour', 'noun', ARRAY['gossip', 'hearsay', 'unconfirmed report', 'speculation']::text[], 'There''s a rumour that the café is closing.', 'Don''t spread a rumour before checking whether it''s true.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B03'), 'spectrum', 'noun', ARRAY['range', 'variety', 'span', 'continuum']::text[], 'The store offers products across a wide price spectrum.', 'People had opinions from every part of the political spectrum.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B03'), 'indulge', 'verb', ARRAY['treat oneself', 'give in to', 'allow oneself', 'pamper']::text[], 'I like to indulge in dessert on special occasions.', 'Don''t indulge every impulse to check your phone.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B04'), 'raid', 'noun', ARRAY['surprise attack', 'sudden search', 'incursion', 'police operation']::text[], 'Police carried out a raid on the warehouse.', 'The game features a raid that takes several players to complete.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B04'), 'texture', 'noun', ARRAY['feel', 'surface quality', 'consistency', 'tactile quality']::text[], 'I love the soft texture of this blanket.', 'The soup has a creamy texture when blended properly.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B04'), 'nod', 'verb', ARRAY['dip the head', 'signal agreement', 'gesture approval', 'acknowledge']::text[], 'Just nod if you can hear me clearly.', 'She gave a quick nod before leaving the room.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B04'), 'toss', 'verb', ARRAY['throw', 'fling', 'hurl lightly', 'pitch']::text[], 'Toss the salad just before serving.', 'He likes to toss his jacket over the chair when he gets home.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B04'), 'insult', 'noun', ARRAY['offense', 'put-down', 'slight', 'rude remark']::text[], 'I didn''t mean it as an insult; I was trying to be helpful.', 'Her comment felt like a personal insult.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B04'), 'thread', 'noun', ARRAY['strand', 'fiber', 'fine string', 'continuous line']::text[], 'The thread came loose from my jacket sleeve.', 'I lost the thread of the conversation when the call dropped.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B04'), 'skip', 'verb', ARRAY['omit', 'miss', 'bypass', 'leave out']::text[], 'You can skip the introduction if you''ve seen it before.', 'I sometimes skip breakfast when I''m running late.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B04'), 'weaken', 'verb', ARRAY['reduce strength', 'undermine', 'diminish', 'make less effective']::text[], 'Lack of sleep can weaken your concentration.', 'The storm started to weaken before reaching the coast.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B04'), 'scattered', 'adjective', ARRAY['spread out', 'dispersed', 'distributed', 'not concentrated']::text[], 'There were scattered papers all over the desk.', 'A few scattered showers are expected this afternoon.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B04'), 'reside', 'verb', ARRAY['live', 'dwell', 'be based', 'inhabit']::text[], 'Most of the team members reside in the same city.', 'The important documents reside on a secure server.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B05'), 'inflict', 'verb', ARRAY['cause', 'impose', 'bring about', 'deal out']::text[], 'The injury could inflict lasting damage on his knee.', 'Don''t inflict your bad mood on everyone else.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B05'), 'steer', 'verb', ARRAY['guide', 'direct', 'navigate', 'control the direction of']::text[], 'Can you steer us toward a simpler solution?', 'She managed to steer the conversation away from politics.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B05'), 'drown', 'verb', ARRAY['submerge', 'be overwhelmed by water', 'sink under water', 'suffocate underwater']::text[], 'The loud music seemed to drown out our conversation.', 'Loud background noise can drown out important details on calls.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B05'), 'solo', 'adjective', ARRAY['alone', 'unaccompanied', 'independent', 'performed by one person']::text[], 'I took my first solo trip last summer.', 'She gave a solo performance at the concert.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B05'), 'offering', 'noun', ARRAY['product', 'service', 'available option', 'something provided']::text[], 'The company expanded its offering to include online classes.', 'Their latest offering is a low-cost subscription.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B05'), 'outing', 'noun', ARRAY['trip', 'excursion', 'day out', 'short visit']::text[], 'We planned a family outing to the park.', 'The team organized a casual outing after work.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B05'), 'storage', 'noun', ARRAY['keeping', 'warehousing', 'space for storing', 'safekeeping']::text[], 'My phone is running out of storage.', 'We rented a small storage unit while moving.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B05'), 'wholly', 'adverb', ARRAY['entirely', 'completely', 'fully', 'altogether']::text[], 'The plan is wholly unrealistic without more funding.', 'I''m not wholly convinced that this is the best option.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B05'), 'pathway', 'noun', ARRAY['route', 'path', 'course', 'way forward']::text[], 'The garden has a narrow pathway to the back gate.', 'The internship offers a pathway into a permanent job.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B05'), 'threshold', 'noun', ARRAY['limit', 'cutoff point', 'boundary', 'minimum level']::text[], 'Your income must be below a certain threshold to qualify.', 'The noise crossed my threshold for what I can tolerate.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B06'), 'prescribe', 'verb', ARRAY['order medically', 'recommend formally', 'specify', 'direct']::text[], 'The doctor may prescribe medication if the symptoms persist.', 'The rules prescribe how safety checks should be carried out.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B06'), 'blessing', 'noun', ARRAY['approval', 'support', 'good fortune', 'benefit']::text[], 'We started the project with our manager''s blessing.', 'Having my parents nearby is a real blessing.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B06'), 'verbal', 'adjective', ARRAY['spoken', 'oral', 'expressed in words', 'unwritten']::text[], 'We received verbal confirmation but nothing in writing.', 'The conversation turned into a verbal argument.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B06'), 'sack', 'verb', ARRAY['dismiss', 'fire', 'let go', 'terminate employment']::text[], 'The company might sack employees who repeatedly violate the rules.', 'Some companies sack employees after repeated serious violations.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B06'), 'tribute', 'noun', ARRAY['homage', 'recognition', 'expression of respect', 'commemoration']::text[], 'They held a concert as a tribute to the singer.', 'Her speech was a moving tribute to her mentor.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B06'), 'dub', 'verb', ARRAY['nickname', 'label', 'call', 'name']::text[], 'The media began to dub the city the next tech hub.', 'Local reporters often dub the town the cultural capital of the region.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B06'), 'vacuum', 'noun', ARRAY['empty space', 'void', 'absence of matter', 'suction environment']::text[], 'The vacuum cleaner stopped working halfway through the room.', 'When she left, it created a leadership vacuum on the team.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B06'), 'premier', 'adjective', ARRAY['leading', 'foremost', 'top-ranked', 'first-rate']::text[], 'This is one of the country''s premier research centers.', 'The festival attracts premier performers from around the world.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B06'), 'leak', 'noun', ARRAY['escape', 'seepage', 'unwanted release', 'accidental disclosure']::text[], 'We found a leak under the kitchen sink.', 'A data leak exposed thousands of email addresses.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B06'), 'yell', 'verb', ARRAY['shout', 'scream', 'cry out', 'holler']::text[], 'Please don''t yell; I''m right here.', 'He had to yell over the noise of the crowd.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B07'), 'varied', 'adjective', ARRAY['diverse', 'assorted', 'mixed', 'wide-ranging']::text[], 'The course includes varied exercises to keep it interesting.', 'Her career has been varied, from teaching to design.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B07'), 'regain', 'verb', ARRAY['recover', 'get back', 'restore', 'reclaim']::text[], 'It took me a few days to regain my energy after the flu.', 'The brand is trying to regain customer trust.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B07'), 'long-time', 'adjective', ARRAY['long-standing', 'longstanding', 'established', 'many-year']::text[], 'She''s a long-time friend of the family.', 'A long-time customer recommended the shop to me.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B07'), 'lesser', 'adjective', ARRAY['smaller', 'lower', 'less important', 'minor']::text[], 'We chose the lesser of two expensive options.', 'The side effects were far lesser than she expected.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B07'), 'spouse', 'noun', ARRAY['husband or wife', 'married partner', 'life partner', 'marital partner']::text[], 'You can add your spouse to the insurance policy.', 'She and her spouse moved closer to family.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B07'), 'loom', 'verb', ARRAY['approach threateningly', 'hang over', 'appear imminent', 'draw near']::text[], 'The deadline is starting to loom over the team.', 'A huge storm cloud seemed to loom above the city.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B07'), 'forge', 'verb', ARRAY['create', 'build', 'establish', 'form']::text[], 'Working together helped us forge a stronger relationship.', 'The artist learned to forge metal into simple shapes.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B07'), 'plunge', 'verb', ARRAY['dive', 'fall sharply', 'drop suddenly', 'sink']::text[], 'Prices began to plunge after the announcement.', 'She decided to take the plunge and start her own business.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B07'), 'weave', 'verb', ARRAY['interlace', 'braid', 'intertwine', 'thread together']::text[], 'She learned to weave baskets from local materials.', 'The writer manages to weave humor into a serious story.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B07'), 'shipping', 'noun', ARRAY['delivery', 'dispatch', 'transportation of goods', 'freight service']::text[], 'Shipping is free on orders over fifty dollars.', 'The store warned us about possible shipping delays.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B08'), 'refuge', 'noun', ARRAY['shelter', 'safe place', 'protection', 'sanctuary']::text[], 'We took refuge in a café when it started pouring.', 'The library was a quiet refuge during exam season.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B08'), 'vow', 'verb', ARRAY['promise', 'pledge', 'swear', 'make a solemn commitment']::text[], 'I vow to stop checking email after dinner.', 'She made a vow to finish the course this year.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B08'), 'oral', 'adjective', ARRAY['spoken', 'verbal', 'delivered by mouth', 'not written']::text[], 'The exam includes an oral presentation.', 'We received oral instructions before starting the tour.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B08'), 'embark', 'verb', ARRAY['begin', 'set out', 'start', 'launch into']::text[], 'She''s about to embark on a new career.', 'We plan to embark on the trip early tomorrow.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B08'), 'mill', 'noun', ARRAY['factory', 'processing plant', 'production facility', 'industrial works']::text[], 'The old textile mill is now a shopping center.', 'My grandfather worked at a mill for many years.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B08'), 'slap', 'verb', ARRAY['smack', 'strike with an open hand', 'hit sharply', 'swat']::text[], 'Don''t slap the screen if it stops responding.', 'People sometimes slap a label on a box without checking what is inside.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B08'), 'troubled', 'adjective', ARRAY['distressed', 'worried', 'disturbed', 'experiencing problems']::text[], 'She seemed troubled by the news.', 'The company is trying to rescue its troubled business.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B08'), 'slam', 'verb', ARRAY['shut forcefully', 'bang', 'strike hard', 'crash closed']::text[], 'Please don''t slam the door when you leave.', 'Critics were quick to slam the proposal online.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B08'), 'slash', 'verb', ARRAY['cut', 'reduce sharply', 'slice', 'chop']::text[], 'The retailer plans to slash prices after the holidays.', 'We should not slash the training budget to meet this target.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B08'), 'standing', 'adjective', ARRAY['ongoing', 'permanent', 'continuing', 'established']::text[], 'We have a standing meeting every Monday.', 'She''s a standing member of the committee.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B09'), 'triumph', 'noun', ARRAY['victory', 'success', 'achievement', 'conquest']::text[], 'Finishing the race was a personal triumph.', 'The team''s comeback was a triumph against the odds.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B09'), 'suck', 'verb', ARRAY['draw in', 'pull in', 'absorb', 'extract by suction']::text[], 'The vacuum should suck up the crumbs easily.', 'Use the nozzle to suck the water out of the narrow gap.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B09'), 'pledge', 'noun', ARRAY['promise', 'commitment', 'vow', 'assurance']::text[], 'The company made a pledge to reduce waste.', 'She kept her pledge to volunteer every month.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B09'), 'trophy', 'noun', ARRAY['prize', 'award', 'cup', 'winner''s award']::text[], 'The players proudly held up the trophy.', 'He keeps his running trophy on a shelf in the living room.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B09'), 'uphold', 'verb', ARRAY['support', 'maintain', 'defend', 'stand by']::text[], 'We must uphold our privacy commitments.', 'The court decided to uphold the original decision.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B09'), 'passive', 'adjective', ARRAY['inactive', 'unassertive', 'not taking action', 'receptive']::text[], 'Being passive in meetings can make it harder to share your ideas.', 'He remained passive while the others decided what to do.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B09'), 'partial', 'adjective', ARRAY['incomplete', 'limited', 'not total', 'unfinished']::text[], 'We received only a partial refund.', 'The report gives a partial picture of what happened.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B09'), 'expire', 'verb', ARRAY['run out', 'become invalid', 'lapse', 'come to an end']::text[], 'My passport will expire next month.', 'Many discount codes expire at midnight.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B09'), 'lethal', 'adjective', ARRAY['deadly', 'fatal', 'life-threatening', 'capable of killing']::text[], 'A lethal dose can cause serious harm.', 'The chemical is lethal to many small animals.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B09'), 'renew', 'verb', ARRAY['extend', 'refresh', 'restore', 'replace']::text[], 'I need to renew my driver''s license this month.', 'The company hopes to renew its partnership next year.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B10'), 'spotlight', 'noun', ARRAY['attention', 'public focus', 'center stage', 'prominence']::text[], 'The documentary puts local farmers in the spotlight.', 'She dislikes being in the spotlight during meetings.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B10'), 'trauma', 'noun', ARRAY['severe distress', 'psychological shock', 'serious injury', 'lasting emotional harm']::text[], 'He is still dealing with the trauma of the accident.', 'The hospital has a specialist team for trauma patients.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B10'), 'inclined', 'adjective', ARRAY['disposed', 'likely', 'willing', 'tending toward']::text[], 'I''m inclined to agree with your suggestion.', 'She''s not inclined to spend money on things she doesn''t need.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B10'), 'preside', 'verb', ARRAY['chair', 'lead', 'oversee', 'direct proceedings']::text[], 'The director will preside over the meeting.', 'A senior judge will preside over the hearing.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B10'), 'soak', 'verb', ARRAY['saturate', 'drench', 'immerse', 'absorb liquid']::text[], 'Let the beans soak overnight before cooking.', 'Let your feet soak in warm water after the long hike.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B10'), 'dumb', 'adjective', ARRAY['foolish', 'silly', 'unintelligent', 'lacking good judgment']::text[], 'That was a dumb mistake, but it''s easy to fix.', 'I felt dumb asking the question, but everyone was confused.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B10'), 'infect', 'verb', ARRAY['contaminate', 'spread disease to', 'transmit infection to', 'pass germs to']::text[], 'The virus can infect people before symptoms appear.', 'Don''t let one person''s negativity infect the entire team.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B10'), 'smash', 'verb', ARRAY['shatter', 'break violently', 'crush', 'destroy']::text[], 'Be careful not to smash your phone on the floor.', 'The team managed to smash its previous sales record.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B10'), 'gaze', 'noun', ARRAY['stare', 'fixed look', 'prolonged look', 'intent glance']::text[], 'He stood by the window with his gaze fixed on the street.', 'I caught her gaze across the room and waved.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B10'), 'stab', 'verb', ARRAY['pierce', 'thrust sharply', 'puncture with a blade', 'wound with a sharp object']::text[], 'In the film, someone tries to stab the main character.', 'I felt a sharp pain, like a sudden stab, in my shoulder.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B11'), 'lifelong', 'adjective', ARRAY['lasting a lifetime', 'permanent', 'enduring', 'for life']::text[], 'She made a lifelong friend during her first year at university.', 'Learning to cook is a lifelong skill worth developing.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B11'), 'plead', 'verb', ARRAY['beg', 'appeal', 'implore', 'ask desperately']::text[], 'I don''t want to plead for another chance; I''ll show that I''ve improved.', 'Some residents plan to plead with the council to repair the road.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B11'), 'reform', 'noun', ARRAY['improvement', 'restructuring', 'change for the better', 'modernization']::text[], 'The government announced a reform of the tax system.', 'The organization needs reform if it wants to regain trust.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B11'), 'harvest', 'noun', ARRAY['crop collection', 'yield', 'produce', 'gathering of crops']::text[], 'Farmers expect a good harvest after the rain.', 'The apple harvest begins in early autumn.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B11'), 'latter', 'adjective', ARRAY['second of two', 'more recent', 'last-mentioned', 'later one']::text[], 'We can meet on Tuesday or Thursday; I''d prefer the latter.', 'Of the two proposals, the latter seems more affordable.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B11'), 'flee', 'verb', ARRAY['escape', 'run away', 'get away', 'leave quickly']::text[], 'Families were forced to flee the flooded area.', 'The suspect tried to flee when the officers arrived.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B11'), 'youngster', 'noun', ARRAY['child', 'young person', 'kid', 'youth']::text[], 'The youngster was excited about his first school trip.', 'The youngster asked whether the playground was open.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B11'), 'license', 'verb', ARRAY['authorize', 'permit', 'grant approval to', 'give legal permission to']::text[], 'The authority must license new drivers before they can work.', 'We need to license the software for another ten employees.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B11'), 'thereby', 'adverb', ARRAY['as a result', 'in doing so', 'by that means', 'consequently']::text[], 'The update reduces unnecessary steps, thereby saving time.', 'She paid the debt early, thereby avoiding extra fees.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B11'), 'wipe', 'verb', ARRAY['clean', 'rub off', 'erase', 'remove by rubbing']::text[], 'Wipe the table before serving dinner.', 'I need to wipe the old data from this phone.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B12'), 'suppress', 'verb', ARRAY['restrain', 'hold back', 'inhibit', 'put down']::text[], 'He tried to suppress a laugh during the serious meeting.', 'The filter can suppress unwanted background noise.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B12'), 'intact', 'adjective', ARRAY['undamaged', 'whole', 'complete', 'untouched']::text[], 'The package arrived intact despite the rough journey.', 'Luckily, our plans remained intact after the schedule change.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B12'), 'seldom', 'adverb', ARRAY['rarely', 'infrequently', 'hardly ever', 'not often']::text[], 'I seldom watch television during the week.', 'She seldom misses a chance to visit her grandparents.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B12'), 'instruct', 'verb', ARRAY['teach', 'direct', 'tell', 'give orders to']::text[], 'Please instruct the team to save their work before restarting.', 'The coach will instruct beginners on how to use the equipment.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B12'), 'stun', 'verb', ARRAY['shock', 'amaze', 'astonish', 'overwhelm']::text[], 'The surprise announcement managed to stun the audience.', 'The final score may stun even the most optimistic fans.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B12'), 'excess', 'adjective', ARRAY['surplus', 'extra amount', 'overabundance', 'more than needed']::text[], 'We donated the excess food after the event.', 'You may have to pay an excess if you make an insurance claim.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B12'), 'tenant', 'noun', ARRAY['renter', 'leaseholder', 'occupant', 'lessee']::text[], 'The tenant reported a leak in the bathroom.', 'A new tenant will move into the apartment next month.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B12'), 'enrol', 'verb', ARRAY['sign up', 'register', 'join', 'enroll']::text[], 'I plan to enrol in an evening course.', 'You can enrol online before the deadline.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B12'), 'motive', 'noun', ARRAY['reason', 'motivation', 'purpose', 'driving force']::text[], 'I don''t understand his motive for hiding the information.', 'The police are still investigating a possible motive.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B12'), 'rental', 'noun', ARRAY['hiring arrangement', 'lease', 'rented property', 'rental agreement']::text[], 'We booked a car rental for the weekend.', 'The apartment rental includes internet and utilities.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B13'), 'cynical', 'adjective', ARRAY['distrustful', 'skeptical', 'pessimistic about motives', 'disillusioned']::text[], 'He became cynical after several disappointing experiences.', 'It''s easy to feel cynical about promises made during a campaign.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B13'), 'recount', 'verb', ARRAY['retell', 'describe', 'narrate', 'relate']::text[], 'She began to recount what happened during the trip.', 'He can recount the whole trip in remarkable detail.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B13'), 'widen', 'verb', ARRAY['broaden', 'expand', 'enlarge', 'make wider']::text[], 'We plan to widen the path so two people can walk together.', 'The course helped widen my professional network.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B13'), 'halfway', 'adverb', ARRAY['midway', 'in the middle', 'partway through', 'at the midpoint']::text[], 'We''re halfway through the book already.', 'Can we stop halfway to get something to eat?', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B13'), 'supreme', 'adjective', ARRAY['highest', 'greatest', 'ultimate', 'top-ranking']::text[], 'The court has supreme authority over the matter.', 'Comfort is of supreme importance on a long flight.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B13'), 'peculiar', 'adjective', ARRAY['strange', 'unusual', 'odd', 'distinctive']::text[], 'There''s a peculiar smell coming from the fridge.', 'I find it peculiar that nobody mentioned the change.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B13'), 'vicious', 'adjective', ARRAY['cruel', 'brutal', 'malicious', 'savage']::text[], 'A vicious argument broke out over the parking spaces.', 'The dog became vicious when it felt threatened.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B13'), 'whip', 'verb', ARRAY['beat rapidly', 'whisk', 'stir vigorously', 'agitate quickly']::text[], 'Whip the cream until it forms soft peaks.', 'You can whip the eggs by hand if you do not have a mixer.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B13'), 'turnout', 'noun', ARRAY['attendance', 'participation', 'number present', 'crowd size']::text[], 'The event had a better turnout than expected.', 'Voter turnout was especially high in the city.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B13'), 'sketch', 'noun', ARRAY['drawing', 'outline', 'rough illustration', 'draft']::text[], 'She made a quick sketch of the new logo.', 'Let''s sketch out the idea before building the prototype.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B14'), 'prey', 'noun', ARRAY['victim', 'target', 'hunted animal', 'quarry']::text[], 'Small fish are common prey for larger birds.', 'Scammers often target people who may fall prey to false promises.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B14'), 'namely', 'adverb', ARRAY['specifically', 'that is', 'in particular', 'to be precise']::text[], 'We have one main problem, namely a shortage of staff.', 'The app supports three languages, namely English, Spanish, and Portuguese.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B14'), 'ironic', 'adjective', ARRAY['unexpectedly contradictory', 'paradoxical', 'incongruous', 'amusingly opposite']::text[], 'It''s ironic that the printer broke on the day we needed it most.', 'The ironic ending made everyone laugh.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B14'), 'explicit', 'adjective', ARRAY['clear', 'direct', 'unambiguous', 'clearly stated']::text[], 'The instructions need to be explicit about which file to upload.', 'She gave explicit permission for us to share the photo.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B14'), 'miracle', 'noun', ARRAY['wonder', 'extraordinary event', 'marvel', 'remarkable occurrence']::text[], 'It''s a miracle we caught the train after leaving so late.', 'The family described her recovery as a miracle.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B14'), 'manifest', 'verb', ARRAY['show', 'display', 'reveal', 'become apparent']::text[], 'Stress can manifest as headaches or poor sleep.', 'Her enthusiasm began to manifest in the way she worked.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B14'), 'delicate', 'adjective', ARRAY['fragile', 'sensitive', 'subtle', 'easily damaged']::text[], 'Be careful with the delicate glass cups.', 'We need to handle this delicate conversation privately.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B14'), 'substantial', 'adjective', ARRAY['considerable', 'significant', 'large', 'extensive']::text[], 'They offered a substantial discount for early booking.', 'The renovation will require a substantial investment.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B14'), 'enquire', 'verb', ARRAY['ask', 'inquire', 'seek information', 'make a request']::text[], 'Please enquire at reception about parking options.', 'I called to enquire whether the room was available.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B14'), 'magical', 'adjective', ARRAY['enchanting', 'wonderful', 'spellbinding', 'extraordinary']::text[], 'The garden looked magical under the lights.', 'We had a magical evening watching the stars.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B15'), 'integral', 'adjective', ARRAY['essential', 'fundamental', 'necessary', 'central']::text[], 'Testing is an integral part of product development.', 'Her advice was integral to the success of the event.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B15'), 'maximize', 'verb', ARRAY['increase to the fullest', 'optimize', 'make the most of', 'boost']::text[], 'We want to maximize the space in our small kitchen.', 'Turn off unused apps to maximize battery life.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B15'), 'imagery', 'noun', ARRAY['visual representation', 'mental pictures', 'descriptive images', 'picture language']::text[], 'The poem uses vivid imagery to describe the sea.', 'The brand''s imagery feels more modern after the redesign.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B15'), 'cooperate', 'verb', ARRAY['collaborate', 'work together', 'assist', 'join forces']::text[], 'The teams need to cooperate to meet the deadline.', 'The children refused to cooperate when it was time to leave.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B15'), 'imprison', 'verb', ARRAY['incarcerate', 'jail', 'confine', 'lock up']::text[], 'The law allows courts to imprison repeat offenders.', 'Some governments still imprison journalists for criticizing officials.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B15'), 'explosive', 'adjective', ARRAY['volatile', 'dangerous', 'rapidly expanding', 'capable of exploding']::text[], 'Keep explosive materials away from heat.', 'The company experienced explosive growth after the launch.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B15'), 'disruption', 'noun', ARRAY['interruption', 'disturbance', 'upheaval', 'breakdown']::text[], 'The power cut caused major disruption to the train service.', 'We managed the office move with very little disruption.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B15'), 'involvement', 'noun', ARRAY['participation', 'engagement', 'contribution', 'taking part']::text[], 'Her involvement made the project much stronger.', 'Parents'' involvement in school activities can make a difference.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B15'), 'nominate', 'verb', ARRAY['propose', 'put forward', 'recommend', 'designate']::text[], 'I''d like to nominate Sarah for the employee award.', 'The committee will nominate a new chair next week.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B15'), 'adoption', 'noun', ARRAY['acceptance', 'uptake', 'implementation', 'taking on']::text[], 'The adoption of online payments was faster than expected.', 'Our company is considering the adoption of a four-day workweek.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B16'), 'entitle', 'verb', ARRAY['give the right to', 'authorize', 'qualify', 'make eligible']::text[], 'This ticket doesn''t entitle you to a refund.', 'The membership will entitle you to free entry all year.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B16'), 'nationwide', 'adjective', ARRAY['across the country', 'countrywide', 'throughout the nation', 'nationally']::text[], 'The retailer is planning a nationwide sale.', 'The campaign reached schools nationwide.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B16'), 'intensive', 'adjective', ARRAY['concentrated', 'demanding', 'thorough', 'in-depth']::text[], 'She enrolled in an intensive English course.', 'The first month involved intensive training.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B16'), 'engagement', 'noun', ARRAY['involvement', 'participation', 'interaction', 'commitment']::text[], 'The video generated a lot of engagement online.', 'We want stronger engagement from customers after the purchase.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B16'), 'harmony', 'noun', ARRAY['agreement', 'balance', 'peace', 'accord']::text[], 'The new colors work in harmony with the original design.', 'They lived in harmony with their neighbors for years.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B16'), 'authorize', 'verb', ARRAY['approve', 'permit', 'allow', 'give permission']::text[], 'Only managers can authorize refunds over that amount.', 'You need to authorize the payment in your banking app.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B16'), 'correction', 'noun', ARRAY['amendment', 'fix', 'adjustment', 'rectification']::text[], 'I sent a correction after noticing the wrong date.', 'One small correction made the whole report much clearer.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B16'), 'damaging', 'adjective', ARRAY['harmful', 'destructive', 'detrimental', 'injurious']::text[], 'The rumor could be damaging to her reputation.', 'Heavy rain had a damaging effect on the old roof.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B16'), 'linear', 'adjective', ARRAY['straight', 'sequential', 'following a line', 'progressing step by step']::text[], 'The process isn''t always linear; sometimes you need to revisit a step.', 'The chart shows a nearly linear increase in sales.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B16'), 'presently', 'adverb', ARRAY['currently', 'at present', 'right now', 'for the moment']::text[], 'She''s presently working on the next release.', 'The service is presently unavailable in our region.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B17'), 'civilian', 'adjective', ARRAY['nonmilitary', 'noncombatant', 'ordinary citizen', 'not in the armed forces']::text[], 'The building is now used for civilian purposes.', 'The aid group focuses on protecting civilian lives.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B17'), 'nonetheless', 'adverb', ARRAY['nevertheless', 'even so', 'however', 'despite that']::text[], 'The trip was expensive; nonetheless, we enjoyed every minute.', 'He felt nervous but decided to speak up nonetheless.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B17'), 'devastate', 'verb', ARRAY['destroy', 'ruin', 'overwhelm', 'cause severe damage']::text[], 'The storm could devastate the coastal towns.', 'One bad storm can devastate an entire harvest.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B17'), 'injustice', 'noun', ARRAY['unfairness', 'wrongdoing', 'inequality', 'violation of rights']::text[], 'She spoke out against the injustice she had witnessed.', 'The case raised questions about injustice in the legal system.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B17'), 'dimension', 'noun', ARRAY['aspect', 'facet', 'element', 'measure']::text[], 'There''s another dimension to this problem that we haven''t discussed.', 'The room has one unusual dimension: its ceiling is very low.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B17'), 'infamous', 'adjective', ARRAY['notorious', 'disreputable', 'ill-famed', 'widely known for bad reasons']::text[], 'The road is infamous for its traffic jams.', 'That company is infamous for its poor customer service.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B17'), 'mobilize', 'verb', ARRAY['organize', 'rally', 'activate', 'bring together']::text[], 'The volunteers managed to mobilize help within hours.', 'The team needs to mobilize quickly if the deadline changes.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B17'), 'admission', 'noun', ARRAY['entry', 'acceptance', 'acknowledgment', 'confession']::text[], 'Admission to the museum is free on Sundays.', 'His admission that he''d made a mistake helped resolve the issue.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B17'), 'assemble', 'verb', ARRAY['put together', 'gather', 'build', 'collect']::text[], 'We need to assemble the desk before the guests arrive.', 'Everyone should assemble in the main hall at nine.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B17'), 'collision', 'noun', ARRAY['crash', 'impact', 'accident involving contact', 'clash']::text[], 'Two cars were involved in a collision near the bridge.', 'The collision caused delays on the highway.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B18'), 'intervene', 'verb', ARRAY['step in', 'get involved', 'interfere', 'take action']::text[], 'The manager had to intervene when the argument got heated.', 'The teacher decided to intervene before anyone was hurt.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B18'), 'excellence', 'noun', ARRAY['outstanding quality', 'superiority', 'exceptional standard', 'high achievement']::text[], 'The award recognizes excellence in customer service.', 'She has a reputation for excellence in teaching.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B18'), 'insider', 'noun', ARRAY['someone on the inside', 'organization member', 'person with inside knowledge', 'informed contact']::text[], 'An industry insider shared details about the new product.', 'We need an insider''s view of how the process works.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B18'), 'abundance', 'noun', ARRAY['plenty', 'large quantity', 'wealth of something', 'ample supply']::text[], 'There''s an abundance of fresh fruit at the market.', 'The internet offers an abundance of free learning materials.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B18'), 'aggression', 'noun', ARRAY['hostility', 'belligerence', 'violent behavior', 'antagonism']::text[], 'His aggression made the conversation uncomfortable.', 'The therapist helped the child express anger without aggression.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B18'), 'outsider', 'noun', ARRAY['nonmember', 'newcomer', 'stranger', 'person outside a group']::text[], 'I felt like an outsider at the first team meeting.', 'An outsider might notice problems we''ve stopped seeing.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B18'), 'minimal', 'adjective', ARRAY['very small', 'slight', 'limited', 'negligible']::text[], 'The update had minimal impact on battery life.', 'We decorated the room with a minimal amount of furniture.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B18'), 'comparable', 'adjective', ARRAY['similar', 'equivalent', 'on a par with', 'alike']::text[], 'The two offers are comparable in price.', 'We need comparable figures before deciding which option is better.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B18'), 'defensive', 'adjective', ARRAY['guarded', 'self-protective', 'touchy', 'quick to justify oneself']::text[], 'He became defensive when I asked about the mistake.', 'Try not to sound defensive when receiving feedback.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B18'), 'conviction', 'noun', ARRAY['firm belief', 'certainty', 'strong opinion', 'deeply held principle']::text[], 'She spoke with conviction about the need for change.', 'He has a strong conviction that education should be accessible.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B19'), 'creator', 'noun', ARRAY['maker', 'originator', 'producer', 'inventor']::text[], 'The creator of the app explained how it began.', 'She''s a content creator who teaches cooking online.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B19'), 'acceptance', 'noun', ARRAY['approval', 'recognition', 'willingness to receive', 'agreement']::text[], 'The proposal finally received acceptance from the team.', 'Learning to live with uncertainty requires some acceptance.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B19'), 'eternal', 'adjective', ARRAY['everlasting', 'endless', 'perpetual', 'timeless']::text[], 'The wait for our luggage felt eternal.', 'The film explores themes of eternal love and loss.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B19'), 'distinction', 'noun', ARRAY['difference', 'contrast', 'separation', 'special recognition']::text[], 'There''s an important distinction between those two terms.', 'She graduated with distinction from the university.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B19'), 'intimate', 'adjective', ARRAY['close', 'personal', 'private', 'deeply familiar']::text[], 'The restaurant has an intimate atmosphere for small dinners.', 'They shared an intimate conversation about their families.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B19'), 'correspond', 'verb', ARRAY['match', 'agree', 'align', 'be consistent']::text[], 'The numbers don''t correspond with last month''s report.', 'Please make sure your details correspond to the form.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B19'), 'adjustment', 'noun', ARRAY['change', 'modification', 'alteration', 'correction']::text[], 'Moving to a new city takes some adjustment.', 'We made a small adjustment to the schedule.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B19'), 'interface', 'noun', ARRAY['user-facing screen', 'connection point', 'interaction layer', 'way systems communicate']::text[], 'The app has a clean interface that''s easy to navigate.', 'We need to improve the interface between the booking system and the database.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B19'), 'execute', 'verb', ARRAY['carry out', 'perform', 'implement', 'put into effect']::text[], 'The team will execute the plan next week.', 'The program can execute several tasks automatically.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B19'), 'adjacent', 'adjective', ARRAY['next to', 'neighboring', 'adjoining', 'bordering']::text[], 'The meeting room is adjacent to the kitchen.', 'We booked two adjacent seats on the train.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B20'), 'aesthetic', 'adjective', ARRAY['visual style', 'artistic appearance', 'design sensibility', 'look and feel']::text[], 'I like the clean aesthetic of the new website.', 'The café has a warm, minimalist aesthetic.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B20'), 'likelihood', 'noun', ARRAY['probability', 'chance', 'possibility', 'prospect']::text[], 'There''s a strong likelihood of rain tomorrow.', 'We should consider the likelihood of delays.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B20'), 'inclusion', 'noun', ARRAY['participation', 'integration', 'involvement', 'being included']::text[], 'The company wants to improve inclusion in hiring.', 'Her inclusion in the group made the discussion more balanced.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B20'), 'newsletter', 'noun', ARRAY['email bulletin', 'periodic update', 'information circular', 'regular publication']::text[], 'I signed up for the monthly newsletter.', 'The newsletter includes tips and upcoming events.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B20'), 'diagnose', 'verb', ARRAY['identify', 'determine the cause', 'recognize a condition', 'pinpoint']::text[], 'The mechanic couldn''t diagnose the problem right away.', 'A specialist will diagnose the condition after the tests.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B20'), 'irony', 'noun', ARRAY['contradiction', 'unexpected reversal', 'incongruity', 'ironic situation']::text[], 'The irony is that we missed the flight because we arrived too early.', 'She laughed at the irony of losing her glasses in an optical shop.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B20'), 'liberty', 'noun', ARRAY['freedom', 'independence', 'autonomy', 'right to choose']::text[], 'Everyone should have the liberty to express an opinion respectfully.', 'I took the liberty of booking a table for us.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B20'), 'magnitude', 'noun', ARRAY['size', 'scale', 'extent', 'degree']::text[], 'We underestimated the magnitude of the problem.', 'The earthquake''s magnitude was higher than expected.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B20'), 'oversee', 'verb', ARRAY['supervise', 'manage', 'monitor', 'direct']::text[], 'She will oversee the installation of the new software.', 'We need someone to oversee the event from start to finish.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-FLU-01-B20'), 'non-profit', 'adjective', ARRAY['charitable', 'not-for-profit', 'mission-driven', 'not run for profit']::text[], 'She volunteers at a non-profit organization.', 'The project is funded by a non-profit foundation.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B01'), 'submission', 'noun', ARRAY['entry', 'application', 'proposal', 'material handed in']::text[], 'The deadline for submission is Friday at five.', 'We received your submission and will review it shortly.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B01'), 'provision', 'noun', ARRAY['supply', 'arrangement', 'availability', 'providing']::text[], 'The contract includes a provision for early cancellation.', 'We need to improve the provision of childcare in the area.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B01'), 'rotation', 'noun', ARRAY['turning', 'revolving', 'alternation', 'changeover']::text[], 'The screen changes orientation when you adjust its rotation.', 'We use a weekly rotation for weekend shifts.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B01'), 'residence', 'noun', ARRAY['home', 'dwelling', 'place of living', 'accommodation']::text[], 'Her official residence is in the city center.', 'Proof of residence is required when you register.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B01'), 'regardless', 'adverb', ARRAY['anyway', 'irrespective', 'no matter what', 'without considering']::text[], 'We should follow the rules regardless of the outcome.', 'I''ll be there regardless of the weather.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B01'), 'overturn', 'verb', ARRAY['reverse', 'revoke', 'cancel', 'invalidate']::text[], 'The court may overturn the previous decision.', 'The team managed to overturn a two-goal deficit.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B01'), 'symbolic', 'adjective', ARRAY['representative', 'emblematic', 'meaningful', 'figurative']::text[], 'The gift was symbolic rather than expensive.', 'The ceremony has a symbolic importance for the community.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B01'), 'turnover', 'noun', ARRAY['staff attrition', 'employee departures', 'rate of replacement', 'employee churn']::text[], 'Employee turnover has increased this year.', 'High staff turnover makes it harder to build an experienced team.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B01'), 'projection', 'noun', ARRAY['forecast', 'estimate', 'prediction', 'calculation of future results']::text[], 'Our revenue projection was too optimistic.', 'The sales projection assumes strong demand in December.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B01'), 'serial', 'adjective', ARRAY['sequential', 'recurring', 'in a series', 'repeated']::text[], 'The podcast tells a serial story over ten episodes.', 'You can find the device''s serial number on the back.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B02'), 'protective', 'adjective', ARRAY['defensive', 'guarding', 'shielding', 'concerned for safety']::text[], 'Wear protective gloves when cleaning with strong chemicals.', 'She''s very protective of her younger brother.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B02'), 'refusal', 'noun', ARRAY['rejection', 'denial', 'unwillingness', 'decision not to comply']::text[], 'His refusal to answer surprised the interviewer.', 'The restaurant''s refusal to provide a refund caused complaints.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B02'), 'revival', 'noun', ARRAY['comeback', 'renewal', 'resurgence', 'return']::text[], 'The neighborhood is experiencing a cultural revival.', 'A revival of the old series was announced yesterday.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B02'), 'tolerance', 'noun', ARRAY['patience', 'acceptance', 'forbearance', 'ability to endure']::text[], 'Working with different people requires tolerance.', 'My tolerance for noisy restaurants has decreased lately.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B02'), 'reproduce', 'verb', ARRAY['copy', 'replicate', 'duplicate', 'recreate']::text[], 'The team couldn''t reproduce the error on another computer.', 'You need permission to reproduce the image in your report.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B02'), 'shareholder', 'noun', ARRAY['stockholder', 'share owner', 'equity holder', 'investor with shares']::text[], 'The company will hold its annual shareholder meeting in May.', 'As a shareholder, she receives regular updates.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B02'), 'partially', 'adverb', ARRAY['partly', 'in part', 'to some extent', 'not completely']::text[], 'The road is partially closed for repairs.', 'The package was only partially damaged.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B02'), 'successor', 'noun', ARRAY['replacement', 'person who follows', 'next holder of a position', 'heir to a role']::text[], 'The director is training her successor before retiring.', 'The new model is a worthy successor to the original.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B02'), 'proceeding', 'noun', ARRAY['legal action', 'formal process', 'course of action', 'official step']::text[], 'The proceeding was delayed because a witness was absent.', 'A legal proceeding can take longer than expected.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B02'), 'terminate', 'verb', ARRAY['end', 'stop', 'discontinue', 'cancel']::text[], 'The provider may terminate the service if bills remain unpaid.', 'We decided to terminate the contract before renewal.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B03'), 'utilize', 'verb', ARRAY['use', 'employ', 'make use of', 'put to work']::text[], 'You can utilize the free trial to test the features.', 'We should utilize the data we already have.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B03'), 'suspicion', 'noun', ARRAY['doubt', 'mistrust', 'misgiving', 'feeling that something is wrong']::text[], 'I had a suspicion that the email was fake.', 'His sudden departure raised suspicion among colleagues.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B03'), 'thankfully', 'adverb', ARRAY['fortunately', 'luckily', 'to our relief', 'happily']::text[], 'Thankfully, the rain stopped before the event began.', 'We missed the bus, but thankfully another one came soon.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B03'), 'productive', 'adjective', ARRAY['efficient', 'effective', 'fruitful', 'useful']::text[], 'We had a productive meeting and made several decisions.', 'I feel more productive when I work without notifications.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B03'), 'minimize', 'verb', ARRAY['reduce', 'limit', 'lessen', 'keep to a minimum']::text[], 'We need to minimize delays during the move.', 'Close unused apps to minimize battery use.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B03'), 'remainder', 'noun', ARRAY['rest', 'remaining part', 'balance', 'what is left']::text[], 'You can pay the remainder next month.', 'We spent the remainder of the afternoon exploring the city.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B03'), 'parental', 'adjective', ARRAY['relating to parents', 'motherly or fatherly', 'concerning parenthood', 'family-related']::text[], 'Parental leave policies vary between companies.', 'The school asks for parental consent before the trip.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B03'), 'suicide', 'noun', ARRAY['taking one''s own life', 'self-inflicted death', 'death by suicide', 'intentional self-killing']::text[], 'The documentary discusses suicide prevention and mental health support.', 'The charity offers support to families affected by suicide.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B03'), 'inspection', 'noun', ARRAY['examination', 'check', 'assessment', 'review']::text[], 'The car passed its annual inspection.', 'We scheduled an inspection before buying the house.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B03'), 'sensation', 'noun', ARRAY['feeling', 'physical perception', 'impression', 'experience']::text[], 'I had a strange sensation in my hands after the workout.', 'She described a tingling sensation in her fingertips.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B04'), 'violate', 'verb', ARRAY['break', 'breach', 'infringe', 'disregard']::text[], 'Sharing those files would violate company policy.', 'A late payment may violate the terms of the agreement.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B04'), 'thereafter', 'adverb', ARRAY['after that', 'subsequently', 'from then on', 'later']::text[], 'We signed the agreement and started work shortly thereafter.', 'The service is free for a month and charged monthly thereafter.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B04'), 'prevention', 'noun', ARRAY['avoidance', 'protection', 'stopping something before it happens', 'proactive protection']::text[], 'Regular backups are essential for data loss prevention.', 'The campaign focuses on the prevention of road accidents.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B04'), 'respective', 'adjective', ARRAY['individual', 'corresponding', 'belonging to each', 'particular']::text[], 'Please return to your respective teams after lunch.', 'Both managers explained their respective responsibilities.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B04'), 'suburban', 'adjective', ARRAY['residential', 'outside the city center', 'on the outskirts', 'relating to suburbs']::text[], 'They moved to a quiet suburban neighborhood.', 'Suburban train services are more frequent during rush hour.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B04'), 'replacement', 'noun', ARRAY['substitute', 'alternative', 'new person or thing', 'stand-in']::text[], 'We need a replacement for the broken chair.', 'The company sent a replacement phone within two days.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B04'), 'succession', 'noun', ARRAY['sequence', 'series', 'chain', 'taking over a role']::text[], 'Three meetings happened in quick succession.', 'The company has a succession plan for senior roles.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B04'), 'unify', 'verb', ARRAY['unite', 'bring together', 'combine', 'integrate']::text[], 'We should unify the two support processes.', 'The new design aims to unify the look of our apps.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B04'), 'reminder', 'noun', ARRAY['prompt', 'notification', 'memory aid', 'alert']::text[], 'Set a reminder so you don''t miss the appointment.', 'Thanks for the reminder about tomorrow''s meeting.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B04'), 'verify', 'verb', ARRAY['confirm', 'check', 'validate', 'authenticate']::text[], 'Please verify your email address to finish registering.', 'We need to verify the figures before sending the report.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B05'), 'stabilize', 'verb', ARRAY['steady', 'bring under control', 'make stable', 'balance']::text[], 'The engineers worked to stabilize the network after the outage.', 'Prices should stabilize when supply improves.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B05'), 'settlement', 'noun', ARRAY['agreement', 'resolution', 'arrangement', 'negotiated outcome']::text[], 'Both parties reached a settlement without going to court.', 'We accepted the settlement after our lawyers reviewed it.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B05'), 'pioneer', 'noun', ARRAY['trailblazer', 'innovator', 'early developer', 'leading explorer']::text[], 'She was a pioneer in digital education.', 'We met a pioneer of accessible design at the conference.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B05'), 'notably', 'adverb', ARRAY['especially', 'particularly', 'significantly', 'most importantly']::text[], 'Several people contributed, notably the design team.', 'The new version is faster and, notably, much easier to use.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B05'), 'withdrawal', 'noun', ARRAY['removal', 'retreat', 'pulling back', 'taking out']::text[], 'The bank charges a fee for cash withdrawal.', 'His sudden withdrawal from the competition surprised everyone.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B05'), 'specialized', 'adjective', ARRAY['expert', 'focused', 'highly specific', 'tailored to a field']::text[], 'We hired a specialized technician to repair the equipment.', 'The course offers specialized training for healthcare workers.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B05'), 'rejection', 'noun', ARRAY['refusal', 'denial', 'dismissal', 'nonacceptance']::text[], 'She handled the rejection better than she expected.', 'The proposal''s rejection forced us to reconsider the budget.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B05'), 'supervise', 'verb', ARRAY['oversee', 'manage', 'monitor', 'direct']::text[], 'Someone needs to supervise the new trainees.', 'She''ll supervise the installation tomorrow morning.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B05'), 'simulate', 'verb', ARRAY['imitate', 'recreate', 'model', 'reproduce']::text[], 'The software can simulate different traffic conditions.', 'We used a practice session to simulate the real interview.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B05'), 'sacrifice', 'noun', ARRAY['give up', 'surrender', 'forgo', 'relinquish']::text[], 'Giving up my weekends would be a real sacrifice.', 'They made a big sacrifice to send their children to college.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B06'), 'manipulate', 'verb', ARRAY['control', 'influence', 'exploit', 'handle skillfully']::text[], 'It''s wrong to manipulate people into agreeing with you.', 'You can manipulate the image using simple editing tools.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B06'), 'suspension', 'noun', ARRAY['temporary stop', 'pause', 'interruption', 'temporary removal']::text[], 'The company announced the suspension of the service.', 'His suspension from the team will last two games.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B06'), 'surrender', 'verb', ARRAY['give up', 'yield', 'submit', 'relinquish']::text[], 'The suspect eventually agreed to surrender.', 'I refuse to surrender my weekends to unnecessary meetings.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B06'), 'resemble', 'verb', ARRAY['look like', 'be similar to', 'take after', 'bear a likeness to']::text[], 'You resemble your mother in that photo.', 'The new menu doesn''t resemble the old one at all.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B06'), 'audit', 'noun', ARRAY['inspection', 'review', 'examination', 'formal check']::text[], 'The finance team is preparing for an annual audit.', 'Our security audit identified several weak points.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B06'), 'reflection', 'noun', ARRAY['thought', 'consideration', 'contemplation', 'careful evaluation']::text[], 'After some reflection, I decided to accept the offer.', 'A moment of reflection helped her see the issue differently.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B06'), 'processor', 'noun', ARRAY['central processing unit', 'computing chip', 'CPU', 'data-processing unit']::text[], 'The laptop''s processor is too slow for video editing.', 'We upgraded the processor to improve performance.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B06'), 'structural', 'adjective', ARRAY['relating to a framework', 'foundational', 'organizational', 'load-bearing']::text[], 'The engineer found a structural problem with the bridge.', 'We need structural changes, not just a new color scheme.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B06'), 'accommodating', 'adjective', ARRAY['flexible', 'helpful', 'considerate', 'willing to adjust']::text[], 'The hotel staff were accommodating when our flight was delayed.', 'She''s very accommodating about last-minute schedule changes.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B06'), 'obsession', 'noun', ARRAY['fixation', 'preoccupation', 'consuming interest', 'compulsion']::text[], 'His obsession with productivity was making him miserable.', 'Collecting old cameras became an obsession for her.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B07'), 'evacuate', 'verb', ARRAY['leave for safety', 'clear out', 'move to safety', 'empty']::text[], 'The staff had to evacuate the building after the alarm.', 'Please evacuate the area if you smell gas.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B07'), 'supervisor', 'noun', ARRAY['manager', 'team leader', 'overseer', 'person in charge']::text[], 'Ask your supervisor before changing the schedule.', 'My supervisor gave me helpful feedback on the report.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B07'), 'removal', 'noun', ARRAY['elimination', 'taking away', 'deletion', 'extraction']::text[], 'The removal of the old furniture took two hours.', 'You can request removal of your personal information.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B07'), 'humanity', 'noun', ARRAY['compassion', 'kindness', 'empathy', 'concern for others']::text[], 'The nurse treated every patient with humanity.', 'We should show humanity when someone makes an honest mistake.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B07'), 'interactive', 'adjective', ARRAY['participatory', 'responsive', 'engaging with the user', 'two-way']::text[], 'The app includes interactive lessons and quizzes.', 'We had an interactive workshop instead of a long lecture.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B07'), 'originate', 'verb', ARRAY['begin', 'arise', 'stem from', 'have its source']::text[], 'The idea seemed to originate during our team discussion.', 'Many local dishes originate from family recipes.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B07'), 'explicitly', 'adverb', ARRAY['clearly', 'directly', 'unambiguously', 'in plain terms']::text[], 'The contract explicitly states that refunds are limited.', 'She explicitly asked us not to share the photos.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B07'), 'endorse', 'verb', ARRAY['support', 'approve', 'back', 'recommend publicly']::text[], 'The committee decided to endorse the proposal.', 'I wouldn''t endorse a product I haven''t used.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B07'), 'intensify', 'verb', ARRAY['increase', 'heighten', 'strengthen', 'escalate']::text[], 'The rain began to intensify after sunset.', 'The competition is expected to intensify next year.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B07'), 'portfolio', 'noun', ARRAY['collection of work', 'set of investments', 'range of products', 'body of projects']::text[], 'She sent her design portfolio with the application.', 'We''re reviewing our product portfolio for next year.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B08'), 'consolidate', 'verb', ARRAY['combine', 'bring together', 'merge', 'strengthen']::text[], 'We should consolidate the files into one shared folder.', 'The company wants to consolidate its position in the market.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B08'), 'isolation', 'noun', ARRAY['separation', 'loneliness', 'being alone', 'seclusion']::text[], 'Remote work can create feelings of isolation.', 'The patient remained in isolation until the test results arrived.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B08'), 'biography', 'noun', ARRAY['life story', 'life account', 'written life history', 'biographical work']::text[], 'I''m reading a biography of a famous scientist.', 'The author spent years researching the biography.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B08'), 'underlying', 'adjective', ARRAY['fundamental', 'hidden', 'basic', 'root']::text[], 'We need to understand the underlying cause of the issue.', 'There was an underlying tension during the meeting.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B08'), 'enthusiast', 'noun', ARRAY['fan', 'devotee', 'hobbyist', 'passionate supporter']::text[], 'He''s a photography enthusiast who travels every weekend.', 'Every coffee enthusiast has a favorite brewing method.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B08'), 'supposedly', 'adverb', ARRAY['allegedly', 'reportedly', 'apparently', 'according to what people say']::text[], 'The package is supposedly arriving tomorrow.', 'That restaurant is supposedly the best in the city.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B08'), 'adaptation', 'noun', ARRAY['adjustment', 'modification', 'alteration', 'new version']::text[], 'Moving abroad requires some adaptation.', 'The film is an adaptation of a popular novel.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B08'), 'residential', 'adjective', ARRAY['housing-related', 'domestic', 'noncommercial', 'intended for homes']::text[], 'The building is in a quiet residential area.', 'Internet plans differ for residential and business users.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B08'), 'delegation', 'noun', ARRAY['assignment of responsibility', 'transfer of authority', 'entrusting tasks', 'group of representatives']::text[], 'Better delegation helped the manager avoid burnout.', 'A small delegation visited the factory last week.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B08'), 'indicator', 'noun', ARRAY['sign', 'signal', 'measure', 'gauge']::text[], 'Rising complaints may be an indicator of a larger problem.', 'The dashboard uses a simple indicator to show progress.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B09'), 'accelerate', 'verb', ARRAY['speed up', 'quicken', 'hasten', 'increase the pace']::text[], 'We need to accelerate the testing process.', 'The car began to accelerate as it entered the highway.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B09'), 'interior', 'adjective', ARRAY['inside', 'inner', 'internal', 'located within']::text[], 'I prefer the car with the lighter interior.', 'The apartment has an interior courtyard with plants.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B09'), 'parameter', 'noun', ARRAY['limit', 'boundary', 'condition', 'defined setting']::text[], 'A budget parameter helps keep spending under control.', 'You can change each search parameter in the settings.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B09'), 'composition', 'noun', ARRAY['makeup', 'structure', 'arrangement', 'mixture']::text[], 'The composition of the team has changed significantly.', 'The photograph has a beautiful composition.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B09'), 'exclusively', 'adverb', ARRAY['only', 'solely', 'entirely', 'without others']::text[], 'The discount is available exclusively to members.', 'She works exclusively with small businesses.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B09'), 'recipient', 'noun', ARRAY['receiver', 'beneficiary', 'addressee', 'person who receives']::text[], 'Please double-check the recipient before sending the email.', 'She was the recipient of this year''s community award.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B09'), 'separation', 'noun', ARRAY['division', 'split', 'distancing', 'being kept apart']::text[], 'The separation of work and personal accounts is essential.', 'Their separation was difficult for the whole family.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B09'), 'theatrical', 'adjective', ARRAY['dramatic', 'exaggerated', 'stage-like', 'showy']::text[], 'He gave a theatrical sigh when the meeting ran late.', 'The performance had a theatrical style that surprised us.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B09'), 'substitution', 'noun', ARRAY['replacement', 'exchange', 'swap', 'use of an alternative']::text[], 'The coach made a substitution just before halftime.', 'Ingredient substitution is easy in this recipe.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B09'), 'calculation', 'noun', ARRAY['computation', 'estimate', 'working out', 'arithmetic result']::text[], 'My calculation shows that we can afford the trip.', 'There was a mistake in the original calculation.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B10'), 'profitable', 'adjective', ARRAY['lucrative', 'money-making', 'financially rewarding', 'earning a profit']::text[], 'The new product became profitable within a year.', 'Running that service isn''t profitable at the current price.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B10'), 'realization', 'noun', ARRAY['understanding', 'recognition', 'awareness', 'sudden insight']::text[], 'I had a realization that we were solving the wrong problem.', 'The realization that she''d lost her keys came at the worst moment.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B10'), 'problematic', 'adjective', ARRAY['troublesome', 'difficult', 'questionable', 'causing problems']::text[], 'The new rule is problematic for part-time employees.', 'That assumption seems problematic given the latest data.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B10'), 'hostility', 'noun', ARRAY['animosity', 'antagonism', 'ill will', 'resentment']::text[], 'There was clear hostility between the two teams.', 'The proposal was met with unexpected hostility.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B10'), 'long-standing', 'adjective', ARRAY['established', 'enduring', 'persistent', 'in place for years']::text[], 'We have a long-standing relationship with that supplier.', 'It''s a long-standing tradition in our family.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B10'), 'characterize', 'verb', ARRAY['describe', 'define', 'portray', 'distinguish']::text[], 'How would you characterize the changes in customer behavior?', 'The company tends to characterize every delay as minor.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B10'), 'validity', 'noun', ARRAY['soundness', 'legitimacy', 'correctness', 'being valid']::text[], 'We questioned the validity of the survey results.', 'Check the ticket''s validity before traveling.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B10'), 'continually', 'adverb', ARRAY['constantly', 'repeatedly', 'again and again', 'without stopping']::text[], 'The app continually checks for updates in the background.', 'We continually improve the course based on feedback.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B10'), 'statistical', 'adjective', ARRAY['numerical', 'data-based', 'relating to statistics', 'quantitative']::text[], 'The report includes a statistical analysis of the results.', 'They found no statistical evidence of a difference.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B10'), 'invisible', 'adjective', ARRAY['unseen', 'hidden', 'not visible', 'imperceptible']::text[], 'The stain was almost invisible after cleaning.', 'Some disabilities are invisible to other people.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B11'), 'integrated', 'adjective', ARRAY['combined', 'unified', 'interconnected', 'coordinated']::text[], 'The new system offers an integrated view of customer data.', 'We need an integrated approach across all departments.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B11'), 'revelation', 'noun', ARRAY['disclosure', 'discovery', 'surprising news', 'unexpected realization']::text[], 'The interview included a revelation about her early career.', 'It was a revelation to discover how much time we were wasting.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B11'), 'situated', 'adjective', ARRAY['located', 'positioned', 'placed', 'set']::text[], 'The hotel is situated near the train station.', 'Our office is conveniently situated in the city center.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B11'), 'administer', 'verb', ARRAY['manage', 'supervise', 'oversee', 'carry out']::text[], 'The school will administer the exam next week.', 'A nurse will administer the vaccine at the clinic.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B11'), 'reportedly', 'adverb', ARRAY['allegedly', 'according to reports', 'apparently', 'supposedly']::text[], 'The company is reportedly planning to expand abroad.', 'The airport is reportedly experiencing long delays.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B11'), 'compensation', 'noun', ARRAY['payment', 'reimbursement', 'financial redress', 'something offered in return']::text[], 'Passengers requested compensation for the canceled flight.', 'The salary package includes compensation for travel expenses.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B11'), 'inspiration', 'noun', ARRAY['motivation', 'encouragement', 'creative spark', 'source of ideas']::text[], 'Her story was an inspiration to the whole team.', 'I often find inspiration while walking outdoors.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B11'), 'coordinate', 'verb', ARRAY['organize', 'synchronize', 'arrange', 'bring into alignment']::text[], 'Let''s coordinate our calendars before setting a date.', 'She''ll coordinate the volunteers during the event.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B11'), 'occasional', 'adjective', ARRAY['infrequent', 'sporadic', 'intermittent', 'happening from time to time']::text[], 'We still have occasional problems with the Wi-Fi.', 'An occasional break helps me stay focused.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B11'), 'activation', 'noun', ARRAY['switching on', 'enabling', 'starting', 'making active']::text[], 'The account activation link expires after an hour.', 'Activation of the new feature requires approval.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B12'), 'commentary', 'noun', ARRAY['analysis', 'explanation', 'running remarks', 'opinion']::text[], 'The podcast offers thoughtful commentary on current events.', 'I prefer watching matches with live commentary.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B12'), 'resignation', 'noun', ARRAY['quitting', 'stepping down', 'departure from a position', 'formal notice to leave']::text[], 'Her resignation surprised everyone on the team.', 'He submitted his resignation after accepting another job.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B12'), 'governance', 'noun', ARRAY['oversight', 'management framework', 'administration', 'system of control']::text[], 'Strong governance helps protect customer information.', 'The board reviewed the company''s governance practices.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B12'), 'complication', 'noun', ARRAY['difficulty', 'problem', 'obstacle', 'unexpected issue']::text[], 'The booking went smoothly apart from one small complication.', 'A complication after surgery delayed his recovery.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B12'), 'kidnap', 'verb', ARRAY['abduct', 'seize unlawfully', 'take by force', 'hold captive']::text[], 'The police were investigating a plan to kidnap a businessman.', 'The story involves criminals who plan to kidnap a child.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B12'), 'monopoly', 'noun', ARRAY['exclusive control', 'market dominance', 'sole supplier position', 'exclusive ownership']::text[], 'The company once had a monopoly in the local market.', 'A monopoly can limit customers'' choices.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B12'), 'favourable', 'adjective', ARRAY['positive', 'advantageous', 'beneficial', 'promising']::text[], 'The client gave us a favourable response.', 'Weather conditions look favourable for the trip.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B12'), 'homeland', 'noun', ARRAY['native country', 'country of origin', 'motherland', 'home country']::text[], 'She returned to her homeland after many years abroad.', 'The festival celebrates music from his homeland.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B12'), 'legendary', 'adjective', ARRAY['famous', 'celebrated', 'iconic', 'widely admired']::text[], 'The restaurant is legendary for its enormous sandwiches.', 'Her patience with customers is legendary.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B12'), 'ironically', 'adverb', ARRAY['paradoxically', 'unexpectedly', 'in an ironic twist', 'contrary to expectations']::text[], 'Ironically, I forgot my umbrella on the only rainy day of the trip.', 'He spent years fixing computers and, ironically, couldn''t repair his own laptop.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B13'), 'desktop', 'noun', ARRAY['desk computer', 'personal workstation', 'nonportable computer', 'desktop PC']::text[], 'I use my desktop for video editing.', 'The new dashboard works on both mobile and desktop.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B13'), 'transcript', 'noun', ARRAY['written record', 'text version', 'verbatim record', 'transcription']::text[], 'The meeting transcript will be available tomorrow.', 'I read the podcast transcript to check a quote.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B13'), 'preach', 'verb', ARRAY['deliver a sermon', 'teach religious principles', 'proclaim', 'advocate strongly']::text[], 'He used to preach at the local church on Sundays.', 'She doesn''t like people who preach about healthy eating all the time.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B13'), 'accused', 'noun', ARRAY['defendant', 'suspect', 'person charged', 'alleged offender']::text[], 'The accused denied the charges in court.', 'The lawyer asked that the accused receive a fair trial.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B13'), 'encouraging', 'adjective', ARRAY['promising', 'positive', 'reassuring', 'hopeful']::text[], 'The early test results are encouraging.', 'She gave me some encouraging feedback on my progress.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B13'), 'rape', 'noun', ARRAY['sexual assault', 'forced sexual intercourse', 'nonconsensual penetration', 'sexual violence']::text[], 'The organization provides confidential support to survivors of rape.', 'The documentary discusses how rape cases are handled by the justice system.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B13'), 'post-war', 'adjective', ARRAY['after the war', 'following wartime', 'peacetime', 'in the period after a conflict']::text[], 'The town expanded rapidly in the post-war years.', 'We visited a museum dedicated to post-war architecture.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B13'), 'hostage', 'noun', ARRAY['captive', 'detainee held as leverage', 'person held against their will', 'seized person']::text[], 'The police negotiated for the release of the hostage.', 'The film follows a reporter taken hostage overseas.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B13'), 'coastal', 'adjective', ARRAY['seaside', 'near the shore', 'shoreline', 'maritime']::text[], 'We stayed in a small coastal village for the weekend.', 'Coastal roads can be beautiful but windy.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B13'), 'regime', 'noun', ARRAY['government', 'ruling system', 'administration', 'system of rules']::text[], 'The country introduced a new tax regime.', 'The report criticized the previous regime''s policies.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B14'), 'syndrome', 'noun', ARRAY['set of symptoms', 'group of related signs', 'symptom complex', 'recognizable condition pattern']::text[], 'The doctor explained the symptoms associated with the syndrome.', 'The article describes how the syndrome affects sleep.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B14'), 'inject', 'verb', ARRAY['insert with a needle', 'administer by injection', 'introduce', 'put into']::text[], 'A nurse will inject the medicine at the clinic.', 'We should inject some humor into the presentation.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B14'), 'outbreak', 'noun', ARRAY['sudden spread', 'eruption', 'flare-up', 'surge of cases']::text[], 'The city reported an outbreak of flu.', 'The restaurant closed temporarily after a food poisoning outbreak.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B14'), 'erect', 'verb', ARRAY['build', 'raise', 'put up', 'construct']::text[], 'Workers will erect a temporary barrier around the site.', 'They plan to erect a new sign outside the store.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B14'), 'sexuality', 'noun', ARRAY['sexual orientation', 'sexual identity', 'sexual feelings', 'sexual nature']::text[], 'The course discusses sexuality and relationships in a respectful way.', 'She spoke openly about understanding her sexuality.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B14'), 'intermediate', 'adjective', ARRAY['mid-level', 'moderate', 'between basic and advanced', 'middle-stage']::text[], 'This is an intermediate English class.', 'The exercise is too easy for advanced students but suits intermediate learners.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B14'), 'accomplishment', 'noun', ARRAY['achievement', 'success', 'milestone', 'completed task']::text[], 'Finishing my degree was a huge accomplishment.', 'The team celebrated every accomplishment, however small.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B14'), 'solidarity', 'noun', ARRAY['unity', 'mutual support', 'togetherness', 'shared commitment']::text[], 'Neighbors showed solidarity after the storm.', 'The workers organized the event as a sign of solidarity.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B14'), 'corresponding', 'adjective', ARRAY['matching', 'related', 'equivalent', 'associated']::text[], 'Please enter each date in the corresponding field.', 'The increase in orders led to a corresponding rise in costs.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B14'), 'terrain', 'noun', ARRAY['landscape', 'ground', 'land surface', 'physical landscape']::text[], 'The trail crosses rocky terrain.', 'This vehicle handles rough terrain better than our old car.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B15'), 'orientation', 'noun', ARRAY['introduction', 'briefing', 'induction', 'familiarization']::text[], 'New employees attend an orientation session on their first day.', 'The orientation helped us learn where everything was.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B15'), 'fundraising', 'noun', ARRAY['collecting donations', 'raising money', 'charitable giving campaign', 'seeking financial support']::text[], 'The school organized a fundraising event for new books.', 'Her fundraising efforts helped renovate the community center.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B15'), 'liberal', 'adjective', ARRAY['open-minded', 'progressive', 'tolerant', 'not strict']::text[], 'He has liberal views on social issues.', 'The hotel has a liberal cancellation policy.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B15'), 'casualty', 'noun', ARRAY['victim', 'injured person', 'person affected by a disaster', 'loss']::text[], 'The accident resulted in one casualty.', 'The small shop became a casualty of rising rent costs.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B15'), 'heritage', 'noun', ARRAY['tradition', 'cultural legacy', 'ancestry', 'inheritance']::text[], 'The festival celebrates the city''s cultural heritage.', 'She''s proud of her family''s heritage.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B15'), 'accumulation', 'noun', ARRAY['buildup', 'collection', 'gathering', 'gradual increase']::text[], 'The accumulation of dust made the room feel neglected.', 'Small savings can lead to a surprising accumulation over time.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B15'), 'declaration', 'noun', ARRAY['statement', 'announcement', 'proclamation', 'formal assertion']::text[], 'The mayor made a declaration about the new project.', 'You may need a customs declaration when traveling abroad.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B15'), 'cooperative', 'adjective', ARRAY['helpful', 'willing to work together', 'collaborative', 'accommodating']::text[], 'The staff were cooperative during the inspection.', 'We need a more cooperative approach between departments.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B15'), 'deteriorate', 'verb', ARRAY['worsen', 'decline', 'degrade', 'fall apart']::text[], 'The road will deteriorate without proper maintenance.', 'His condition began to deteriorate over the weekend.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B15'), 'substantially', 'adverb', ARRAY['considerably', 'significantly', 'greatly', 'to a large extent']::text[], 'The new model is substantially lighter.', 'Customer complaints have decreased substantially this year.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B16'), 'venture', 'noun', ARRAY['enterprise', 'undertaking', 'risky project', 'business initiative']::text[], 'She launched a new business venture with a friend.', 'The investment was a risky venture from the start.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B16'), 'segment', 'noun', ARRAY['section', 'portion', 'part', 'division']::text[], 'The campaign targets a specific segment of customers.', 'I watched only the first segment of the interview.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B16'), 'assembly', 'noun', ARRAY['gathering', 'meeting', 'group brought together', 'process of putting together']::text[], 'The furniture arrived with simple assembly instructions.', 'The school held a special assembly in the morning.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B16'), 'residue', 'noun', ARRAY['remains', 'leftover material', 'trace', 'deposit']::text[], 'There was a sticky residue on the jar after removing the label.', 'The cleaner left no residue on the glass.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B16'), 'rear', 'adjective', ARRAY['back', 'hind', 'posterior', 'toward the back']::text[], 'The car was damaged near its rear bumper.', 'You can enter through the rear door.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B16'), 'lesbian', 'adjective', ARRAY['gay woman', 'homosexual woman', 'woman attracted to women', 'same-sex-attracted woman']::text[], 'She spoke openly about being a lesbian at work.', 'The festival featured films made by lesbian directors.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B16'), 'shed', 'verb', ARRAY['discard', 'get rid of', 'let fall', 'cast off']::text[], 'The dog continues to shed fur all over the sofa.', 'The company hopes to shed its outdated image.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B16'), 'testify', 'verb', ARRAY['give evidence', 'make a sworn statement', 'bear witness', 'state under oath']::text[], 'She agreed to testify at the hearing.', 'Several employees may testify about the incident.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B16'), 'equation', 'noun', ARRAY['formula', 'mathematical expression', 'relationship between quantities', 'equality statement']::text[], 'I couldn''t solve the equation without a calculator.', 'Cost is only one part of the equation when choosing a supplier.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B16'), 'republic', 'noun', ARRAY['representative state', 'nonmonarchical state', 'elected-government state', 'republican nation']::text[], 'The country became a republic in the twentieth century.', 'The constitution defines how the republic is governed.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B17'), 'opt', 'verb', ARRAY['choose', 'select', 'decide', 'go for']::text[], 'I think I''ll opt for the cheaper plan.', 'Many customers opt to receive digital receipts.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B17'), 'surge', 'noun', ARRAY['sudden rise', 'sharp increase', 'rush', 'rapid growth']::text[], 'We saw a surge in orders after the promotion.', 'A power surge damaged the router.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B17'), 'cutting', 'noun', ARRAY['clipping', 'plant fragment', 'propagated stem', 'section of a plant']::text[], 'I took a plant cutting and put it in water.', 'The gardener showed us how to take a cutting from the rose bush.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B17'), 'scope', 'noun', ARRAY['range', 'extent', 'breadth', 'limits']::text[], 'The request is outside the scope of our agreement.', 'Let''s define the scope before estimating the cost.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B17'), 'render', 'verb', ARRAY['generate', 'display', 'draw', 'produce a visual representation']::text[], 'The software takes a moment to render the animation.', 'This browser can render detailed 3D objects smoothly.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B17'), 'vocal', 'adjective', ARRAY['outspoken', 'expressive', 'openly critical', 'loud in expressing views']::text[], 'She''s been vocal about the need for flexible hours.', 'Several customers were vocal in their criticism of the delay.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B17'), 'boom', 'noun', ARRAY['surge', 'rapid growth', 'period of prosperity', 'sudden expansion']::text[], 'The neighborhood is experiencing a construction boom.', 'Online shopping saw a boom during the holiday season.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B17'), 'gut', 'noun', ARRAY['instinct', 'intuition', 'inner feeling', 'stomach']::text[], 'My gut tells me we should double-check the figures.', 'He followed his gut rather than choosing the most popular option.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B17'), 'blend', 'noun', ARRAY['mixture', 'combination', 'fusion', 'mix']::text[], 'The tea is a blend of several herbs.', 'The design is a blend of modern and traditional styles.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B17'), 'anchor', 'noun', ARRAY['support', 'stabilizing point', 'mainstay', 'thing that holds something in place']::text[], 'That routine has become an anchor in my busy week.', 'The boat''s anchor kept it from drifting away.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B18'), 'tender', 'adjective', ARRAY['gentle', 'soft', 'sensitive', 'caring']::text[], 'The meat was tender enough to cut with a fork.', 'She gave the child a tender hug before leaving.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B18'), 'dip', 'verb', ARRAY['lower', 'sink briefly', 'plunge into', 'drop slightly']::text[], 'Dip the bread into the soup.', 'Sales tend to dip after the holiday season.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B18'), 'rally', 'noun', ARRAY['demonstration', 'public meeting', 'protest gathering', 'mass assembly']::text[], 'Thousands attended a rally in the city center.', 'Organizers planned another rally outside city hall.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B18'), 'strip', 'noun', ARRAY['narrow piece', 'thin band', 'long section', 'ribbon-like piece']::text[], 'Cut the paper into a thin strip.', 'The app displays a strip of thumbnails at the bottom.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B18'), 'sole', 'adjective', ARRAY['only', 'single', 'exclusive', 'one and only']::text[], 'She was the sole person responsible for the decision.', 'Our sole concern is whether the data is secure.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B18'), 'probe', 'noun', ARRAY['investigation', 'inquiry', 'examination', 'detailed inspection']::text[], 'The agency launched a probe into the incident.', 'The doctor used a small probe during the examination.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B18'), 'filter', 'noun', ARRAY['screen', 'strainer', 'separator', 'device that removes unwanted material']::text[], 'Replace the water filter every six months.', 'Use the search filter to show only recent messages.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B18'), 'ray', 'noun', ARRAY['beam', 'shaft of light', 'streak of light', 'narrow stream of energy']::text[], 'A ray of sunlight came through the curtains.', 'Her message offered a ray of hope during a difficult week.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B18'), 'breed', 'noun', ARRAY['type', 'variety', 'strain', 'kind of animal']::text[], 'What breed is your dog?', 'This breed is known for being friendly with children.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B18'), 'predominantly', 'adverb', ARRAY['mainly', 'mostly', 'largely', 'primarily']::text[], 'The audience was predominantly young adults.', 'The town''s economy is predominantly based on tourism.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B19'), 'referendum', 'noun', ARRAY['public vote', 'popular ballot', 'direct vote', 'plebiscite']::text[], 'The country held a referendum on the proposed change.', 'Residents will vote in a local referendum next month.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B19'), 'solicitor', 'noun', ARRAY['lawyer', 'legal adviser', 'legal practitioner', 'attorney in some contexts']::text[], 'We spoke to a solicitor before signing the contract.', 'Her solicitor reviewed the property documents.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B19'), 'rip', 'verb', ARRAY['tear', 'split', 'shred', 'pull apart']::text[], 'Be careful not to rip the wrapping paper.', 'My jeans started to rip at the knee.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B19'), 'decision-making', 'noun', ARRAY['choosing', 'evaluating options', 'reaching decisions', 'selection process']::text[], 'Good data can improve decision-making.', 'The team wants more transparency in decision-making.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B19'), 'presidency', 'noun', ARRAY['term as president', 'presidential office', 'period of leadership', 'office of president']::text[], 'The policy changed during his presidency.', 'She announced plans to run for the presidency.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B19'), 'reverse', 'adjective', ARRAY['opposite', 'backward', 'contrary', 'inverted']::text[], 'Try the reverse approach: start with the easiest step.', 'The reverse side of the card has the instructions.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B19'), 'grave', 'adjective', ARRAY['serious', 'severe', 'solemn', 'alarming']::text[], 'The doctor said the situation was grave.', 'There were grave concerns about the building''s safety.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B19'), 'elite', 'noun', ARRAY['select', 'top-tier', 'highly skilled', 'prestigious']::text[], 'She trains with an elite group of athletes.', 'An elite school isn''t necessarily the best fit for everyone.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B19'), 'discharge', 'verb', ARRAY['release', 'dismissal', 'emission', 'removal']::text[], 'The hospital confirmed his discharge for Friday.', 'The factory was fined for illegal waste discharge.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B19'), 'ranking', 'noun', ARRAY['position', 'placement', 'rating', 'order by performance']::text[], 'The team''s ranking improved after the win.', 'Her ranking improved after the latest tournament.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B20'), 'enforce', 'verb', ARRAY['apply', 'impose', 'uphold', 'ensure compliance with']::text[], 'The building manager must enforce the safety rules.', 'It''s hard to enforce a rule that nobody understands.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B20'), 'corrupt', 'adjective', ARRAY['dishonest', 'unethical', 'fraudulent', 'open to bribery']::text[], 'The investigation uncovered corrupt officials.', 'A corrupt file prevented the program from opening.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B20'), 'mining', 'noun', ARRAY['extracting minerals', 'digging for resources', 'mineral production', 'excavation for ore']::text[], 'The region has a long history of mining.', 'The company is reducing its environmental impact from mining.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B20'), 'mainland', 'noun', ARRAY['continental landmass', 'main part of a country', 'continental territory', 'main island''s opposite']::text[], 'The ferry connects the island to the mainland.', 'We could see the mainland from the beach.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B20'), 'infant', 'noun', ARRAY['baby', 'newborn', 'very young child', 'toddler in early infancy']::text[], 'The airline provides a special seat for each infant.', 'An infant needs extra care during hot weather.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B20'), 'simultaneously', 'adverb', ARRAY['at the same time', 'concurrently', 'together', 'in parallel']::text[], 'The app can play audio and display subtitles simultaneously.', 'Two people answered simultaneously, and everyone laughed.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B20'), 'assault', 'noun', ARRAY['attack', 'violent offense', 'physical attack', 'aggression']::text[], 'The police investigated an assault outside the station.', 'The hospital treated a victim of assault last night.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B20'), 'philosopher', 'noun', ARRAY['thinker', 'intellectual', 'scholar of philosophy', 'philosophical writer']::text[], 'The philosopher wrote about ethics and everyday choices.', 'The philosopher raised questions about what makes a good life.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B20'), 'memoir', 'noun', ARRAY['autobiographical account', 'personal recollections', 'life story', 'reminiscence']::text[], 'I bought her memoir after hearing the interview.', 'The memoir describes his early years in a small town.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-PRE-01-B20'), 'lawsuit', 'noun', ARRAY['legal action', 'court case', 'legal claim', 'civil suit']::text[], 'The company is facing a lawsuit over the contract.', 'They settled the lawsuit before it went to trial.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B01'), 'coordinator', 'noun', ARRAY['organizer', 'facilitator', 'person in charge of logistics', 'liaison']::text[], 'Our coordinator sent the agenda before the workshop.', 'Ask the event coordinator if you need accessibility support.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B01'), 'accusation', 'noun', ARRAY['allegation', 'charge', 'claim of wrongdoing', 'allegation of blame']::text[], 'He denied the accusation that he had leaked the document.', 'It''s unfair to make an accusation without evidence.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B01'), 'simulation', 'noun', ARRAY['model', 'imitation', 'virtual scenario', 'realistic reproduction']::text[], 'We ran a simulation to test the system under heavy traffic.', 'The pilot used a flight simulation to practice emergencies.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B01'), 'supervision', 'noun', ARRAY['oversight', 'monitoring', 'guidance', 'management']::text[], 'The new employees need supervision during their first week.', 'Children must use the pool under adult supervision.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B01'), 'stability', 'noun', ARRAY['steadiness', 'consistency', 'balance', 'security']::text[], 'The update improved the stability of the app.', 'She values financial stability more than a higher-risk salary.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B01'), 'cult', 'adjective', ARRAY['underground', 'niche', 'followed by devoted fans', 'alternative']::text[], 'The film became a cult classic years after its release.', 'That small café has a cult following among local students.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B01'), 'divine', 'adjective', ARRAY['wonderful', 'exquisite', 'heavenly', 'sublime']::text[], 'The chocolate dessert tasted divine after such a long day.', 'After the overnight flight, a hot shower felt divine.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B01'), 'successive', 'adjective', ARRAY['consecutive', 'sequential', 'one after another', 'repeated in sequence']::text[], 'Sales rose for three successive months.', 'She won the award in two successive years.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B01'), 'productivity', 'noun', ARRAY['output', 'efficiency', 'rate of production', 'work accomplished']::text[], 'Short breaks can actually improve productivity.', 'Our productivity fell when the internet kept disconnecting.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B01'), 'bolster', 'verb', ARRAY['strengthen', 'reinforce', 'support', 'boost']::text[], 'The positive review helped bolster her confidence.', 'Extra training could bolster the team''s technical skills.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B02'), 'supplement', 'noun', ARRAY['addition', 'extra resource', 'complement', 'something added']::text[], 'The guide is a useful supplement to the video lessons.', 'The doctor recommended a vitamin supplement after the test.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B02'), 'warfare', 'noun', ARRAY['armed conflict', 'fighting', 'military combat', 'war operations']::text[], 'The museum explores the history of modern warfare.', 'Cyber warfare has become a major concern for governments.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B02'), 'elaborate', 'adjective', ARRAY['detailed', 'intricate', 'sophisticated', 'complex']::text[], 'They prepared an elaborate surprise for her birthday.', 'The presentation had an elaborate diagram of the new system.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B02'), 'integrity', 'noun', ARRAY['honesty', 'moral uprightness', 'soundness', 'trustworthiness']::text[], 'I trust her because she acts with integrity.', 'The backup process helps protect the integrity of our data.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B02'), 'injection', 'noun', ARRAY['shot', 'administration by needle', 'infusion by syringe', 'introduction of liquid']::text[], 'The nurse gave him an injection before the procedure.', 'The project received a cash injection from new investors.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B02'), 'patrol', 'noun', ARRAY['rounds', 'regular inspection', 'security sweep', 'watch']::text[], 'A security patrol passed our building after dark.', 'The night guard began his patrol at ten.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B02'), 'tactical', 'adjective', ARRAY['strategic in the short term', 'calculated', 'planned', 'designed for a specific objective']::text[], 'We made a tactical change to the campaign before launch.', 'The coach explained a tactical adjustment at halftime.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B02'), 'liberation', 'noun', ARRAY['freedom', 'release', 'emancipation', 'setting free']::text[], 'The book describes the country''s struggle for liberation.', 'For her, leaving the stressful job felt like liberation.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B02'), 'respectively', 'adverb', ARRAY['in that order', 'correspondingly', 'each in turn', 'in the same sequence']::text[], 'Anna and Sam scored 8 and 9, respectively.', 'The meetings will be held on Tuesday and Thursday, respectively.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B02'), 'mitigate', 'verb', ARRAY['reduce', 'lessen', 'alleviate', 'make less severe']::text[], 'Regular backups help mitigate the risk of data loss.', 'We can mitigate delays by testing the process early.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B03'), 'revolutionary', 'adjective', ARRAY['groundbreaking', 'radical', 'transformative', 'innovative']::text[], 'The device was considered revolutionary when it launched.', 'Her approach to teaching felt revolutionary at the time.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B03'), 'prevail', 'verb', ARRAY['win out', 'triumph', 'succeed', 'prove stronger']::text[], 'We hope common sense will prevail during the discussion.', 'We hope fairness will prevail when the final decision is made.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B03'), 'organizational', 'adjective', ARRAY['administrative', 'relating to a company', 'structural', 'institutional']::text[], 'The change involves several organizational challenges.', 'She has excellent organizational skills.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B03'), 'substitute', 'noun', ARRAY['replacement', 'alternative', 'stand-in', 'equivalent']::text[], 'Almond milk is a common substitute for dairy milk.', 'We need a substitute teacher for tomorrow''s class.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B03'), 'processing', 'noun', ARRAY['handling', 'treatment', 'computation', 'transformation of data']::text[], 'Payment processing can take up to two business days.', 'We use software for processing customer requests.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B03'), 'moderate', 'adjective', ARRAY['reasonable', 'average', 'not extreme', 'restrained']::text[], 'The apartment is available at a moderate price.', 'The doctor recommended moderate exercise during recovery.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B03'), 'optical', 'adjective', ARRAY['visual', 'related to sight', 'involving light', 'relating to lenses']::text[], 'The shop sells optical equipment and glasses.', 'The image looks distorted because of an optical effect.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B03'), 'experimental', 'adjective', ARRAY['innovative', 'trial', 'untested', 'exploratory']::text[], 'The school is testing an experimental teaching method.', 'The feature is still experimental and may change.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B03'), 'counterpart', 'noun', ARRAY['equivalent', 'peer', 'person in a matching role', 'corresponding person']::text[], 'I spoke with my counterpart in the other department.', 'The new model is lighter than its European counterpart.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B03'), 'treaty', 'noun', ARRAY['formal agreement', 'pact', 'international accord', 'convention']::text[], 'The two countries signed a peace treaty.', 'The documentary explains why the treaty was controversial.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B04'), 'spectacle', 'noun', ARRAY['show', 'display', 'impressive sight', 'public event']::text[], 'The fireworks were an incredible spectacle.', 'The argument turned into a spectacle in front of everyone.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B04'), 'feminist', 'adjective', ARRAY['supporter of gender equality', 'women''s rights advocate', 'equal-rights campaigner', 'gender-equality advocate']::text[], 'She describes herself as a feminist and supports equal pay.', 'The book examines feminist movements in the twentieth century.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B04'), 'funeral', 'noun', ARRAY['burial service', 'memorial ceremony', 'final farewell', 'ceremony for the deceased']::text[], 'We traveled home for my uncle''s funeral.', 'The family asked for a small, private funeral.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B04'), 'surgical', 'adjective', ARRAY['related to an operation', 'operative', 'involving surgery', 'relating to surgery']::text[], 'The doctor explained the surgical procedure beforehand.', 'She needed surgical treatment after the accident.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B04'), 'magnetic', 'adjective', ARRAY['attractive', 'magnetized', 'exerting a magnetic force', 'drawing things toward it']::text[], 'The phone holder uses a magnetic attachment.', 'He has a magnetic personality that makes people feel welcome.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B04'), 'radical', 'adjective', ARRAY['fundamental', 'drastic', 'far-reaching', 'revolutionary']::text[], 'The company needs a radical change in direction.', 'He proposed a radical redesign of the whole interface.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B04'), 'far-fetched', 'adjective', ARRAY['implausible', 'unlikely', 'hard to believe', 'unrealistic']::text[], 'That explanation sounds a little far-fetched to me.', 'The plot is entertaining, even though it''s far-fetched.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B04'), 'articulate', 'verb', ARRAY['express clearly', 'explain effectively', 'put into words', 'communicate well']::text[], 'It''s hard to articulate exactly why the design feels wrong.', 'She can articulate complex ideas without using jargon.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B04'), 'machinery', 'noun', ARRAY['equipment', 'machines', 'mechanical apparatus', 'industrial gear']::text[], 'The farm invested in new machinery last year.', 'We had to stop production when the machinery broke down.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B04'), 'gravity', 'noun', ARRAY['seriousness', 'severity', 'importance', 'weight']::text[], 'She did not understand the gravity of the situation until later.', 'The gravity of the decision became clear after the first meeting.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B05'), 'variable', 'adjective', ARRAY['changeable', 'fluctuating', 'inconsistent', 'subject to variation']::text[], 'The delivery time is variable during peak season.', 'The price depends on several variable costs.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B05'), 'warrant', 'noun', ARRAY['legal order', 'official authorization', 'court-issued permit', 'written legal authority']::text[], 'Police obtained a warrant before searching the house.', 'The judge signed a warrant earlier this morning.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B05'), 'facilitate', 'verb', ARRAY['make easier', 'enable', 'assist', 'smooth the way for']::text[], 'The new dashboard should facilitate better decisions.', 'A good moderator can facilitate a difficult conversation.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B05'), 'meditation', 'noun', ARRAY['mindfulness practice', 'contemplation', 'focused reflection', 'mental stillness practice']::text[], 'I do ten minutes of meditation before work.', 'Meditation helps her unwind after a busy day.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B05'), 'utility', 'noun', ARRAY['usefulness', 'practical value', 'usefulness of a tool', 'functional benefit']::text[], 'The app''s utility becomes clear when you''re traveling.', 'The city raised utility charges for water and electricity.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B05'), 'presidential', 'adjective', ARRAY['relating to the president', 'executive', 'of the presidency', 'connected to presidential office']::text[], 'The presidential election will take place next year.', 'She attended a presidential ceremony during her visit.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B05'), 'fixture', 'noun', ARRAY['permanent fitting', 'installed item', 'fixed feature', 'regular event']::text[], 'The broken bathroom fixture needs replacing.', 'That café has become a fixture of the neighborhood.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B05'), 'commentator', 'noun', ARRAY['analyst', 'observer', 'reporter offering analysis', 'opinion writer']::text[], 'A sports commentator described the final minutes of the match.', 'One commentator called the decision a major mistake.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B05'), 'meticulous', 'adjective', ARRAY['careful', 'thorough', 'precise', 'painstaking']::text[], 'She keeps meticulous records of every expense.', 'The technician was meticulous when checking the wiring.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B05'), 'glorious', 'adjective', ARRAY['magnificent', 'wonderful', 'splendid', 'brilliant']::text[], 'We had a glorious morning at the beach.', 'It felt glorious to finally finish the marathon.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B06'), 'endeavour', 'noun', ARRAY['effort', 'undertaking', 'attempt', 'enterprise']::text[], 'Starting a business is a challenging endeavour.', 'I wish you success in your next endeavour.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B06'), 'caveat', 'noun', ARRAY['warning', 'qualification', 'reservation', 'condition']::text[], 'The plan looks good, with one caveat: we need more time.', 'I''d recommend the product, but there''s a caveat about battery life.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B06'), 'presumably', 'adverb', ARRAY['probably', 'apparently', 'as one might assume', 'most likely']::text[], 'Presumably, everyone has received the updated agenda.', 'The shop is closed today, presumably because of the holiday.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B06'), 'diplomatic', 'adjective', ARRAY['tactful', 'discreet', 'sensitive', 'careful with words']::text[], 'She gave a diplomatic answer instead of choosing sides.', 'We need a more diplomatic way to explain the delay.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B06'), 'congressional', 'adjective', ARRAY['legislative', 'related to Congress', 'of the national legislature', 'involving Congress']::text[], 'The report is part of a congressional investigation.', 'She watched the congressional hearing online.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B06'), 'preliminary', 'adjective', ARRAY['initial', 'early', 'provisional', 'introductory']::text[], 'The preliminary results look promising.', 'We scheduled a preliminary call before the formal interview.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B06'), 'vindicated', 'adjective', ARRAY['proven right', 'justified', 'cleared of blame', 'exonerated']::text[], 'She felt vindicated when the test confirmed her concerns.', 'The investigation left him feeling vindicated after months of criticism.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B06'), 'incur', 'verb', ARRAY['become liable for', 'bring upon oneself', 'run up', 'suffer as a result']::text[], 'You may incur extra charges if you cancel late.', 'We don''t want to incur unnecessary debt.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B06'), 'correspondent', 'noun', ARRAY['reporter', 'journalist', 'news writer', 'foreign reporter']::text[], 'A correspondent reported live from the scene.', 'She worked as a foreign correspondent for many years.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B06'), 'mathematical', 'adjective', ARRAY['numeric', 'quantitative', 'relating to mathematics', 'involving calculations']::text[], 'There''s a mathematical explanation for the pattern.', 'The course assumes a strong mathematical background.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B07'), 'liable', 'adjective', ARRAY['legally responsible', 'answerable', 'accountable', 'subject to a penalty']::text[], 'The company may be liable for the damage.', 'You''re liable to pay a fee if you return the car late.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B07'), 'alignment', 'noun', ARRAY['agreement', 'coordination', 'consistency', 'proper positioning']::text[], 'We need better alignment between the product and support teams.', 'The mechanic checked the wheel alignment after the repair.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B07'), 'accordance', 'noun', ARRAY['compliance', 'conformity', 'agreement', 'consistency']::text[], 'The work must be done in accordance with local regulations.', 'We updated the policy in accordance with legal advice.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B07'), 'civic', 'adjective', ARRAY['public', 'community-related', 'municipal', 'concerning citizens']::text[], 'She volunteers for a local civic organization.', 'The program encourages civic participation among young people.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B07'), 'essence', 'noun', ARRAY['core', 'fundamental nature', 'central idea', 'substance']::text[], 'The essence of the proposal is to make learning easier.', 'In essence, we need more time to test the feature.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B07'), 'dominance', 'noun', ARRAY['control', 'supremacy', 'leading position', 'superiority']::text[], 'The company has maintained dominance in that market.', 'Their dominance in the second half made the result predictable.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B07'), 'domain', 'noun', ARRAY['field', 'area', 'sphere', 'realm']::text[], 'Data protection is outside my domain of expertise.', 'The company registered a new domain for its website.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B07'), 'administrative', 'adjective', ARRAY['organizational', 'clerical', 'procedural', 'office-related']::text[], 'I spend too much time on administrative tasks.', 'The new role includes administrative responsibilities.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B07'), 'gross', 'adjective', ARRAY['total', 'overall', 'before deductions', 'entire']::text[], 'My gross salary is higher than my take-home pay.', 'The company reported strong gross revenue this quarter.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B07'), 'enact', 'verb', ARRAY['pass into law', 'establish', 'introduce formally', 'put into effect']::text[], 'The government plans to enact new safety rules.', 'The organization will enact the changes at the start of next year.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B08'), 'corruption', 'noun', ARRAY['dishonesty', 'bribery', 'abuse of power', 'unethical conduct']::text[], 'The investigation uncovered corruption in the department.', 'Public trust fell after the corruption scandal.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B08'), 'confession', 'noun', ARRAY['admission', 'acknowledgment', 'disclosure of wrongdoing', 'avowal']::text[], 'He made a confession after the evidence was presented.', 'I have a confession: I forgot to book the tickets.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B08'), 'entity', 'noun', ARRAY['organization', 'legal body', 'separate unit', 'distinct thing']::text[], 'The company operates as an independent legal entity.', 'Each business entity has its own account.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B08'), 'petition', 'noun', ARRAY['formal request', 'written appeal', 'collective request', 'signed demand']::text[], 'Residents started a petition for safer crossings.', 'Thousands signed the online petition in one week.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B08'), 'abolish', 'verb', ARRAY['eliminate', 'end', 'repeal', 'do away with']::text[], 'The government promised to abolish the outdated fee.', 'The club voted to abolish the old membership rule.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B08'), 'stimulus', 'noun', ARRAY['incentive', 'trigger', 'boost', 'motivating factor']::text[], 'The government announced a stimulus package for small businesses.', 'A little competition can be a useful stimulus for innovation.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B08'), 'designate', 'verb', ARRAY['appoint', 'assign', 'name', 'officially select']::text[], 'We should designate one person to handle customer feedback.', 'The city will designate more space for bicycles.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B08'), 'ritual', 'noun', ARRAY['routine', 'ceremony', 'customary practice', 'repeated tradition']::text[], 'Making tea is part of my morning ritual.', 'The team has a small ritual before every presentation.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B08'), 'marginal', 'adjective', ARRAY['slight', 'minor', 'small', 'not significant']::text[], 'The update brought only a marginal improvement in speed.', 'We saw a marginal increase in costs last month.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B08'), 'induce', 'verb', ARRAY['cause', 'bring about', 'trigger', 'stimulate']::text[], 'The medication may induce drowsiness.', 'The offer was designed to induce customers to sign up.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B09'), 'equality', 'noun', ARRAY['equal rights', 'fairness', 'equal treatment', 'parity']::text[], 'The company published a report on pay equality.', 'Everyone deserves equality of opportunity.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B09'), 'evoke', 'verb', ARRAY['bring to mind', 'call up', 'stir', 'trigger feelings of']::text[], 'That song can evoke memories of childhood.', 'The design is meant to evoke a sense of calm.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B09'), 'contend', 'verb', ARRAY['argue', 'maintain', 'claim', 'assert']::text[], 'Some experts contend that the policy will have little effect.', 'I wouldn''t contend that this solution is perfect.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B09'), 'acquisition', 'noun', ARRAY['purchase', 'takeover', 'obtaining', 'act of acquiring']::text[], 'The company announced the acquisition of a smaller competitor.', 'Language acquisition is easier with regular practice.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B09'), 'assert', 'verb', ARRAY['state firmly', 'declare', 'insist', 'maintain']::text[], 'She needed to assert her boundaries with colleagues.', 'The new report will assert that the process is safer.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B09'), 'literacy', 'noun', ARRAY['ability to read and write', 'reading proficiency', 'written-language competence', 'basic reading skills']::text[], 'The charity runs adult literacy programs.', 'Digital literacy is increasingly important at work.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B09'), 'expenditure', 'noun', ARRAY['spending', 'outlay', 'expense', 'money spent']::text[], 'Travel expenditure was higher than expected this year.', 'We need to monitor expenditure more closely.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B09'), 'imminent', 'adjective', ARRAY['about to happen', 'approaching', 'impending', 'close at hand']::text[], 'The launch is imminent, so we''re finishing the last checks.', 'Dark clouds suggested that heavy rain was imminent.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B09'), 'intensity', 'noun', ARRAY['strength', 'severity', 'force', 'concentration']::text[], 'The intensity of the workout surprised me.', 'She spoke with an intensity that held everyone''s attention.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B09'), 'circulation', 'noun', ARRAY['distribution', 'movement', 'flow', 'availability to the public']::text[], 'The newspaper has a large circulation.', 'Good circulation helps keep the room comfortable.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B10'), 'patent', 'noun', ARRAY['exclusive invention right', 'intellectual-property protection', 'invention patent', 'legal monopoly on an invention']::text[], 'The company applied for a patent on its new device.', 'The patent prevents competitors from copying the invention for a period.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B10'), 'tenure', 'noun', ARRAY['period in office', 'time in a position', 'length of service', 'secure academic appointment']::text[], 'During her tenure as director, the team doubled in size.', 'He received tenure after years of university teaching.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B10'), 'forth', 'adverb', ARRAY['forward', 'onward', 'out', 'ahead']::text[], 'From this day forth, we''ll use the new process.', 'He stepped forth to answer the question.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B10'), 'contemplate', 'verb', ARRAY['consider', 'ponder', 'think about', 'reflect on']::text[], 'I''m starting to contemplate changing careers.', 'She took a moment to contemplate the offer.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B10'), 'allocation', 'noun', ARRAY['distribution', 'assignment', 'share', 'designated amount']::text[], 'The budget allocation for training has increased.', 'We need a fair allocation of shifts across the team.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B10'), 'adhere', 'verb', ARRAY['stick to', 'follow closely', 'comply with', 'remain faithful to']::text[], 'Please adhere to the agreed timeline.', 'The label won''t adhere to the wet surface.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B10'), 'operational', 'adjective', ARRAY['functional', 'working', 'in service', 'ready for use']::text[], 'The new website is fully operational.', 'We still have a few operational issues to solve.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B10'), 'ambivalent', 'adjective', ARRAY['uncertain', 'torn', 'conflicted', 'having mixed feelings']::text[], 'I''m ambivalent about moving abroad; I''m excited but worried.', 'She felt ambivalent when the company offered her a promotion.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B10'), 'contractor', 'noun', ARRAY['independent worker', 'outside supplier', 'contracted professional', 'service provider']::text[], 'We hired a contractor to renovate the kitchen.', 'The contractor will finish the installation on Friday.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B10'), 'reasoning', 'noun', ARRAY['logic', 'rationale', 'thought process', 'line of argument']::text[], 'Can you explain the reasoning behind that choice?', 'Her reasoning was easy to follow, even though I disagreed.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B11'), 'nominee', 'noun', ARRAY['candidate', 'person nominated', 'contender', 'proposed appointee']::text[], 'She was announced as a nominee for the annual award.', 'Each nominee will give a short speech at the ceremony.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B11'), 'protocol', 'noun', ARRAY['procedure', 'set of rules', 'standard process', 'formal guidelines']::text[], 'Please follow the security protocol when handling personal data.', 'The clinic introduced a new protocol for appointments.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B11'), 'enforcement', 'noun', ARRAY['implementation of rules', 'ensuring compliance', 'application of the law', 'compelling obedience']::text[], 'Strict enforcement of the policy reduced the number of violations.', 'The city announced stronger parking enforcement near schools.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B11'), 'pragmatic', 'adjective', ARRAY['practical', 'realistic', 'sensible', 'results-oriented']::text[], 'We need a pragmatic solution that works with our current budget.', 'Her approach is pragmatic rather than idealistic.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B11'), 'prosecute', 'verb', ARRAY['bring charges against', 'take to court', 'pursue legal proceedings against', 'try in court']::text[], 'Authorities decided to prosecute the company for fraud.', 'The lawyer explained why it might be difficult to prosecute the case.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B11'), 'legislation', 'noun', ARRAY['law', 'statute', 'enacted law', 'body of laws']::text[], 'The new legislation affects how companies store customer data.', 'Parliament is considering legislation on online safety.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B11'), 'embody', 'verb', ARRAY['represent', 'personify', 'exemplify', 'give form to']::text[], 'The design should embody our brand''s values.', 'She seems to embody the qualities of a good leader.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B11'), 'judicial', 'adjective', ARRAY['legal', 'court-related', 'relating to judges', 'connected to the judiciary']::text[], 'The case is now under judicial review.', 'The report criticized delays in the judicial system.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B11'), 'clinical', 'adjective', ARRAY['medical', 'treatment-related', 'involving patient care', 'relating to a clinic']::text[], 'The drug is still undergoing clinical testing.', 'She has extensive clinical experience as a nurse.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B11'), 'incidence', 'noun', ARRAY['frequency', 'occurrence rate', 'rate of cases', 'prevalence of new cases']::text[], 'The study measured the incidence of the disease.', 'There''s a higher incidence of delays during the holiday season.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B12'), 'electoral', 'adjective', ARRAY['related to elections', 'voting-related', 'concerning the vote', 'of the electoral process']::text[], 'The country introduced electoral reforms last year.', 'Turnout is expected to be high in the electoral district.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B12'), 'regulator', 'noun', ARRAY['oversight body', 'supervisory authority', 'watchdog', 'rule-enforcing agency']::text[], 'The financial regulator opened an investigation.', 'The regulator wants clearer information for consumers.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B12'), 'formulate', 'verb', ARRAY['develop', 'devise', 'put together', 'express precisely']::text[], 'We need to formulate a clear response before the meeting.', 'She helped formulate the team''s new strategy.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B12'), 'franchise', 'noun', ARRAY['licensed business', 'chain outlet', 'business license arrangement', 'franchised operation']::text[], 'He opened a restaurant franchise near the station.', 'The company is expanding through a franchise model.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B12'), 'unprecedented', 'adjective', ARRAY['never seen before', 'exceptional', 'unparalleled', 'without prior example']::text[], 'The website experienced unprecedented traffic during the sale.', 'We faced an unprecedented challenge during the storm.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B12'), 'charter', 'noun', ARRAY['founding document', 'formal authorization', 'written constitution', 'statement of rights']::text[], 'The organization updated its charter to include new goals.', 'The company''s charter sets out how the board operates.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B12'), 'merchant', 'noun', ARRAY['trader', 'seller', 'vendor', 'dealer']::text[], 'The merchant offered a refund without hesitation.', 'Another merchant nearby sells the same item for less.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B12'), 'critique', 'noun', ARRAY['evaluation', 'analysis', 'review', 'assessment']::text[], 'I appreciated her detailed critique of my presentation.', 'The article offers a thoughtful critique of the policy.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B12'), 'diagnosis', 'noun', ARRAY['identification of a condition', 'medical finding', 'determination of a problem', 'clinical assessment']::text[], 'The doctor explained the diagnosis carefully.', 'Getting an accurate diagnosis took several appointments.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B12'), 'insufficient', 'adjective', ARRAY['inadequate', 'not enough', 'lacking', 'too limited']::text[], 'We have insufficient evidence to make that claim.', 'The storage space is insufficient for our files.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B13'), 'aftermath', 'noun', ARRAY['consequences', 'effects', 'fallout', 'period following an event']::text[], 'The community came together in the aftermath of the storm.', 'We spent weeks dealing with the aftermath of the data breach.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B13'), 'conscience', 'noun', ARRAY['moral sense', 'inner guide', 'sense of right and wrong', 'moral awareness']::text[], 'My conscience wouldn''t let me ignore the mistake.', 'She made the decision with a clear conscience.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B13'), 'deputy', 'noun', ARRAY['assistant', 'second-in-command', 'substitute official', 'delegated representative']::text[], 'The deputy manager handled the issue while the manager was away.', 'She was appointed deputy director last month.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B13'), 'prospective', 'adjective', ARRAY['potential', 'possible', 'expected', 'would-be']::text[], 'We invited prospective customers to try the product.', 'The university arranged a tour for prospective students.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B13'), 'denounce', 'verb', ARRAY['condemn', 'criticize publicly', 'speak out against', 'reject strongly']::text[], 'The organization issued a statement to denounce the attack.', 'Several employees plan to denounce the unfair policy.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B13'), 'provincial', 'adjective', ARRAY['regional', 'relating to a province', 'outside the capital', 'local rather than national']::text[], 'The provincial government announced a new transport plan.', 'She grew up in a small provincial town.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B13'), 'municipal', 'adjective', ARRAY['city', 'local-government', 'civic', 'relating to a municipality']::text[], 'The municipal office is closed on public holidays.', 'We applied for a municipal permit to hold the event.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B13'), 'discretion', 'noun', ARRAY['judgment', 'freedom to decide', 'tact', 'careful choice']::text[], 'Managers have discretion to approve small refunds.', 'Please use discretion when discussing sensitive information.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B13'), 'custody', 'noun', ARRAY['legal care', 'guardianship', 'detention', 'keeping in charge']::text[], 'The parents agreed to share custody of their child.', 'The suspect remained in police custody overnight.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B13'), 'regulatory', 'adjective', ARRAY['rule-related', 'compliance-related', 'supervisory', 'concerning regulations']::text[], 'The company faces new regulatory requirements.', 'We need regulatory approval before launching the service.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B14'), 'adolescent', 'noun', ARRAY['teenager', 'young person', 'youth', 'person in their teens']::text[], 'The program offers support for every adolescent who needs it.', 'She''s researching how social media affects adolescent behavior.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B14'), 'secular', 'adjective', ARRAY['nonreligious', 'worldly', 'not connected to religion', 'lay']::text[], 'The school offers a secular education.', 'The museum is a secular institution open to everyone.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B14'), 'confine', 'verb', ARRAY['restrict', 'limit', 'keep within bounds', 'shut in']::text[], 'Let''s confine our discussion to the main issue.', 'The doctor advised him to confine his activities to gentle walks.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B14'), 'inherent', 'adjective', ARRAY['built-in', 'intrinsic', 'essential', 'naturally part of']::text[], 'There''s an inherent risk in any new business.', 'The approach has some inherent limitations.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B14'), 'amendment', 'noun', ARRAY['revision', 'modification', 'change', 'formal correction']::text[], 'We proposed an amendment to the contract.', 'The committee voted on the amendment yesterday.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B14'), 'migration', 'noun', ARRAY['movement', 'relocation', 'transfer', 'large-scale moving']::text[], 'The data migration took longer than expected.', 'The documentary follows seasonal bird migration.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B14'), 'accountability', 'noun', ARRAY['responsibility', 'answerability', 'obligation to explain', 'being held to account']::text[], 'Clear ownership improves accountability across teams.', 'The public demanded greater accountability after the error.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B14'), 'prevalence', 'noun', ARRAY['frequency', 'commonness', 'widespread occurrence', 'proportion affected']::text[], 'The study examines the prevalence of sleep problems.', 'We discussed the growing prevalence of remote work.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B14'), 'commodity', 'noun', ARRAY['raw material', 'tradeable good', 'basic product', 'commercial resource']::text[], 'Coffee is an important commodity in world trade.', 'This commodity has become more expensive in recent months.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B14'), 'indigenous', 'adjective', ARRAY['native', 'original to a region', 'local in origin', 'belonging to the first inhabitants']::text[], 'The festival celebrates indigenous art and music.', 'We learned about indigenous plants on the guided walk.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B15'), 'mandate', 'noun', ARRAY['official authorization', 'order', 'instruction', 'authority']::text[], 'The committee received a mandate to review the policy.', 'The new law gives the regulator a broader mandate.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B15'), 'instrumental', 'adjective', ARRAY['essential', 'crucial', 'decisive', 'key to success']::text[], 'Her support was instrumental in getting the project approved.', 'Good documentation was instrumental in solving the issue.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B15'), 'nuanced', 'adjective', ARRAY['subtle', 'balanced', 'carefully differentiated', 'sensitive to distinctions']::text[], 'She gave a nuanced answer rather than choosing one side.', 'The article offers a nuanced view of remote work.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B15'), 'justification', 'noun', ARRAY['reason', 'explanation', 'grounds', 'rationale']::text[], 'We need a clear justification for increasing the price.', 'He offered no justification for missing the deadline.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B15'), 'morality', 'noun', ARRAY['ethics', 'principles', 'sense of right and wrong', 'moral standards']::text[], 'The film raises difficult questions about morality.', 'People often disagree about the morality of that choice.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B15'), 'vulnerability', 'noun', ARRAY['weakness', 'exposure', 'susceptibility', 'security flaw']::text[], 'The audit found a vulnerability in the login system.', 'Admitting vulnerability can help build trust.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B15'), 'deem', 'verb', ARRAY['consider', 'regard as', 'judge', 'think of as']::text[], 'The company may deem the account inactive after a year.', 'We may deem the proposal too expensive after reviewing the costs.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B15'), 'credibility', 'noun', ARRAY['trustworthiness', 'believability', 'reliability', 'good standing']::text[], 'The mistake damaged the report''s credibility.', 'Clear evidence gives the argument more credibility.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B15'), 'consecutive', 'adjective', ARRAY['successive', 'sequential', 'uninterrupted', 'back-to-back']::text[], 'She worked twelve consecutive days without a break.', 'The team won three consecutive games.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B15'), 'ecological', 'adjective', ARRAY['environmental', 'relating to ecosystems', 'nature-related', 'concerning living environments']::text[], 'The company wants to reduce its ecological impact.', 'The park has important ecological value.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B16'), 'extremist', 'noun', ARRAY['radical', 'fanatic', 'hardliner', 'person holding extreme views']::text[], 'The article discusses how extremist groups recruit online.', 'He rejected the extremist ideas shared in the forum.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B16'), 'conception', 'noun', ARRAY['idea', 'understanding', 'notion', 'view']::text[], 'My conception of success has changed over the years.', 'The designer was involved from the project''s conception.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B16'), 'propaganda', 'noun', ARRAY['biased messaging', 'political persuasion campaign', 'manipulative publicity', 'one-sided information']::text[], 'The documentary examines wartime propaganda.', 'It''s important to distinguish reporting from propaganda.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B16'), 'architectural', 'adjective', ARRAY['related to building design', 'structural in design', 'involving architecture', 'relating to an architect']::text[], 'We discussed the building''s architectural features.', 'The app needs a few architectural changes before scaling.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B16'), 'evolutionary', 'adjective', ARRAY['gradual', 'developing over time', 'related to evolution', 'step-by-step change']::text[], 'The update is evolutionary rather than revolutionary.', 'The lecture explained the species'' evolutionary history.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B16'), 'institutional', 'adjective', ARRAY['organizational', 'system-wide', 'relating to an institution', 'embedded in an organization']::text[], 'The policy requires institutional support to succeed.', 'She studied institutional barriers to education.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B16'), 'correlate', 'verb', ARRAY['be associated', 'correspond', 'show a relationship', 'vary together']::text[], 'High stress levels often correlate with poor sleep.', 'We can''t assume that two numbers correlate for the same reason.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B16'), 'subsidy', 'noun', ARRAY['financial support', 'government grant', 'public assistance', 'funding contribution']::text[], 'The farm received a subsidy to buy new equipment.', 'A transport subsidy helps some employees with commuting costs.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B16'), 'philosophical', 'adjective', ARRAY['conceptual', 'reflective', 'theoretical', 'concerned with fundamental ideas']::text[], 'We had a philosophical discussion about what happiness means.', 'His response was philosophical rather than practical.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B16'), 'prosecution', 'noun', ARRAY['legal proceedings', 'criminal case', 'bringing charges', 'legal action by the state']::text[], 'The prosecution presented its evidence first.', 'The witness agreed to cooperate with the prosecution.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B17'), 'prosecutor', 'noun', ARRAY['state attorney', 'government lawyer', 'public attorney', 'lawyer bringing charges']::text[], 'The prosecutor questioned the witness in court.', 'The prosecutor said there wasn''t enough evidence to proceed.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B17'), 'manuscript', 'noun', ARRAY['draft', 'handwritten document', 'original text', 'unpublished work']::text[], 'She sent the manuscript to a publisher last month.', 'The museum displayed an old manuscript behind glass.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B17'), 'bureaucracy', 'noun', ARRAY['red tape', 'administrative system', 'official procedures', 'layers of administration']::text[], 'Too much bureaucracy slows down simple decisions.', 'We spent weeks navigating the bureaucracy to get a permit.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B17'), 'contempt', 'noun', ARRAY['disdain', 'scorn', 'disrespect', 'utter disregard']::text[], 'He spoke with contempt about people who disagreed with him.', 'Her contempt for the rules made teamwork difficult.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B17'), 'faction', 'noun', ARRAY['group', 'wing', 'clique', 'internal bloc']::text[], 'A small faction opposed the proposed changes.', 'Another faction wants to postpone the vote.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B17'), 'ideological', 'adjective', ARRAY['belief-based', 'doctrine-driven', 'political in outlook', 'shaped by ideas']::text[], 'Their disagreement was ideological rather than personal.', 'The organization tries to avoid ideological arguments at work.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B17'), 'albeit', 'conjunction', ARRAY['although', 'though', 'even though', 'even if']::text[], 'The food was excellent, albeit a little expensive.', 'We finished the project, albeit two days late.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B17'), 'humanitarian', 'adjective', ARRAY['compassionate', 'focused on human welfare', 'relief-related', 'charitable']::text[], 'The charity launched a humanitarian appeal after the flood.', 'Several organizations provided humanitarian aid.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B17'), 'concede', 'verb', ARRAY['admit', 'acknowledge', 'grant a point', 'accept reluctantly']::text[], 'I have to concede that your idea is better.', 'Even critics concede that the update improved performance.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B17'), 'doctrine', 'noun', ARRAY['principle', 'teaching', 'belief system', 'set of beliefs']::text[], 'The lecture explained the doctrine behind the policy.', 'The organization follows a doctrine of nonviolence.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B18'), 'correlation', 'noun', ARRAY['association', 'relationship', 'connection', 'statistical link']::text[], 'The study found a correlation between sleep and concentration.', 'A correlation doesn''t necessarily prove that one thing causes another.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B18'), 'discourse', 'noun', ARRAY['discussion', 'debate', 'exchange of ideas', 'conversation']::text[], 'The article influenced public discourse about technology.', 'We need a more respectful discourse online.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B18'), 'allegation', 'noun', ARRAY['accusation', 'claim', 'charge', 'unproven assertion']::text[], 'The company denied the allegation immediately.', 'The investigation began after a serious allegation was made.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B18'), 'ensue', 'verb', ARRAY['follow', 'happen afterward', 'result', 'come next']::text[], 'An argument may ensue if nobody explains the change.', 'Confusion may ensue if the instructions are not clear.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B18'), 'exert', 'verb', ARRAY['apply', 'use', 'bring to bear', 'exercise influence']::text[], 'Don''t exert too much pressure when tightening the screws.', 'The company tried to exert influence over the decision.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B18'), 'premise', 'noun', ARRAY['assumption', 'starting point', 'underlying idea', 'proposition']::text[], 'The proposal is based on the premise that demand will grow.', 'I disagree with the basic premise of the argument.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B18'), 'interim', 'adjective', ARRAY['temporary', 'provisional', 'short-term', 'transitional']::text[], 'She''ll act as interim manager until someone is hired.', 'We introduced an interim solution while building the new system.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B18'), 'predecessor', 'noun', ARRAY['previous holder', 'forerunner', 'earlier version', 'former officeholder']::text[], 'Her predecessor left detailed notes for the new manager.', 'The latest phone is faster than its predecessor.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B18'), 'whereby', 'adverb', ARRAY['by which', 'through which', 'in which', 'by means of which']::text[], 'We need a system whereby users can report errors easily.', 'They agreed on a process whereby both teams approve changes.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B18'), 'constitutional', 'adjective', ARRAY['related to the constitution', 'established by the constitution', 'lawful under the constitution', 'concerning fundamental law']::text[], 'The court considered whether the law was constitutional.', 'The decision raised constitutional questions.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B19'), 'forthcoming', 'adjective', ARRAY['upcoming', 'approaching', 'expected soon', 'about to be released']::text[], 'The forthcoming update should fix the problem.', 'She mentioned her forthcoming book during the interview.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B19'), 'encompass', 'verb', ARRAY['include', 'cover', 'embrace', 'take in']::text[], 'The course will encompass reading, listening, and speaking.', 'Our responsibilities encompass both design and testing.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B19'), 'inhibit', 'verb', ARRAY['restrain', 'hinder', 'suppress', 'prevent']::text[], 'Fear of criticism can inhibit creativity.', 'The medication may inhibit the body''s response to the infection.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B19'), 'faculty', 'noun', ARRAY['teaching staff', 'academic department', 'university educators', 'academic personnel']::text[], 'She joined the university faculty last year.', 'The faculty met to review the new curriculum.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B19'), 'apparatus', 'noun', ARRAY['equipment', 'machinery', 'device', 'set of tools']::text[], 'The technician checked the apparatus before starting the test.', 'The laboratory purchased new apparatus for its experiments.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B19'), 'whatsoever', 'adverb', ARRAY['at all', 'of any kind', 'in any way', 'whatever']::text[], 'There''s no evidence whatsoever that the file was altered.', 'I have no objection whatsoever to moving the meeting.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B19'), 'precedent', 'noun', ARRAY['earlier example', 'previous case', 'prior decision', 'established practice']::text[], 'The decision could set a precedent for future cases.', 'We looked for a precedent before introducing the policy.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B19'), 'empirical', 'adjective', ARRAY['based on observation', 'evidence-based', 'experimental', 'data-driven']::text[], 'We need empirical evidence, not just opinions.', 'The research uses empirical data collected over several years.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B19'), 'methodology', 'noun', ARRAY['method', 'approach', 'systematic procedure', 'research framework']::text[], 'The report explains the methodology used in the survey.', 'We should agree on a methodology before comparing results.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B19'), 'scrutiny', 'noun', ARRAY['close examination', 'careful inspection', 'detailed review', 'critical attention']::text[], 'The proposal came under intense scrutiny from the board.', 'The product''s privacy practices deserve greater scrutiny.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B20'), 'concession', 'noun', ARRAY['compromise', 'allowance', 'something yielded', 'special discount']::text[], 'The landlord offered a rent concession during the repairs.', 'Neither side was willing to make a concession in the negotiations.', 1)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B20'), 'rhetoric', 'noun', ARRAY['persuasive language', 'public argument', 'oratory', 'style of speaking']::text[], 'His speech was full of rhetoric but offered few details.', 'We need practical action, not more political rhetoric.', 2)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B20'), 'allegedly', 'adverb', ARRAY['reportedly', 'supposedly', 'according to claims', 'purportedly']::text[], 'The company allegedly shared data without permission.', 'The document was allegedly signed last year.', 3)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B20'), 'arbitrary', 'adjective', ARRAY['random', 'capricious', 'based on personal choice', 'without clear reasoning']::text[], 'The deadline feels arbitrary because nobody explained it.', 'We shouldn''t make arbitrary changes to the process.', 4)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B20'), 'theoretical', 'adjective', ARRAY['conceptual', 'abstract', 'hypothetical', 'not yet practical']::text[], 'The approach sounds good in theoretical terms.', 'We need to test the theoretical model with real data.', 5)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B20'), 'synthesis', 'noun', ARRAY['combination', 'integration', 'bringing together', 'coherent summary']::text[], 'The report is a synthesis of several studies.', 'Her presentation offered a useful synthesis of the main ideas.', 6)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B20'), 'invoke', 'verb', ARRAY['cite', 'appeal to', 'call upon', 'refer to']::text[], 'The lawyer may invoke that clause during negotiations.', 'The poem seems to invoke memories of childhood.', 7)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B20'), 'ideology', 'noun', ARRAY['belief system', 'worldview', 'doctrine', 'set of principles']::text[], 'The party''s ideology has changed over time.', 'They disagree on ideology but share the same practical goal.', 8)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B20'), 'constitute', 'verb', ARRAY['make up', 'form', 'amount to', 'represent']::text[], 'Five members constitute the core team.', 'Sharing personal data without consent could constitute a breach.', 9)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;
INSERT INTO public.words (block_id, word, part_of_speech, synonyms, application_1, application_2, order_index)
VALUES ((SELECT id FROM public.blocks WHERE code = 'VOC-C1-MAS-01-B20'), 'confer', 'verb', ARRAY['grant', 'bestow', 'award', 'give formally']::text[], 'The award will confer international recognition on the winner.', 'The new certification may confer additional professional benefits.', 10)
ON CONFLICT ((LOWER(BTRIM(word)))) DO UPDATE 
SET block_id = EXCLUDED.block_id, part_of_speech = EXCLUDED.part_of_speech, synonyms = EXCLUDED.synonyms, application_1 = EXCLUDED.application_1, application_2 = EXCLUDED.application_2, order_index = EXCLUDED.order_index;

-- 5. EXERCISES (Block 01 - 35 Exercises)
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'loyalty'),
    'synonym_matching',
    'Which target word best matches “devotion, faithfulness, allegiance”?',
    '["defect", "sentiment", "tactic", "loyalty"]'::jsonb,
    'loyalty',
    'Loyalty means devotion or faithfulness to a person, group, or cause.',
    1
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'reluctant'),
    'sentence_completion',
    'I''m ______ to sign the agreement until someone explains the cancellation fees.',
    '["transparent", "viable", "superb", "reluctant"]'::jsonb,
    'reluctant',
    'Reluctant describes someone who is unwilling or hesitant to do something.',
    2
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'viable'),
    'sentence_completion',
    'We have a promising idea, but we need to check whether it''s financially ______.',
    '["superb", "reluctant", "transparent", "viable"]'::jsonb,
    'viable',
    'A viable idea is practical enough to work or succeed.',
    3
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'fade'),
    'sentence_completion',
    'The smell of fresh paint should ______ once we leave the windows open for a while.',
    '["fade", "return", "expand", "enrich"]'::jsonb,
    'fade',
    'A smell fades when it becomes weaker over time.',
    4
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'transparent'),
    'sentence_completion',
    'The manager was ______ about the mistakes the team had made during the launch.',
    '["superb", "reluctant", "viable", "transparent"]'::jsonb,
    'transparent',
    'Being transparent means being open and honest about what happened.',
    5
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'tactic'),
    'synonym_matching',
    'Which target word best matches “strategy, approach, method”?',
    '["loyalty", "tactic", "sentiment", "defect"]'::jsonb,
    'tactic',
    'A tactic is a deliberate method used to reach a specific goal.',
    6
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'sentiment'),
    'sentence_completion',
    'The general ______ in our group chat was that we should move the trip to next month.',
    '["tactic", "loyalty", "sentiment", "defect"]'::jsonb,
    'sentiment',
    'Sentiment refers to the shared feeling or opinion about something.',
    7
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'enrich'),
    'sentence_completion',
    'Adding a few real-life examples will ______ the workshop and make it more useful.',
    '["fade", "restrict", "enrich", "erase"]'::jsonb,
    'enrich',
    'To enrich something is to improve it by adding value or depth.',
    8
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'defect'),
    'sentence_completion',
    'I returned the headphones because of a manufacturing ______ in the left speaker.',
    '["tactic", "defect", "sentiment", "loyalty"]'::jsonb,
    'defect',
    'A defect is a fault in a product that stops it from working as intended.',
    9
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'superb'),
    'sentence_completion',
    'The hotel staff were ______; they even helped us find an open pharmacy after midnight.',
    '["superb", "transparent", "reluctant", "viable"]'::jsonb,
    'superb',
    'Superb describes something or someone that is exceptionally good.',
    10
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'superb'),
    'synonym_matching',
    'Which target word best matches “excellent, outstanding, exceptional”?',
    '["superb", "reluctant", "transparent", "viable"]'::jsonb,
    'superb',
    'Superb means extremely good in quality.',
    11
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'defect'),
    'sentence_completion',
    'The mechanic found a small ______ in the cooling system that was causing the engine to overheat.',
    '["tactic", "defect", "loyalty", "sentiment"]'::jsonb,
    'defect',
    'A defect is a flaw or fault in a system or its components.',
    12
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'enrich'),
    'sentence_completion',
    'Talking with people who have different experiences can ______ your understanding of the world.',
    '["limit", "enrich", "fade", "erase"]'::jsonb,
    'enrich',
    'Enrich means to broaden or deepen knowledge and understanding.',
    13
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'sentiment'),
    'synonym_matching',
    'Which target word best matches “feeling, attitude, opinion”?',
    '["sentiment", "loyalty", "tactic", "defect"]'::jsonb,
    'sentiment',
    'Sentiment is a feeling or opinion about a person, topic, or situation.',
    14
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'tactic'),
    'sentence_completion',
    'Sending a reminder the day before an appointment is a simple ______ for reducing no-shows.',
    '["tactic", "sentiment", "defect", "loyalty"]'::jsonb,
    'tactic',
    'A tactic is a specific action used to achieve a goal.',
    15
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'transparent'),
    'sentence_completion',
    'I wish the pricing were more ______; I can''t tell which fees are included.',
    '["reluctant", "transparent", "viable", "superb"]'::jsonb,
    'transparent',
    'Transparent pricing makes costs and conditions easy to understand.',
    16
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'fade'),
    'synonym_matching',
    'Which target word best matches “diminish, weaken, disappear gradually”?',
    '["strengthen", "create", "fade", "enrich"]'::jsonb,
    'fade',
    'Fade means to gradually weaken, lose color, or become less noticeable.',
    17
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'viable'),
    'synonym_matching',
    'Which target word best matches “workable, feasible, practical”?',
    '["transparent", "reluctant", "superb", "viable"]'::jsonb,
    'viable',
    'Viable describes a plan or option that can realistically work.',
    18
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'reluctant'),
    'sentence_completion',
    'He seemed ______ to tell us what happened, even though we asked him directly.',
    '["transparent", "viable", "reluctant", "superb"]'::jsonb,
    'reluctant',
    'Someone who is reluctant to speak does not want to share the information.',
    19
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'loyalty'),
    'sentence_completion',
    'She turned down a higher offer out of ______ to the coworkers who had supported her from day one.',
    '["sentiment", "loyalty", "tactic", "defect"]'::jsonb,
    'loyalty',
    'Loyalty means staying committed to and supportive of people or a group.',
    20
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'fade'),
    'sentence_completion',
    'The embarrassment from that awkward conversation will probably ______ with time.',
    '["grow", "return", "enrich", "fade"]'::jsonb,
    'fade',
    'An emotion can fade when it gradually loses intensity.',
    21
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'tactic'),
    'sentence_completion',
    'Instead of arguing, she tried a different ______: asking the client what worried them most.',
    '["tactic", "sentiment", "defect", "loyalty"]'::jsonb,
    'tactic',
    'A tactic is a practical method used in a particular situation.',
    22
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'loyalty'),
    'sentence_completion',
    'The café offers a small reward to regulars because it wants to build customer ______.',
    '["loyalty", "defect", "sentiment", "tactic"]'::jsonb,
    'loyalty',
    'Customer loyalty is a continuing preference for a business over its competitors.',
    23
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'reluctant'),
    'synonym_matching',
    'Which target word best matches “hesitant, unwilling, resistant”?',
    '["viable", "superb", "reluctant", "transparent"]'::jsonb,
    'reluctant',
    'Reluctant means hesitant or unwilling to do something.',
    24
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'superb'),
    'sentence_completion',
    'That was a ______ explanation; I finally understand how the feature works.',
    '["viable", "superb", "transparent", "reluctant"]'::jsonb,
    'superb',
    'Superb means excellent or outstanding in quality.',
    25
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'sentiment'),
    'sentence_completion',
    'I understand the ______ behind your message, even if I disagree with your suggestion.',
    '["sentiment", "defect", "loyalty", "tactic"]'::jsonb,
    'sentiment',
    'Sentiment can mean the feeling or attitude expressed in a statement.',
    26
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'defect'),
    'synonym_matching',
    'Which target word best matches “flaw, fault, imperfection”?',
    '["loyalty", "sentiment", "defect", "tactic"]'::jsonb,
    'defect',
    'A defect is a flaw or fault in an object or system.',
    27
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'viable'),
    'sentence_completion',
    'Without reliable internet, working from that cabin isn''t a ______ option.',
    '["viable", "superb", "reluctant", "transparent"]'::jsonb,
    'viable',
    'A viable option is workable under the actual conditions.',
    28
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'enrich'),
    'synonym_matching',
    'Which target word best matches “improve, enhance, deepen”?',
    '["weaken", "fade", "remove", "enrich"]'::jsonb,
    'enrich',
    'Enrich means to improve or deepen something by adding value.',
    29
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'transparent'),
    'synonym_matching',
    'Which target word best matches “open, honest, straightforward”?',
    '["superb", "transparent", "reluctant", "viable"]'::jsonb,
    'transparent',
    'Transparent describes communication that is open and honest.',
    30
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'viable'),
    'sentence_completion',
    'Only one proposal is ______ within the time and budget we have.',
    '["transparent", "reluctant", "viable", "superb"]'::jsonb,
    'viable',
    'Viable means feasible with the available time and resources.',
    31
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'sentiment'),
    'sentence_completion',
    'Public ______ changed after the company explained why it had raised its prices.',
    '["loyalty", "defect", "sentiment", "tactic"]'::jsonb,
    'sentiment',
    'Public sentiment is the overall attitude or feeling among people.',
    32
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'fade'),
    'sentence_completion',
    'The print on this T-shirt will ______ if you wash it in very hot water.',
    '["improve", "fade", "multiply", "enrich"]'::jsonb,
    'fade',
    'Colors or prints fade when they become less bright or clear.',
    33
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'reluctant'),
    'sentence_completion',
    'The landlord was ______ to arrange repairs until several tenants complained.',
    '["superb", "transparent", "viable", "reluctant"]'::jsonb,
    'reluctant',
    'Reluctant means unwilling or resistant to taking an action.',
    34
);
INSERT INTO public.exercises (block_id, word_id, type, prompt, options, correct_answer, explanation, order_index)
VALUES (
    (SELECT id FROM public.blocks WHERE code = 'VOC-C1-FND-01-B01'),
    (SELECT id FROM public.words WHERE word = 'transparent'),
    'sentence_completion',
    'The company promised to be ______ with users about how their personal data is handled.',
    '["reluctant", "viable", "transparent", "superb"]'::jsonb,
    'transparent',
    'Transparent communication clearly discloses relevant information.',
    35
);

COMMIT;