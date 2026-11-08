import rawLexiData from '../data/lexiData.json'
import { supabase, isSupabaseConfigured } from '../lib/supabase'
import type { 
  Level, 
  Workbook, 
  Block, 
  Word, 
  Exercise, 
  BlockProgress, 
  ExerciseAttempt, 
  BlockStatus 
} from '../types'

const LOCAL_PROGRESS_KEY = 'lexi_block_progress_v1'
const LOCAL_ATTEMPTS_KEY = 'lexi_exercise_attempts_v1'

class DataService {
  private localProgress: Record<string, BlockProgress> = {}
  private localAttempts: ExerciseAttempt[] = []
  private blockCodeToId: Record<string, string> = {}

  constructor() {
    this.loadLocalData()
    this.initBlockIdCache()
  }

  private async initBlockIdCache() {
    if (!isSupabaseConfigured) return
    try {
      const { data } = await supabase.from('blocks').select('id, code')
      if (data) {
        for (const item of data) {
          this.blockCodeToId[item.code] = item.id
        }
      }
    } catch {
      // offline / ignored
    }
  }

  async getBlockUuid(code: string): Promise<string | null> {
    if (this.blockCodeToId[code]) return this.blockCodeToId[code]
    if (!isSupabaseConfigured) return null
    try {
      const { data } = await supabase.from('blocks').select('id').eq('code', code).single()
      if (data?.id) {
        this.blockCodeToId[code] = data.id
        return data.id
      }
    } catch {
      // Ignore
    }
    return null
  }

  async syncUserProgressFromCloud(userId: string) {
    if (!isSupabaseConfigured) return
    try {
      const { data: rows } = await supabase
        .from('user_block_progress')
        .select('*, blocks(code)')
        .eq('user_id', userId)

      if (rows && rows.length > 0) {
        for (const row of rows) {
          const code = (row.blocks as { code?: string } | null)?.code
          if (code) {
            this.localProgress[code] = {
              block_code: code,
              status: row.status as BlockStatus,
              best_score: row.best_score !== null ? Number(row.best_score) : null,
              last_score: row.last_score !== null ? Number(row.last_score) : null,
              attempts_count: row.attempts_count || 0,
              passed_at: row.passed_at
            }
          }
        }
        this.saveProgress()
      }
    } catch (e) {
      console.warn('Could not sync user progress from Supabase:', e)
    }
  }

  private loadLocalData() {
    try {
      const saved = localStorage.getItem(LOCAL_PROGRESS_KEY)
      if (saved) {
        this.localProgress = JSON.parse(saved)
      } else {
        // Initialize default: Block 1 is available!
        this.localProgress = {
          'VOC-C1-FND-01-B01': {
            block_code: 'VOC-C1-FND-01-B01',
            status: 'available',
            best_score: null,
            last_score: null,
            attempts_count: 0,
            passed_at: null,
          }
        }
        this.saveProgress()
      }

      const attemptsSaved = localStorage.getItem(LOCAL_ATTEMPTS_KEY)
      if (attemptsSaved) {
        this.localAttempts = JSON.parse(attemptsSaved)
      }
    } catch {
      // In SSR or storage restricted environments
    }
  }

  private saveProgress() {
    try {
      localStorage.setItem(LOCAL_PROGRESS_KEY, JSON.stringify(this.localProgress))
    } catch (e) {
      console.warn('Could not save progress to localStorage', e)
    }
  }

  private saveAttempts() {
    try {
      localStorage.setItem(LOCAL_ATTEMPTS_KEY, JSON.stringify(this.localAttempts))
    } catch (e) {
      console.warn('Could not save attempts to localStorage', e)
    }
  }

  // --- CONTENT GETTERS ---

  getLevels(): Level[] {
    return rawLexiData.levels as Level[]
  }

  getWorkbooks(): Workbook[] {
    return rawLexiData.workbooks as Workbook[]
  }

  getBlocks(workbookCode: string): Block[] {
    return (rawLexiData.blocks as Block[]).filter(b => b.workbook_code === workbookCode)
  }

  getBlockByCode(blockCode: string): Block | undefined {
    return (rawLexiData.blocks as Block[]).find(b => b.code === blockCode)
  }

  getWords(blockCode: string): Word[] {
    return (rawLexiData.words as Word[]).filter(w => w.block_code === blockCode)
  }

  getExercises(blockCode: string): Exercise[] {
    return (rawLexiData.exercises as Exercise[]).filter(e => e.block_code === blockCode)
  }

  // --- PROGRESS & GATING LOGIC ---

  getBlockProgress(blockCode: string): BlockProgress {
    if (this.localProgress[blockCode]) {
      return this.localProgress[blockCode]
    }
    // Default: locked
    return {
      block_code: blockCode,
      status: 'locked',
      best_score: null,
      last_score: null,
      attempts_count: 0,
      passed_at: null,
    }
  }

