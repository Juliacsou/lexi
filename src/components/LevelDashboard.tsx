import React from 'react'
import { Lock, Unlock, ChevronRight, BookOpen, Star, Sparkles } from 'lucide-react'
import type { Workbook } from '../types'
import { dataService } from '../services/dataService'

interface LevelDashboardProps {
  workbooks: Workbook[]
  onSelectWorkbook: (workbook: Workbook) => void
}

export const LevelDashboard: React.FC<LevelDashboardProps> = ({
  workbooks,
  onSelectWorkbook
}) => {
  return (
    <div className="p-4 space-y-5 pb-12">
      {/* Hero Card */}
      <div className="relative overflow-hidden rounded-3xl bg-gradient-to-br from-[#6732D8] via-[#5222B5] to-[#2D126B] p-5 shadow-xl border border-[#7D46ED]/40">
        <div className="relative z-10">
          <div className="inline-flex items-center gap-1.5 bg-[#FF8F12] text-white text-xs font-heading font-bold px-3 py-1 rounded-full uppercase tracking-wider mb-2.5 shadow-md">
            <Sparkles size={13} />
            <span>Active Level • C1</span>
          </div>

          <h2 className="text-2xl font-heading font-extrabold text-white leading-tight">
            Advanced Vocabulary
          </h2>
          <p className="text-[#FFF0DA] text-sm mt-1 max-w-[260px] leading-relaxed">
            High-utility spoken and professional English. No translation, pure immersion.
          </p>

          <div className="mt-4 flex items-center gap-4 text-xs text-white/90 font-medium">
            <div className="flex items-center gap-1 bg-black/25 backdrop-blur-sm px-2.5 py-1 rounded-xl">
              <BookOpen size={14} className="text-[#FFD333]" />
              <span>5 Workbooks</span>
            </div>
            <div className="flex items-center gap-1 bg-black/25 backdrop-blur-sm px-2.5 py-1 rounded-xl">
              <Star size={14} className="text-[#FFD333]" />
              <span>1,000 Words</span>
            </div>
          </div>
        </div>

        {/* Mascot badge in hero */}
        <img
          src="./assets/Logo_V2_Simplificada_Aprovada.png"
          alt="Lexi Fox"
          className="absolute -right-2 -bottom-3 w-32 h-32 object-contain pointer-events-none drop-shadow-xl"
        />
      </div>

      {/* Section Title */}
      <div>
        <h3 className="text-base font-heading font-bold text-white flex items-center justify-between">
          <span>Workbooks (Apostilas)</span>
          <span className="text-xs text-slate-400 font-normal">70% to unlock next</span>
        </h3>
        <p className="text-xs text-slate-400 mt-0.5">
          Order of increasing difficulty within C1. Complete 14/20 blocks with grade ≥ 8.0.
        </p>
      </div>

      {/* Workbook Cards List */}
      <div className="space-y-3.5">
        {workbooks.map((wb) => {
          const isUnlocked = dataService.isWorkbookUnlocked(wb)
          const stats = dataService.getWorkbookStats(wb.code)
          const prereqWb = wb.prerequisite_code ? dataService.getWorkbooks().find(w => w.code === wb.prerequisite_code) : null

          return (
            <div
              key={wb.code}
              onClick={() => isUnlocked && onSelectWorkbook(wb)}
              className={`rounded-2xl p-4.5 border transition-all duration-200 select-none ${
                isUnlocked
                  ? 'bg-[#1E143E] border-[#3B2574] hover:border-[#6732D8] hover:bg-[#25194D] cursor-pointer shadow-lg active:scale-[0.99]'
                  : 'bg-[#160E2E]/80 border-[#231545] opacity-75 cursor-not-allowed'
              }`}
            >
              <div className="flex items-start justify-between gap-3">
                <div className="flex-1">
                  <div className="flex items-center gap-2">
                    <span className="text-xs font-heading font-bold uppercase tracking-wider text-[#FF8F12]">
                      Tier {wb.difficulty_tier} • Vol {wb.volume_number}
                    </span>
                    {isUnlocked ? (
                      <span className="inline-flex items-center gap-1 text-[11px] font-semibold text-emerald-400 bg-emerald-500/15 px-2 py-0.5 rounded-md">
                        <Unlock size={11} /> Unlocked
                      </span>
                    ) : (
                      <span className="inline-flex items-center gap-1 text-[11px] font-semibold text-amber-400/90 bg-amber-500/15 px-2 py-0.5 rounded-md">
                        <Lock size={11} /> Locked
                      </span>
                    )}
                  </div>

                  <h4 className="text-lg font-heading font-bold text-white mt-1 leading-snug">
                    {wb.title}
                  </h4>

                  <p className="text-xs text-slate-400 mt-0.5">
                    {wb.total_blocks_planned} Blocks • {wb.total_blocks_planned * 10} Words
                  </p>
                </div>

                <div className="w-10 h-10 rounded-2xl flex items-center justify-center bg-[#281A54] border border-[#3E2880] text-white">
                  {isUnlocked ? (
                    <ChevronRight size={20} className="text-[#FF8F12]" />
                  ) : (
                    <Lock size={18} className="text-slate-400" />
                  )}
                </div>
              </div>

              {/* Progress Bar */}
              <div className="mt-3.5 pt-3 border-t border-[#2A1C52]">
                <div className="flex items-center justify-between text-xs mb-1.5">
                  <span className="text-slate-300 font-medium">
                    {stats.passedCount} of {stats.total} blocks passed
                  </span>
                  <span className="font-heading font-bold text-white">
                    {stats.percent}%
                  </span>
                </div>

                <div className="w-full bg-[#130A26] rounded-full h-2.5 overflow-hidden p-0.5 border border-[#2D1B59]">
                  <div
                    className="h-full rounded-full transition-all duration-500 bg-gradient-to-r from-[#FF8F12] to-[#FFD333]"
                    style={{ width: `${Math.min(100, stats.percent)}%` }}
                  />
                </div>

                {!isUnlocked && prereqWb && (
                  <p className="text-[11px] text-amber-400/80 mt-2 flex items-center gap-1">
                    <Lock size={11} />
                    Requires 70% approval in {prereqWb.title}
                  </p>
                )}
              </div>
            </div>
          )
        })}
      </div>
    </div>
  )
}
