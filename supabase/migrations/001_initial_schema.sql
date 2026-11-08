-- ==============================================================================
-- LEXI PRD v2.1 — Supabase Initial Schema Migration
-- Tables: levels, workbooks, blocks, words, exercises,
--         user_profiles, user_block_progress, user_exercise_attempts
-- ==============================================================================

-- 1. Enable UUID extension if not enabled
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ==============================================================================
-- 2. TABELA: levels (Camada 1: Nível de Proficiência)
-- ==============================================================================
CREATE TABLE IF NOT EXISTS public.levels (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code TEXT UNIQUE NOT NULL, -- ex: 'C1', 'C2'
    title TEXT NOT NULL,       -- ex: 'C1 — Advanced'
    description TEXT,
    order_index INT NOT NULL DEFAULT 1,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

-- ==============================================================================
-- 3. TABELA: workbooks (Camada 2: Apostilas / Volumes)
-- ==============================================================================
CREATE TABLE IF NOT EXISTS public.workbooks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    level_id UUID NOT NULL REFERENCES public.levels(id) ON DELETE CASCADE,
    code TEXT UNIQUE NOT NULL, -- ex: 'C1-FND-01', 'C1-MOM-01'
    title TEXT NOT NULL,       -- ex: 'C1 Foundations 1'
    difficulty_tier INT NOT NULL CHECK (difficulty_tier BETWEEN 1 AND 5),
    volume_number INT NOT NULL DEFAULT 1 CHECK (volume_number >= 1),
    total_blocks_planned INT NOT NULL DEFAULT 20,
    unlock_threshold_percent NUMERIC NOT NULL DEFAULT 70.0,
    prerequisite_workbook_id UUID REFERENCES public.workbooks(id) ON DELETE SET NULL,
    publication_status TEXT NOT NULL DEFAULT 'published' CHECK (publication_status IN ('draft', 'published', 'archived')),
    order_index INT NOT NULL DEFAULT 1,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    CONSTRAINT uq_workbooks_level_tier_volume UNIQUE (level_id, difficulty_tier, volume_number)
);

-- ==============================================================================
-- 4. TABELA: blocks (Camada 3: Blocos de 10 Palavras)
-- ==============================================================================
CREATE TABLE IF NOT EXISTS public.blocks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    workbook_id UUID NOT NULL REFERENCES public.workbooks(id) ON DELETE CASCADE,
    code TEXT UNIQUE NOT NULL, -- ex: 'VOC-C1-FND-01-B01'
    title TEXT NOT NULL,       -- ex: 'Block 01'
    order_index INT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    CONSTRAINT uq_blocks_workbook_order UNIQUE (workbook_id, order_index)
);

