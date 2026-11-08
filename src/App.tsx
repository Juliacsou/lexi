import { useState, useEffect } from 'react'
import { Header } from './components/Header'
import { LevelDashboard } from './components/LevelDashboard'
import { WorkbookPath } from './components/WorkbookPath'
import { FlashcardsView } from './components/FlashcardsView'
import { ExerciseSession } from './components/ExerciseSession'
import { AuthModal } from './components/AuthModal'
import { WelcomeScreen } from './components/WelcomeScreen'
import { dataService } from './services/dataService'
import { authService } from './services/authService'
import type { Workbook, Block, Exercise } from './types'
import type { User } from '@supabase/supabase-js'

type Screen = 'dashboard' | 'workbook' | 'flashcards' | 'exercise'

export default function App() {
  const [currentScreen, setCurrentScreen] = useState<Screen>('dashboard')
  const [selectedWorkbook, setSelectedWorkbook] = useState<Workbook | null>(null)
  const [selectedBlock, setSelectedBlock] = useState<Block | null>(null)
  const [exerciseMode, setExerciseMode] = useState<'practice' | 'test' | 'recovery'>('test')
  const [activeExercises, setActiveExercises] = useState<Exercise[]>([])
  const [streak, setStreak] = useState<number>(3)
  const [user, setUser] = useState<User | null>(null)
  const [isGuest, setIsGuest] = useState<boolean>(false)
  const [isAuthModalOpen, setIsAuthModalOpen] = useState<boolean>(false)
  const [isAuthChecking, setIsAuthChecking] = useState<boolean>(true)

  const workbooks = dataService.getWorkbooks()

  // Track Supabase auth state & handle OAuth redirect
  useEffect(() => {
    // If URL has ?welcome or ?login or ?logout, reset guest state
    if (window.location.search.includes('welcome') || window.location.search.includes('logout')) {
      setIsGuest(false)
    }

    authService.getUser().then(u => {
      setUser(u)
      setIsAuthChecking(false)
      if (u) {
        dataService.syncUserProgressFromCloud(u.id)
      }
    })

    const unsubscribe = authService.onAuthStateChange(u => {
      setUser(u)
      setIsAuthChecking(false)
      setIsGuest(false)
      if (u) {
        dataService.syncUserProgressFromCloud(u.id)
      }
    })

    return () => unsubscribe()
  }, [])

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

  // If initial auth check is ongoing, render subtle splash
  if (isAuthChecking) {
    return (
      <div className="min-h-screen bg-[#100924] flex items-center justify-center">
        <div className="text-center space-y-3">
          <img
            src="./assets/Logo_V2_Simplificada_Aprovada.png"
            alt="Lexi"
            className="w-20 h-20 mx-auto object-contain animate-pulse"
          />
          <p className="text-xs font-heading font-bold text-slate-400">Loading Lexi...</p>
        </div>
      </div>
    )
  }

  // IF NOT LOGGED IN AND NOT GUEST: SHOW WELCOME / LOGIN SCREEN FIRST!
  if (!user && !isGuest) {
    return (
      <div className="min-h-screen bg-[#100924] flex flex-col items-center">
        <div className="w-full max-w-md min-h-screen bg-[#160E33] border-x border-[#281850] flex flex-col relative shadow-2xl">
          <WelcomeScreen onContinueAsGuest={() => setIsGuest(true)} />
        </div>
      </div>
    )
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
          user={user}
          onOpenAuth={() => setIsAuthModalOpen(true)}
        />

        {/* Content Body */}
        <main className="flex-1">
          {currentScreen === 'dashboard' && (
            <LevelDashboard
              workbooks={workbooks}
              onSelectWorkbook={handleSelectWorkbook}
              user={user}
              onOpenAuth={() => setIsAuthModalOpen(true)}
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

        {/* Google Authentication & Profile Modal */}
        <AuthModal
          isOpen={isAuthModalOpen}
          onClose={() => setIsAuthModalOpen(false)}
          user={user}
          streak={streak}
        />
      </div>
    </div>
  )
}
