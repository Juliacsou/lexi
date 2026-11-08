import { useState } from 'react'
import { Volume2, ChevronLeft, ChevronRight, Award, BookOpen } from 'lucide-react'
import type { Block, Word } from '../types'
import { dataService } from '../services/dataService'

interface FlashcardsViewProps {
  block: Block
  onStartPractice: () => void
  onStartTest: () => void
}

export const FlashcardsView: React.FC<FlashcardsViewProps> = ({
  block,
  onStartPractice,
  onStartTest
}) => {
  const words = dataService.getWords(block.code)
  const [currentIndex, setCurrentIndex] = useState(0)
  const [isPlayingAudio, setIsPlayingAudio] = useState(false)

  const currentWord: Word | undefined = words[currentIndex]

  const handleSpeak = (textToSpeak: string) => {
    if (!('speechSynthesis' in window)) return
    window.speechSynthesis.cancel()
    const utterance = new SpeechSynthesisUtterance(textToSpeak)
    utterance.lang = 'en-US'
    utterance.rate = 0.9
    setIsPlayingAudio(true)
    utterance.onend = () => setIsPlayingAudio(false)
    utterance.onerror = () => setIsPlayingAudio(false)
    window.speechSynthesis.speak(utterance)
  }

  const handlePrev = () => {
    if (currentIndex > 0) {
      setCurrentIndex(currentIndex - 1)
    }
  }

  const handleNext = () => {
    if (currentIndex < words.length - 1) {
      setCurrentIndex(currentIndex + 1)
    }
  }

  if (!currentWord) {
    return (
      <div className="p-6 text-center text-slate-400">
        <p>No words found for this block.</p>
      </div>
    )
  }

  // Highlight target word in application sentences
  const highlightWordInSentence = (sentence: string, target: string) => {
    // Regex case-insensitive match on base word or variations
    const regex = new RegExp(`(\\b${target}[a-z]*\\b)`, 'gi')
    const parts = sentence.split(regex)
    return parts.map((part, i) => {
      if (regex.test(part)) {
        return (
          <span key={i} className="font-extrabold text-[#FFD333] underline decoration-[#FF8F12]/50 decoration-2">
            {part}
          </span>
        )
      }
      return <span key={i}>{part}</span>
    })
  }

  return (
    <div className="p-4 flex flex-col justify-between min-h-[calc(100vh-65px)] max-w-md mx-auto space-y-4 pb-6">
      {/* Top Bar with Card Counter and Progress Indicator */}
      <div className="space-y-2">
        <div className="flex items-center justify-between text-xs text-slate-300">
          <span className="font-heading font-bold text-[#FF8F12] uppercase tracking-wider">
            {block.code}
          </span>
          <span className="bg-[#26174D] px-2.5 py-0.5 rounded-full font-heading font-semibold text-white">
            Card {currentIndex + 1} of {words.length}
          </span>
        </div>

        {/* Mini progress ticks */}
        <div className="flex gap-1">
          {words.map((_, idx) => (
            <div
              key={idx}
              className={`h-1.5 flex-1 rounded-full transition-all duration-300 ${
                idx === currentIndex
                  ? 'bg-[#FF8F12]'
                  : idx < currentIndex
                  ? 'bg-[#6732D8]'
                  : 'bg-[#2B1B54]'
              }`}
            />
          ))}
        </div>
      </div>

      {/* Main Flashcard Card (Touch/Swipe friendly) */}
      <div className="relative bg-gradient-to-b from-[#221547] to-[#1A0F36] rounded-3xl p-6 border-2 border-[#432A85] shadow-2xl flex flex-col justify-between min-h-[400px]">
        {/* Card Header: Part of Speech + Audio Button */}
        <div className="flex items-center justify-between">
          <span className="bg-[#382370] text-[#FFF0DA] text-xs font-heading font-bold px-3 py-1 rounded-full uppercase tracking-wider">
            {currentWord.part_of_speech}
          </span>

          <button
            onClick={() => handleSpeak(currentWord.word)}
            aria-label="Listen pronunciation"
            className={`p-3 rounded-2xl flex items-center justify-center transition-all ${
              isPlayingAudio
                ? 'bg-[#FF8F12] text-white scale-110 shadow-lg shadow-orange-500/50'
                : 'bg-[#2E1B5C] text-[#FF8F12] hover:bg-[#3D257A] active:scale-95'
            }`}
          >
            <Volume2 size={22} className={isPlayingAudio ? 'animate-bounce' : ''} />
          </button>
        </div>

        {/* Center: Target Word */}
        <div className="my-5 text-center">
          <h2 className="text-4xl sm:text-5xl font-heading font-extrabold text-white tracking-tight leading-none drop-shadow-md">
            {currentWord.word}
          </h2>
          <p className="text-xs text-[#FFF0DA]/70 mt-2 font-medium">Click speaker icon to hear English pronunciation</p>
        </div>

        {/* Synonyms Chips */}
        <div className="space-y-1.5 my-2">
          <span className="text-[11px] font-heading font-bold uppercase tracking-wider text-slate-400">
            Direct Synonyms:
          </span>
          <div className="flex flex-wrap gap-1.5">
            {currentWord.synonyms.map((syn, sIdx) => (
              <span
                key={sIdx}
                className="bg-[#301E62] border border-[#4C2E9E] text-white text-xs px-2.5 py-1 rounded-xl font-medium"
              >
                {syn}
              </span>
            ))}
          </div>
        </div>

        {/* Application Sentences */}
        <div className="space-y-2 mt-3 pt-3 border-t border-[#311F5E]">
          <span className="text-[11px] font-heading font-bold uppercase tracking-wider text-slate-400">
            Natural Contexts:
          </span>

          <div className="space-y-2 text-xs leading-relaxed">
            <div className="bg-[#150C2B]/80 p-2.5 rounded-xl border border-[#2D1B59] text-slate-200">
              <span className="text-[#FF8F12] font-bold mr-1.5">1.</span>
              {highlightWordInSentence(currentWord.application_1, currentWord.word)}
            </div>

            <div className="bg-[#150C2B]/80 p-2.5 rounded-xl border border-[#2D1B59] text-slate-200">
              <span className="text-[#FF8F12] font-bold mr-1.5">2.</span>
              {highlightWordInSentence(currentWord.application_2, currentWord.word)}
            </div>
          </div>
        </div>
      </div>

      {/* Navigation Arrows (Prev / Next) */}
      <div className="flex items-center justify-between gap-3 px-2">
        <button
          onClick={handlePrev}
          disabled={currentIndex === 0}
          className={`flex-1 py-2.5 px-3 rounded-2xl btn-3d btn-3d-dark text-xs flex items-center justify-center gap-1.5 ${
            currentIndex === 0 ? 'opacity-40 cursor-not-allowed' : ''
          }`}
        >
          <ChevronLeft size={16} />
          <span>Previous</span>
        </button>

        <button
          onClick={handleNext}
          disabled={currentIndex === words.length - 1}
          className={`flex-1 py-2.5 px-3 rounded-2xl btn-3d btn-3d-dark text-xs flex items-center justify-center gap-1.5 ${
            currentIndex === words.length - 1 ? 'opacity-40 cursor-not-allowed' : ''
          }`}
        >
          <span>Next</span>
          <ChevronRight size={16} />
        </button>
      </div>

      {/* Primary Action Buttons (PRACTICE vs TAKE THE TEST) */}
      <div className="space-y-2.5 pt-2">
        <button
          onClick={onStartPractice}
          className="w-full btn-3d btn-3d-dark py-3.5 px-4 text-sm font-bold flex items-center justify-center gap-2 border border-[#48288C]"
        >
          <BookOpen size={18} className="text-[#FFD333]" />
          <span>PRACTICE (Free Training — No Grade)</span>
        </button>

        <button
          onClick={onStartTest}
          className="w-full btn-3d btn-3d-fox py-3.5 px-4 text-base font-bold flex items-center justify-center gap-2 shadow-xl shadow-orange-500/25"
        >
          <Award size={20} className="text-[#FFD333]" />
          <span>TAKE THE TEST (Official Evaluation)</span>
        </button>
      </div>
    </div>
  )
}