-- ==============================================================================
-- 5. TABELA: words (Vocabulário / Flashcards)
-- ==============================================================================
CREATE TABLE IF NOT EXISTS public.words (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    block_id UUID REFERENCES public.blocks(id) ON DELETE SET NULL,
    word TEXT NOT NULL,
    part_of_speech TEXT NOT NULL, -- 'noun', 'verb', 'adjective', 'adverb'
    synonyms TEXT[] NOT NULL DEFAULT '{}',
    application_1 TEXT NOT NULL,
    application_2 TEXT NOT NULL,
    order_index INT NOT NULL DEFAULT 1,
    target_sense_en TEXT,
    cefr_evidence TEXT,
    usage_priority INT,
    suggested_tier INT,
    editorial_status TEXT DEFAULT 'published',
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

-- Unicidade estrita e normalizada da palavra-alvo
CREATE UNIQUE INDEX IF NOT EXISTS words_word_unique_norm_idx ON public.words (LOWER(BTRIM(word)));

-- ==============================================================================
-- 6. TABELA: exercises (Bateria de Testes e Prática)
-- ==============================================================================
CREATE TABLE IF NOT EXISTS public.exercises (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    block_id UUID NOT NULL REFERENCES public.blocks(id) ON DELETE CASCADE,
    word_id UUID REFERENCES public.words(id) ON DELETE SET NULL,
    type TEXT NOT NULL CHECK (type IN ('sentence_completion', 'synonym_matching')),
    prompt TEXT NOT NULL,
    options JSONB NOT NULL DEFAULT '[]'::jsonb,
    correct_answer TEXT NOT NULL,
    explanation TEXT NOT NULL,
    order_index INT NOT NULL DEFAULT 1,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

CREATE INDEX IF NOT EXISTS idx_exercises_block_id ON public.exercises(block_id);
CREATE INDEX IF NOT EXISTS idx_exercises_word_id ON public.exercises(word_id);

-- ==============================================================================
-- 7. TABELA: user_profiles (Perfil do Estudante)
-- ==============================================================================
CREATE TABLE IF NOT EXISTS public.user_profiles (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    current_level_id UUID REFERENCES public.levels(id) ON DELETE SET NULL,
    streak_days INT NOT NULL DEFAULT 0,
    last_study_date DATE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

-- ==============================================================================
-- 8. TABELA: user_block_progress (Progresso e Status dos Blocos por Usuário)
-- ==============================================================================
CREATE TABLE IF NOT EXISTS public.user_block_progress (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    block_id UUID NOT NULL REFERENCES public.blocks(id) ON DELETE CASCADE,
    status TEXT NOT NULL DEFAULT 'locked' CHECK (status IN ('locked', 'available', 'in_progress', 'needs_recovery', 'passed')),
    best_score NUMERIC(4, 2),
    last_score NUMERIC(4, 2),
    attempts_count INT NOT NULL DEFAULT 0,
    passed_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    CONSTRAINT uq_user_block UNIQUE (user_id, block_id)
);

CREATE INDEX IF NOT EXISTS idx_user_block_progress_user ON public.user_block_progress(user_id);

-- ==============================================================================
-- 9. TABELA: user_exercise_attempts (Histórico Granular de Respostas)
-- ==============================================================================
CREATE TABLE IF NOT EXISTS public.user_exercise_attempts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    block_id UUID NOT NULL REFERENCES public.blocks(id) ON DELETE CASCADE,
    word_id UUID REFERENCES public.words(id) ON DELETE SET NULL,
    exercise_id UUID REFERENCES public.exercises(id) ON DELETE SET NULL,
    mode TEXT NOT NULL CHECK (mode IN ('practice', 'test', 'recovery')),
    user_answer TEXT NOT NULL,
    is_correct BOOLEAN NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

CREATE INDEX IF NOT EXISTS idx_user_attempts_user_block ON public.user_exercise_attempts(user_id, block_id);

-- ==============================================================================
-- 10. ROW LEVEL SECURITY (RLS) POLICIES
-- ==============================================================================
ALTER TABLE public.levels ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.workbooks ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.blocks ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.words ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.exercises ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_block_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_exercise_attempts ENABLE ROW LEVEL SECURITY;

-- Regras de Leitura de Conteúdo Público (Apenas publicado):
CREATE POLICY "Public read for levels" ON public.levels
    FOR SELECT USING (true);

CREATE POLICY "Public read for workbooks" ON public.workbooks
    FOR SELECT USING (publication_status = 'published');

CREATE POLICY "Public read for blocks" ON public.blocks
    FOR SELECT USING (
        EXISTS (
            SELECT 1 FROM public.workbooks w 
            WHERE w.id = blocks.workbook_id AND w.publication_status = 'published'
        )
    );

CREATE POLICY "Public read for words" ON public.words
    FOR SELECT USING (
        block_id IS NOT NULL AND
        EXISTS (
            SELECT 1 FROM public.blocks b
            JOIN public.workbooks w ON w.id = b.workbook_id
            WHERE b.id = words.block_id AND w.publication_status = 'published'
        )
    );

CREATE POLICY "Public read for exercises" ON public.exercises
    FOR SELECT USING (
        EXISTS (
            SELECT 1 FROM public.blocks b
            JOIN public.workbooks w ON w.id = b.workbook_id
            WHERE b.id = exercises.block_id AND w.publication_status = 'published'
        )
    );

-- Regras de Usuário (Acesso isolado aos próprios dados):
CREATE POLICY "Users can view own profile" ON public.user_profiles
    FOR SELECT USING (auth.uid() = id);

CREATE POLICY "Users can update own profile" ON public.user_profiles
    FOR UPDATE USING (auth.uid() = id);

CREATE POLICY "Users can insert own profile" ON public.user_profiles
    FOR INSERT WITH CHECK (auth.uid() = id);

CREATE POLICY "Users can view own block progress" ON public.user_block_progress
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can upsert own block progress" ON public.user_block_progress
    FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can view own attempts" ON public.user_exercise_attempts
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own attempts" ON public.user_exercise_attempts
    FOR INSERT WITH CHECK (auth.uid() = user_id);

-- Trigger para criar automaticamente user_profile após signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
DECLARE
    default_level_id UUID;
BEGIN
    SELECT id INTO default_level_id FROM public.levels WHERE code = 'C1' LIMIT 1;
    INSERT INTO public.user_profiles (id, current_level_id, streak_days)
    VALUES (NEW.id, default_level_id, 0)
    ON CONFLICT (id) DO NOTHING;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();
