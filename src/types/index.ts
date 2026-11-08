export type DifficultyTier = 1 | 2 | 3 | 4 | 5

export interface Level {
  code: string
  title: string
  description: string
  order_index: number
}

export interface Workbook {
  code: string
  level_code: string
  title: string
  difficulty_tier: DifficultyTier
  volume_number: number
  total_blocks_planned: number
  unlock_threshold_percent: number
  prerequisite_code: string | null
  publication_status: 'draft' | 'published' | 'archived'
  order_index: number
}

export interface Block {
  workbook_code: string
  code: string
  title: string
  order_index: number
}

export interface Word {
  block_code: string
  word: string
  part_of_speech: 'noun' | 'verb' | 'adjective' | 'adverb' | string
  synonyms: string[]
  application_1: string
  application_2: string
  order_index: number
}

export interface Exercise {
  block_code: string
  word: string
  type: 'sentence_completion' | 'synonym_matching'
  prompt: string
  options: string[]
  correct_answer: string
  explanation: string
  order_index: number
}

export type BlockStatus = 'locked' | 'available' | 'in_progress' | 'needs_recovery' | 'passed'

export interface BlockProgress {
  block_code: string
  status: BlockStatus
  best_score: number | null
  last_score: number | null
  attempts_count: number
  passed_at: string | null
}

export interface ExerciseAttempt {
  block_code: string
  word: string
  mode: 'practice' | 'test' | 'recovery'
  user_answer: string
  is_correct: boolean
  timestamp: string
}