  // Check if a workbook is unlocked based on 70% rule of prerequisite
  isWorkbookUnlocked(workbook: Workbook): boolean {
    if (!workbook.prerequisite_code) {
      return true // Foundations 1 is unlocked by default
    }

    const prereqBlocks = this.getBlocks(workbook.prerequisite_code)
    if (prereqBlocks.length === 0) return true

    const passedCount = prereqBlocks.filter(b => {
      const p = this.getBlockProgress(b.code)
      return p.status === 'passed' && (p.best_score ?? 0) >= 8.0
    }).length

    const requiredToUnlock = Math.ceil(prereqBlocks.length * (workbook.unlock_threshold_percent / 100))
    return passedCount >= requiredToUnlock
  }

  // Calculate workbook passed blocks count and percentage
  getWorkbookStats(workbookCode: string) {
    const blocks = this.getBlocks(workbookCode)
    const passedCount = blocks.filter(b => {
      const p = this.getBlockProgress(b.code)
      return p.status === 'passed'
    }).length
    const total = blocks.length || 20
    const percent = Math.round((passedCount / total) * 100)
    return { passedCount, total, percent }
  }

  // Record an individual exercise attempt
  recordAttempt(attempt: Omit<ExerciseAttempt, 'timestamp'>) {
    const fullAttempt: ExerciseAttempt = {
      ...attempt,
      timestamp: new Date().toISOString()
    }
    this.localAttempts.push(fullAttempt)
    this.saveAttempts()

    // Sync to Supabase if configured and logged in
    if (isSupabaseConfigured) {
      supabase.auth.getUser().then(async ({ data }) => {
        if (data?.user) {
          const blockUuid = await this.getBlockUuid(attempt.block_code)
          if (blockUuid) {
            supabase.from('user_exercise_attempts').insert({
              user_id: data.user.id,
              block_id: blockUuid,
              mode: attempt.mode,
              user_answer: attempt.user_answer,
              is_correct: attempt.is_correct
            }).then()
          }
        }
      })
    }
  }

  // Update block progress after taking test
  finishTest(blockCode: string, score: number, failedWords: string[]) {
    const current = this.getBlockProgress(blockCode)
    const isPassed = score >= 8.0
    const newStatus: BlockStatus = isPassed ? 'passed' : 'needs_recovery'
    const bestScore = Math.max(current.best_score ?? 0, score)

    const updated: BlockProgress = {
      ...current,
      status: newStatus,
      last_score: score,
      best_score: bestScore,
      attempts_count: current.attempts_count + 1,
      passed_at: isPassed ? (current.passed_at || new Date().toISOString()) : current.passed_at
    }

    this.localProgress[blockCode] = updated

    // If passed, unlock next block in the workbook
    if (isPassed) {
      this.unlockNextBlock(blockCode)
    }

    this.saveProgress()

    // Sync to Supabase
    if (isSupabaseConfigured) {
      supabase.auth.getUser().then(async ({ data }) => {
        if (data?.user) {
          const blockUuid = await this.getBlockUuid(blockCode)
          if (blockUuid) {
            supabase.from('user_block_progress').upsert({
              user_id: data.user.id,
              block_id: blockUuid,
              status: newStatus,
              best_score: bestScore,
              last_score: score,
              attempts_count: updated.attempts_count,
              passed_at: updated.passed_at
            }, { onConflict: 'user_id,block_id' }).then()
          }
        }
      })
    }

    return { updated, isPassed, failedWords }
  }

  // Unlock the subsequent block in sequence
  private unlockNextBlock(currentBlockCode: string) {
    const currentBlock = this.getBlockByCode(currentBlockCode)
    if (!currentBlock) return

    const workbookBlocks = this.getBlocks(currentBlock.workbook_code)
    const nextBlock = workbookBlocks.find(b => b.order_index === currentBlock.order_index + 1)
    if (nextBlock) {
      const nextProg = this.getBlockProgress(nextBlock.code)
      if (nextProg.status === 'locked') {
        this.localProgress[nextBlock.code] = {
          ...nextProg,
          status: 'available'
        }
      }
    }
  }

  // Generate dynamic recovery round exercises for failed words
  getRecoveryExercises(blockCode: string, failedWords: string[]): Exercise[] {
    const allExercises = this.getExercises(blockCode)
    // Filter exercises that target the failed words
    const failedSet = new Set(failedWords.map(w => w.toLowerCase()))
    const matching = allExercises.filter(e => failedSet.has(e.word.toLowerCase()))
    
    // If not enough matching, take up to 10 exercises
    if (matching.length > 0) {
      return matching
    }
    return allExercises.slice(0, 10)
  }

  // Reset progress for demo/testing
  resetDemoProgress() {
    this.localProgress = {
      'VOC-C1-FND-01-B01': {
        block_code: 'VOC-C1-FND-01-B01',
        status: 'available',
        best_score: null,
        last_score: null,
        attempts_count: 0,
        passed_at: null,
      }
    }
    this.localAttempts = []
    this.saveProgress()
    this.saveAttempts()
  }
}

export const dataService = new DataService()
