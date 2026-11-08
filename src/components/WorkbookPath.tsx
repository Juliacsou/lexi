import React, { useState } from 'react'
import { Lock, Crown, Play, AlertCircle, Sparkles, X, BookOpen } from 'lucide-react'
import type { Workbook, Block, BlockProgress } from '../types'
import { dataService } from '../services/dataService'

interface WorkbookPathProps {
  workbook: Workbook
  onSelectBlock: (block: Block) => void
  onOpenReviewQuiz?: () => void
}

export const WorkbookPath: React.FC<WorkbookPathProps> = ({
  workbook,
  onSelectBlock,
  onOpenReviewQuiz
}) => {
  const blocks = dataService.getBlocks(workbook.code)
  const stats = dataService.getWorkbookStats(workbook.code)
  const [selectedPreviewBlock, setSelectedPreviewBlock] = useState<Block | null>(null)

  // Duolingo-style offset classes for zig-zag path: 0 = center, -1 = left, 1 = right
  const getOffsetClass = (index: number) => {
    const cycle = index % 4
    if (cycle === 0) return 'translate-x-0'
    if (cycle === 1) return '-translate-x-9'
    if (cycle === 2) return 'translate-x-0'
    return 'translate-x-9'
  }

  const handleNodeClick = (block: Block, progress: BlockProgress) => {
    if (progress.status === 'locked') return
    setSelectedPreviewBlock(block)
  }

  return (
    <div className="p-4 space-y-6 pb-20">
      {/* Workbook Header Banner */}
      <div className="bg-[#1E143E] rounded-3xl p-5 border border-[#3B2574] shadow-lg">
        <div className="flex items-center justify-between">
          <span className="text-xs font-heading font-bold text-[#FF8F12] uppercase tracking-wider">
            Tier {workbook.difficulty_tier} • Volume {workbook.volume_number}
          </span>
          <span className="text-xs text-slate-300 font-medium">
            Goal: 70% ({Math.ceil(blocks.length * 0.7)}/{blocks.length} blocks)
          </span>
        </div>

        <h2 className="text-2xl font-heading font-extrabold text-white mt-1">
          {workbook.title}
        </h2>

        {/* Progress Bar */}
        <div className="mt-4">
          <div className="flex justify-between text-xs text-slate-300 mb-1.5 font-medium">
            <span>{stats.passedCount} of {blocks.length} completed</span>
            <span className="font-heading font-bold text-white">{stats.percent}%</span>
          </div>
          <div className="w-full bg-[#120B26] rounded-full h-3 overflow-hidden p-0.5 border border-[#2B1B54]">
            <div
              className="h-full rounded-full transition-all duration-500 bg-gradient-to-r from-[#FF8F12] via-[#FFD333] to-[#22C55E]"
              style={{ width: `${Math.min(100, stats.percent)}%` }}
            />
          </div>
        </div>

        {/* Custom Review Quiz CTA if any blocks passed */}
        {stats.passedCount >= 1 && (
          <button
            onClick={onOpenReviewQuiz}
            className="w-full mt-4 btn-3d btn-3d-yellow py-2.5 px-4 rounded-xl text-xs flex items-center justify-center gap-2"
          >
            <Sparkles size={15} />
            <span>Cumulative Review Quiz ({stats.passedCount} blocks unlocked)</span>
          </button>
        )}
      </div>

      {/* Vertical Gamified Path */}
      <div className="relative flex flex-col items-center py-6">
        {/* Decorative central winding line */}
        <div className="absolute top-8 bottom-8 w-2 bg-[#281850] rounded-full -z-0" />

        <div className="space-y-7 z-10 w-full flex flex-col items-center">
          {blocks.map((block, index) => {
            const progress = dataService.getBlockProgress(block.code)
            const isLocked = progress.status === 'locked'
            const isPassed = progress.status === 'passed'
            const isRecovery = progress.status === 'needs_recovery'
            const isAvailable = progress.status === 'available' || progress.status === 'in_progress'

            return (
              <div
                key={block.code}
                className={`transition-transform duration-300 ${getOffsetClass(index)} flex flex-col items-center`}
              >
                {/* Node Button */}
                <button
                  onClick={() => handleNodeClick(block, progress)}
                  disabled={isLocked}
                  aria-label={`${block.title}: ${progress.status}`}
                  className={`w-20 h-20 rounded-full flex flex-col items-center justify-center relative transition-all duration-200 select-none ${
                    isPassed
                      ? 'btn-3d btn-3d-yellow shadow-amber-500/30'
                      : isRecovery
                      ? 'btn-3d btn-3d-red shadow-rose-500/30 animate-pulse'
                      : isAvailable
                      ? 'btn-3d btn-3d-fox shadow-orange-500/40 ring-4 ring-[#FF8F12]/30 scale-105'
                      : 'bg-[#22163F] border-b-4 border-[#160D2D] text-slate-500 cursor-not-allowed'
                  }`}
                >
                  {isPassed ? (
                    <Crown size={28} className="fill-[#1A1202] text-[#1A1202]" />
                  ) : isRecovery ? (
                    <AlertCircle size={28} className="text-white" />
                  ) : isAvailable ? (
                    <Play size={26} className="fill-white text-white ml-0.5" />
                  ) : (
                    <Lock size={24} className="text-slate-500" />
                  )}

                  {/* Score badge if passed */}
                  {isPassed && progress.best_score !== null && (
                    <span className="absolute -bottom-2 bg-black/80 text-[#FFD333] text-[10px] font-heading font-bold px-2 py-0.5 rounded-full border border-[#FFD333]/50">
                      ★ {progress.best_score.toFixed(1)}
                    </span>
                  )}

                  {/* Recovery badge */}
                  {isRecovery && (
                    <span className="absolute -bottom-2 bg-[#EF4444] text-white text-[9px] font-heading font-bold px-2 py-0.5 rounded-full">
                      RECOVERY
                    </span>
                  )}
                </button>

                {/* Block Label */}
                <div className="mt-2 text-center">
                  <span className={`text-xs font-heading font-bold ${isLocked ? 'text-slate-500' : 'text-white'}`}>
                    {block.title}
                  </span>
                </div>
              </div>
            )
          })}
        </div>
      </div>

      {/* Block Preview Drawer / Modal */}
      {selectedPreviewBlock && (
        <div className="fixed inset-0 z-50 bg-black/70 backdrop-blur-sm flex items-end sm:items-center justify-center p-0 sm:p-4 animate-in fade-in duration-200">
          <div className="w-full max-w-md bg-[#1B113B] border-t sm:border border-[#3B2574] rounded-t-3xl sm:rounded-3xl p-6 space-y-4 shadow-2xl max-h-[85vh] overflow-y-auto">
            <div className="flex items-center justify-between">
              <div>
                <span className="text-xs font-heading font-bold text-[#FF8F12] uppercase tracking-wider">
                  {selectedPreviewBlock.code}
                </span>
                <h3 className="text-xl font-heading font-extrabold text-white">
                  {selectedPreviewBlock.title}
                </h3>
              </div>
              <button
                onClick={() => setSelectedPreviewBlock(null)}
                className="p-2 text-slate-400 hover:text-white rounded-full bg-[#281A54]"
              >
                <X size={18} />
              </button>
            </div>

            {/* Target Words in this block */}
            <div>
              <p className="text-xs text-slate-400 mb-2 font-medium">10 Target Words in this unit:</p>
              <div className="flex flex-wrap gap-1.5">
                {dataService.getWords(selectedPreviewBlock.code).map(w => (
                  <span
                    key={w.word}
                    className="bg-[#26174D] border border-[#3B2574] text-white text-xs px-2.5 py-1 rounded-xl font-medium"
                  >
                    {w.word}
                  </span>
                ))}
              </div>
            </div>

            {/* Status Info */}
            {(() => {
              const p = dataService.getBlockProgress(selectedPreviewBlock.code)
              return (
                <div className="bg-[#120B26] p-3 rounded-2xl border border-[#2B1B54] text-xs space-y-1">
                  <div className="flex justify-between">
                    <span className="text-slate-400">Status:</span>
                    <span className="font-heading font-bold uppercase text-[#FF8F12]">
                      {p.status}
                    </span>
                  </div>
                  {p.best_score !== null && (
                    <div className="flex justify-between">
                      <span className="text-slate-400">Best Score:</span>
                      <span className="font-heading font-bold text-[#FFD333]">
                        {p.best_score.toFixed(1)} / 10.0
                      </span>
                    </div>
                  )}
                  <div className="flex justify-between">
                    <span className="text-slate-400">Attempts:</span>
                    <span className="font-semibold text-white">{p.attempts_count}</span>
                  </div>
                </div>
              )
            })()}

            {/* Action Button */}
            <button
              onClick={() => {
                const b = selectedPreviewBlock
                setSelectedPreviewBlock(null)
                onSelectBlock(b)
              }}
              className="w-full btn-3d btn-3d-fox py-3 text-base font-bold shadow-lg flex items-center justify-center gap-2"
            >
              <BookOpen size={18} />
              <span>Study Flashcards</span>
            </button>
          </div>
        </div>
      )}
    </div>
  )
}
