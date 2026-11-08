import { useState, useEffect } from 'react'
import { Header } from './components/Header'
import { LevelDashboard } from './components/LevelDashboard'
import { WorkbookPath } from './components/WorkbookPath'
import { FlashcardsView } from './components/FlashcardsView'
import { ExerciseSession } from './components/ExerciseSession'
import { dataService } from './services/dataService'
import type { Workbook, Block, Exercise } from './types'

type Screen = 'dashboard' | 'workbook' | 'flashcards' | 'exercise'

export default function App() {
  const [currentScreen, setCurrentScreen] = useState<Screen>('dashboard')
  const [selectedWorkbook, setSelectedWorkbook] = useState<Workbook | null>(null)
  const [selectedBlock, setSelectedBlock] = useState<Block | null>(null)
  const [exerciseMode, setExerciseMode] = useState<'practice' | 'test' | 'recovery'>('test')
  const [activeExercises, setActiveExercises] = useState<Exercise[]>([])
  const [streak, setStreak] = useState<number>(3)

  const workbooks = dataService.getWorkbooks()

  // Default select first workbook on initial load if none selected
  useEffect(() => {
    if (!selectedWorkbook && workbooks.length > 0) {
      setSelectedWorkbook(workbooks[0])
    }
  }, [workbooks, selectedWorkbook])

  const handleSelectWorkbook = (wb: Workbook) => {
    setSelectedWorkbook(wb)
    setCurrentScreen('workbook')
  }

  const handleSelectBlock = (blk: Block) => {
    setSelectedBlock(blk)
    setCurrentScreen('flashcards')
  }

  const handleStartPractice = () => {
    if (!selectedBlock) return
    const exercises = dataService.getExercises(selectedBlock.code)
    setActiveExercises(exercises)
    setExerciseMode('practice')
    setCurrentScreen('exercise')
  }

  const handleStartTest = () => {
    if (!selectedBlock) return
    const exercises = dataService.getExercises(selectedBlock.code)
    setActiveExercises(exercises)
    setExerciseMode('test')
    setCurrentScreen('exercise')
  }

  const handleStartRecovery = (failedWords: string[]) => {
    if (!selectedBlock) return
    const recExercises = dataService.getRecoveryExercises(selectedBlock.code, failedWords)
    setActiveExercises(recExercises)
    setExerciseMode('recovery')
    setCurrentScreen('exercise')
  }

  const handleFinishExercise = () => {
    setCurrentScreen('workbook')
  }

  const handleBack = () => {
    if (currentScreen === 'exercise') {
      setCurrentScreen('flashcards')
    } else if (currentScreen === 'flashcards') {
      setCurrentScreen('workbook')
    } else if (currentScreen === 'workbook') {
      setCurrentScreen('dashboard')
    }
  }

  const handleResetDemo = () => {
    dataService.resetDemoProgress()
    // Force re-render
    setStreak(prev => (prev === 3 ? 4 : 3))
    setCurrentScreen('dashboard')
  }

  // Determine header back button visibility and title
  const showBack = currentScreen !== 'dashboard'
  const headerTitle = 
    currentScreen === 'workbook'
      ? selectedWorkbook?.title || 'Workbook'
      : currentScreen === 'flashcards'
      ? selectedBlock?.title || 'Flashcards'
      : currentScreen === 'exercise'
      ? (exerciseMode === 'practice' ? 'Practice Mode' : exerciseMode === 'recovery' ? 'Recovery Round' : 'Official Test')
      : undefined

  const headerSubtitle =
    currentScreen === 'workbook'
      ? 'Level C1'
      : currentScreen === 'flashcards'
      ? `${selectedBlock?.code} • 10 Words`
      : currentScreen === 'exercise'
      ? selectedBlock?.code
      : undefined

  return (
    <div className="min-h-screen bg-[#100924] flex flex-col items-center">
      {/* Mobile-first centered container with max-width */}
      <div className="w-full max-w-md min-h-screen bg-[#160E33] border-x border-[#281850] flex flex-col relative shadow-2xl">
        {/* Navigation Header */}
        <Header
          title={headerTitle}
          subtitle={headerSubtitle}
          showBack={showBack}
          onBack={handleBack}
          streak={streak}
          onResetDemo={handleResetDemo}
        />

        {/* Content Body */}
        <main className="flex-1">
          {currentScreen === 'dashboard' && (
            <LevelDashboard
              workbooks={workbooks}
              onSelectWorkbook={handleSelectWorkbook}
            />
          )}

          {currentScreen === 'workbook' && selectedWorkbook && (
            <WorkbookPath
              workbook={selectedWorkbook}
              onSelectBlock={handleSelectBlock}
              onOpenReviewQuiz={() => {
                // Open Block 01 as sample review
                if (workbooks[0]) {
                  const b1 = dataService.getBlocks(workbooks[0].code)[0]
                  if (b1) handleSelectBlock(b1)
                }
              }}
            />
          )}

          {currentScreen === 'flashcards' && selectedBlock && (
            <FlashcardsView
              block={selectedBlock}
              onStartPractice={handleStartPractice}
              onStartTest={handleStartTest}
            />
          )}

          {currentScreen === 'exercise' && selectedBlock && (
            <ExerciseSession
              block={selectedBlock}
              mode={exerciseMode}
              exercises={activeExercises}
              onFinish={handleFinishExercise}
              onStartRecovery={handleStartRecovery}
            />
          )}
        </main>
      </div>
    </div>
  )
}
