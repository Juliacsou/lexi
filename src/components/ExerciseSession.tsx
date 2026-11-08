import { useState } from 'react'
import { X, CheckCircle, AlertCircle, Award, RefreshCw, ArrowRight, Volume2 } from 'lucide-react'
import confetti from 'canvas-confetti'
import type { Block, Exercise } from '../types'
import { dataService } from '../services/dataService'

interface ExerciseSessionProps {
  block: Block
  mode: 'practice' | 'test' | 'recovery'
  exercises: Exercise[]
  onFinish: () => void
  onStartRecovery?: (failedWords: string[]) => void
}

export const ExerciseSession: React.FC<ExerciseSessionProps> = ({
  block,
  mode,
  exercises,
  onFinish,
  onStartRecovery
}) => {
  const [currentIndex, setCurrentIndex] = useState(0)
  const [selectedOption, setSelectedOption] = useState<string | null>(null)
  const [isAnswered, setIsAnswered] = useState(false)
  const [isCorrect, setIsCorrect] = useState(false)
  const [correctCount, setCorrectCount] = useState(0)
  const [failedWordsSet, setFailedWordsSet] = useState<Set<string>>(new Set())
  const [isFinished, setIsFinished] = useState(false)
  const [finalScore, setFinalScore] = useState<number>(0)

  const currentExercise = exercises[currentIndex]
  const totalExercises = exercises.length

  const handleSelectOption = (opt: string) => {
    if (isAnswered) return
    setSelectedOption(opt)
  }

  const handleCheckAnswer = () => {
    if (!selectedOption || !currentExercise || isAnswered) return

    const correct = selectedOption.trim().toLowerCase() === currentExercise.correct_answer.trim().toLowerCase()
    setIsCorrect(correct)
    setIsAnswered(true)

    if (correct) {
      setCorrectCount(prev => prev + 1)
    } else {
      setFailedWordsSet(prev => new Set(prev).add(currentExercise.word))
    }

    // Record attempt
    dataService.recordAttempt({
      block_code: block.code,
      word: currentExercise.word,
      mode,
      user_answer: selectedOption,
      is_correct: correct
    })
  }

  const handleContinue = () => {
    if (currentIndex + 1 < totalExercises) {
      setCurrentIndex(prev => prev + 1)
      setSelectedOption(null)
      setIsAnswered(false)
    } else {
      // Calculate final score
      const totalCorrect = isCorrect ? correctCount : correctCount // Already updated
      const score = Number(((totalCorrect / totalExercises) * 10).toFixed(1))
      setFinalScore(score)
      setIsFinished(true)

      const failedWords = Array.from(failedWordsSet)

      if (mode === 'test' || mode === 'recovery') {
        dataService.finishTest(block.code, score, failedWords)
        if (score >= 8.0) {
          try {
            confetti({
              particleCount: 100,
              spread: 70,
              origin: { y: 0.6 }
            })
          } catch {
            // Ignore in environments without canvas
          }
        }
      }
    }
  }

  // Pronunciation audio
  const handleSpeak = (text: string) => {
    if (!('speechSynthesis' in window)) return
    window.speechSynthesis.cancel()
    const utterance = new SpeechSynthesisUtterance(text)
    utterance.lang = 'en-US'
    utterance.rate = 0.95
    window.speechSynthesis.speak(utterance)
  }

  // ----------------------------------------------------
  // RESULTS SCREEN (Test Completed or Practice Completed)
  // ----------------------------------------------------
  if (isFinished) {
    const isPassed = finalScore >= 8.0
    const failedWords = Array.from(failedWordsSet)
    const blockWords = dataService.getWords(block.code)

    return (
      <div className="p-5 flex flex-col justify-between min-h-[calc(100vh-65px)] max-w-md mx-auto space-y-6 animate-in fade-in duration-300">
        <div className="space-y-6 pt-4 text-center">
          {/* Badge Icon */}
          <div className="inline-block relative">
            <div
              className={`w-24 h-24 rounded-full mx-auto flex items-center justify-center shadow-2xl ${
                isPassed || mode === 'practice'
                  ? 'bg-gradient-to-tr from-[#FF8F12] to-[#FFD333] shadow-amber-500/40'
                  : 'bg-gradient-to-tr from-[#EF4444] to-[#F97316] shadow-rose-500/40'
              }`}
            >
              {isPassed || mode === 'practice' ? (
                <Award size={48} className="text-[#1A1202]" />
              ) : (
                <AlertCircle size={48} className="text-white" />
              )}
            </div>
          </div>

          {/* Heading */}
          <div>
            <span className="text-xs font-heading font-bold uppercase tracking-wider text-[#FF8F12]">
              {mode === 'practice' ? 'Practice Completed' : mode === 'recovery' ? 'Recovery Round Finished' : 'Official Test Result'}
            </span>
            <h2 className="text-3xl font-heading font-extrabold text-white mt-1">
              {mode === 'practice'
                ? 'Great Training!'
                : isPassed
                ? 'PASSED! Unit Mastered 🎉'
                : 'Needs Recovery'}
            </h2>
            <p className="text-sm text-slate-300 mt-1">
              {mode === 'practice'
                ? 'Practice exercises completed. Now take the Official Test to certify the block!'
                : isPassed
                ? `Outstanding performance! You met the 8.0 threshold.`
                : `Minimum required score is 8.0 / 10.0. Review your missed words below.`}
            </p>
          </div>

          {/* Score Card */}
          <div className="clay-card p-5">
            <div className="flex items-center justify-around">
              <div>
                <span className="text-xs text-slate-400 font-medium">Final Grade</span>
                <p className={`text-4xl font-heading font-extrabold ${isPassed || mode === 'practice' ? 'text-[#FFD333]' : 'text-rose-400'}`}>
                  {finalScore.toFixed(1)}
                  <span className="text-sm text-slate-400 font-normal"> / 10.0</span>
                </p>
              </div>

              <div className="h-10 w-px bg-white/10" />

              <div>
                <span className="text-xs text-slate-400 font-medium">Accuracy</span>
                <p className="text-3xl font-heading font-bold text-white">
                  {correctCount}
                  <span className="text-sm text-slate-400 font-normal"> / {totalExercises}</span>
                </p>
              </div>
            </div>

            {/* Passing bar indicator */}
            <div className="mt-4 pt-3 border-t border-white/5">
              <div className="flex justify-between text-xs text-slate-300 mb-1">
                <span>Passing Cutoff: 8.0 (80%)</span>
                <span className={isPassed ? 'text-emerald-400 font-bold' : 'text-rose-400 font-bold'}>
                  {isPassed ? 'APPROVED' : 'BELOW CUTOFF'}
                </span>
              </div>
              <div className="w-full clay-well h-3 overflow-hidden p-0.5">
                <div
                  className={`h-full rounded-full transition-all duration-500 ${isPassed ? 'bg-emerald-500' : 'bg-rose-500'}`}
                  style={{ width: `${Math.min(100, (finalScore / 10) * 100)}%` }}
                />
              </div>
            </div>
          </div>

          {/* MINI-CERTIFICATE (If Passed in Test mode) */}
          {isPassed && mode !== 'practice' && (
            <div 
              className="clay-card-elevated p-5 text-left relative overflow-hidden"
              style={{
                boxShadow: 'inset 2px 2px 5px rgba(255, 211, 51, 0.25), inset -3px -4px 6px rgba(0, 0, 0, 0.5), 0 16px 36px -6px rgba(255, 211, 51, 0.15)'
              }}
            >
              <div className="flex items-center justify-between pb-3 border-b border-white/10">
                <div>
                  <span className="text-[10px] font-heading font-bold uppercase tracking-wider text-[#FFD333]">
                    Official Block Mini-Certificate
                  </span>
                  <h3 className="text-base font-heading font-extrabold text-white">
                    {block.code} • Certified
                  </h3>
                </div>
                <img
                  src="./assets/Logo_V2_Simplificada_Aprovada.png"
                  alt="Lexi"
                  className="w-10 h-10 object-contain drop-shadow"
                />
              </div>

              <div className="mt-3">
                <p className="text-xs text-slate-300 mb-2 font-medium">10 Target Words Dominated:</p>
                <div className="grid grid-cols-2 gap-1.5 text-xs">
                  {blockWords.map(w => (
                    <div key={w.word} className="flex items-center gap-1.5 text-slate-200 clay-well px-2.5 py-1.5 rounded-xl">
                      <CheckCircle size={13} className="text-emerald-400 shrink-0" />
                      <span className="font-semibold">{w.word}</span>
                    </div>
                  ))}
                </div>
              </div>

              <p className="text-[10px] text-slate-400 mt-3 text-center italic">
                Lexi English Immersion • Workbook progression updated towards 70% threshold.
              </p>
            </div>
          )}

          {/* RECOVERY ROUND PROMPT (If failed) */}
          {!isPassed && mode !== 'practice' && failedWords.length > 0 && (
            <div 
              className="clay-card p-4 text-left space-y-2.5" 
              style={{ background: 'linear-gradient(145deg, #2D1428, #1E0C1C)' }}
            >
              <div className="flex items-center gap-2 text-rose-300 font-heading font-bold text-xs uppercase tracking-wider">
                <AlertCircle size={15} />
                <span>Target Words Requiring Reinforcement ({failedWords.length}):</span>
              </div>
              <div className="flex flex-wrap gap-1.5">
                {failedWords.map(w => (
                  <span key={w} className="clay-badge bg-rose-500/25 text-rose-200 text-xs px-3 py-1 font-bold">
                    {w}
                  </span>
                ))}
              </div>
              <p className="text-xs text-slate-300 leading-relaxed pt-1">
                Before attempting the official test again, complete the tailored Recovery Round below to master these missed words.
              </p>
            </div>
          )}
        </div>

        {/* Footer Actions */}
        <div className="space-y-2.5 pt-4">
          {!isPassed && mode !== 'practice' && onStartRecovery && failedWords.length > 0 ? (
            <button
              onClick={() => onStartRecovery(failedWords)}
              className="w-full clay-btn clay-btn-red py-3.5 px-4 text-base font-bold flex items-center justify-center gap-2"
            >
              <RefreshCw size={18} />
              <span>START RECOVERY ROUND NOW</span>
            </button>
          ) : null}

          <button
            onClick={onFinish}
            className="w-full clay-btn clay-btn-purple py-3.5 px-4 text-base font-bold flex items-center justify-center gap-2"
          >
            <span>Back to Workbook Path</span>
            <ArrowRight size={18} />
          </button>
        </div>
      </div>
    )
  }

  // ----------------------------------------------------
  // QUESTION SCREEN (1-by-1 Flow)
  // ----------------------------------------------------
  const progressPercent = Math.round(((currentIndex + 1) / totalExercises) * 100)

  return (
    <div className="p-4 flex flex-col justify-between min-h-[calc(100vh-65px)] max-w-md mx-auto space-y-4 pb-28">
      {/* Top Bar: Close button + Animated Progress bar + Counter */}
      <div className="space-y-2.5">
        <div className="flex items-center justify-between text-xs">
          <div className="flex items-center gap-2">
            <button
              onClick={onFinish}
              className="clay-btn clay-btn-dark p-2 -ml-1 text-slate-300 hover:text-white rounded-xl"
              aria-label="Exit exercise session"
            >
              <X size={18} />
            </button>
            <span className="clay-badge bg-[#251545] text-[#FF8F12] text-[11px] font-heading font-bold px-3 py-1 uppercase tracking-wider">
              {mode === 'practice' ? 'Practice Mode' : mode === 'recovery' ? 'Recovery Round' : 'Official Test'}
            </span>
          </div>

          <span className="text-slate-300 font-heading font-bold text-xs">
            {currentIndex + 1} / {totalExercises}
          </span>
        </div>

        {/* Animated Progress Bar in sunken clay well */}
        <div className="w-full clay-well h-3 overflow-hidden p-0.5">
          <div
            className="h-full rounded-full transition-all duration-300 bg-gradient-to-r from-[#FF8F12] to-[#FFD333]"
            style={{ width: `${progressPercent}%` }}
          />
        </div>
      </div>

      {/* Main Question Area */}
      <div className="space-y-5 my-auto">
        {/* Type pill + Audio read */}
        <div className="flex items-center justify-between">
          <span className="clay-badge bg-[#2B1754] text-[#FFF0DA] text-[11px] font-heading font-bold px-3.5 py-1.5 uppercase tracking-wider">
            {currentExercise.type === 'sentence_completion' ? 'Fill in the blanks' : 'Synonym Matching'}
          </span>

          <button
            onClick={() => handleSpeak(currentExercise.prompt)}
            className="clay-btn clay-btn-dark p-2 rounded-xl text-slate-300 hover:text-[#FF8F12]"
            title="Read question"
          >
            <Volume2 size={16} />
          </button>
        </div>

        {/* Prompt Container */}
        <div className="clay-card p-6">
          <h3 className="text-lg sm:text-xl font-heading font-bold text-white leading-relaxed">
            {currentExercise.prompt}
          </h3>
        </div>

        {/* Options List (4 Soft Clay Buttons) */}
        <div className="space-y-3 pt-1">
          {currentExercise.options.map((opt, oIdx) => {
            const isSelected = selectedOption === opt
            const isCorrectOption = opt.trim().toLowerCase() === currentExercise.correct_answer.trim().toLowerCase()

            let buttonClass = 'clay-btn-dark'

            if (isAnswered) {
              if (isCorrectOption) {
                buttonClass = 'clay-btn-green'
              } else if (isSelected && !isCorrect) {
                buttonClass = 'clay-btn-red'
              }
            } else if (isSelected) {
              buttonClass = 'clay-btn-orange'
            }

            return (
              <button
                key={oIdx}
                onClick={() => handleSelectOption(opt)}
                disabled={isAnswered}
                className={`w-full py-3.5 px-5 rounded-2xl clay-btn ${buttonClass} text-base font-bold text-left flex items-center justify-between`}
              >
                <span>{opt}</span>
                <span className="text-xs opacity-60 font-mono">
                  {String.fromCharCode(65 + oIdx)}
                </span>
              </button>
            )
          })}
        </div>
      </div>

      {/* Primary Action Button (Check Answer) - When not yet answered */}
      {!isAnswered && (
        <div className="pt-4">
          <button
            onClick={handleCheckAnswer}
            disabled={!selectedOption}
            className={`w-full clay-btn clay-btn-orange py-4 text-base font-bold ${
              !selectedOption ? 'opacity-40 cursor-not-allowed' : ''
            }`}
          >
            CHECK ANSWER
          </button>
        </div>
      )}

      {/* ---------------------------------------------------- */}
      {/* CLAY INSTANT FEEDBACK BOTTOM SHEET GAVETA */}
      {/* ---------------------------------------------------- */}
      {isAnswered && (
        <div
          className="fixed bottom-0 left-0 right-0 z-50 p-5 rounded-t-3xl animate-in slide-in-from-bottom duration-200 text-white"
          style={{
            background: isCorrect 
              ? 'linear-gradient(160deg, #184824, #0F2D17)' 
              : 'linear-gradient(160deg, #4A171D, #2D0C10)',
            boxShadow: isCorrect 
              ? 'inset 0 2px 4px rgba(255, 255, 255, 0.25), inset 0 -3px 6px rgba(0, 0, 0, 0.5), 0 -12px 36px rgba(0, 0, 0, 0.7)' 
              : 'inset 0 2px 4px rgba(255, 255, 255, 0.2), inset 0 -3px 6px rgba(0, 0, 0, 0.6), 0 -12px 36px rgba(0, 0, 0, 0.7)',
            border: 'none'
          }}
        >
          <div className="max-w-md mx-auto space-y-4">
            <div className="flex items-start gap-3">
              <div
                className={`p-2.5 rounded-2xl clay-badge ${
                  isCorrect ? 'bg-emerald-500 text-white' : 'bg-rose-500 text-white'
                }`}
              >
                {isCorrect ? <CheckCircle size={24} /> : <AlertCircle size={24} />}
              </div>

              <div className="flex-1">
                <h4 className="text-lg font-heading font-extrabold leading-tight">
                  {isCorrect ? 'Excellent! Spot on.' : 'Incorrect'}
                </h4>

                {!isCorrect && (
                  <p className="text-sm font-semibold text-rose-200 mt-0.5">
                    Correct answer: <span className="underline font-bold text-white">{currentExercise.correct_answer}</span>
                  </p>
                )}

                <p className="text-xs text-slate-200 mt-1 leading-relaxed opacity-90">
                  {currentExercise.explanation}
                </p>
              </div>
            </div>

            <button
              onClick={handleContinue}
              className={`w-full clay-btn py-4 text-base font-bold ${
                isCorrect ? 'clay-btn-green' : 'clay-btn-red'
              }`}
            >
              CONTINUE
            </button>
          </div>
        </div>
      )}
    </div>
  )
}
