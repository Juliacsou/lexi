import React from 'react'
import { Lock, Unlock, ChevronRight, BookOpen, Star, Sparkles, LogIn } from 'lucide-react'
import type { Workbook } from '../types'
import type { User } from '@supabase/supabase-js'
import { dataService } from '../services/dataService'

interface LevelDashboardProps {
  workbooks: Workbook[]
  onSelectWorkbook: (workbook: Workbook) => void
  user?: User | null
  onOpenAuth?: () => void
}

export const LevelDashboard: React.FC<LevelDashboardProps> = ({
  workbooks,
  onSelectWorkbook,
  user,
  onOpenAuth
}) => {
  return (
    <div className="p-4 space-y-5 pb-12">
      {/* Hero Card (Clay Hero, No Strokes) */}
      <div className="clay-card-hero p-6 relative overflow-hidden">
        <div className="relative z-10">
          <div className="inline-flex items-center gap-1.5 bg-[#FF8F12] text-white text-xs font-heading font-bold px-3 py-1 rounded-full uppercase tracking-wider mb-2.5 clay-badge">
            <Sparkles size={13} />
            <span>Active Level • C1</span>
          </div>

          <h2 className="text-2xl font-heading font-extrabold text-white leading-tight">
            Advanced Vocabulary
          </h2>
          <p className="text-[#FFF0DA] text-sm mt-1 max-w-[260px] leading-relaxed">
            High-utility spoken and professional English. No translation, pure immersion.
          </p>

          <div className="mt-4 flex items-center gap-3 text-xs text-white/90 font-medium">
            <div className="flex items-center gap-1.5 bg-black/25 backdrop-blur-sm px-3 py-1 rounded-xl clay-badge">
              <BookOpen size={14} className="text-[#FFD333]" />
              <span>5 Workbooks</span>
            </div>
            <div className="flex items-center gap-1.5 bg-black/25 backdrop-blur-sm px-3 py-1 rounded-xl clay-badge">
              <Star size={14} className="text-[#FFD333]" />
              <span>1,000 Words</span>
            </div>
          </div>
        </div>

        {/* Mascot badge in hero */}
        <img
          src="./assets/Logo_V2_Simplificada_Transparente.png"
          alt="Lexi Fox"
          className="absolute -right-3 -bottom-4 w-36 h-36 object-contain pointer-events-none drop-shadow-2xl"
        />
      </div>

      {/* Google Login Banner (Clay Style, No Strokes) */}
      {!user && onOpenAuth && (
        <div className="clay-card p-4 flex items-center justify-between gap-3">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 rounded-2xl bg-white flex items-center justify-center shrink-0 clay-badge">
              <svg className="w-5 h-5" viewBox="0 0 24 24">
                <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.06H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.94l2.85-2.22.81-.63z"/>
                <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.06l3.66 2.84c.87-2.6 3.3-4.52 6.16-4.52z"/>
              </svg>
            </div>
            <div>
              <p className="text-xs font-heading font-bold text-white">Sincronizar Progresso</p>
              <p className="text-[11px] text-[#FFF0DA]/80">Acesse com sua conta Google</p>
            </div>
          </div>
          <button
            onClick={onOpenAuth}
            className="shrink-0 clay-btn clay-btn-white text-xs px-3.5 py-2 flex items-center gap-1.5"
          >
            <LogIn size={13} className="text-[#6732D8]" />
            <span>Entrar</span>
          </button>
        </div>
      )}

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

      {/* Workbook Cards List (Clay Cards, No Strokes) */}
      <div className="space-y-4">
        {workbooks.map((wb) => {
          const isUnlocked = dataService.isWorkbookUnlocked(wb)
          const stats = dataService.getWorkbookStats(wb.code)
          const prereqWb = wb.prerequisite_code ? dataService.getWorkbooks().find(w => w.code === wb.prerequisite_code) : null

          return (
            <div
              key={wb.code}
              onClick={() => isUnlocked && onSelectWorkbook(wb)}
              className={`p-5 transition-all duration-200 select-none ${
                isUnlocked
                  ? 'clay-card cursor-pointer hover:scale-[1.01] active:scale-[0.99]'
                  : 'clay-well opacity-60 cursor-not-allowed'
              }`}
            >
              <div className="flex items-start justify-between gap-3">
                <div className="flex-1">
                  <div className="flex items-center gap-2">
                    <span className="text-xs font-heading font-bold uppercase tracking-wider text-[#FF8F12]">
                      Tier {wb.difficulty_tier} • Vol {wb.volume_number}
                    </span>
                    {isUnlocked ? (
                      <span className="clay-badge inline-flex items-center gap-1 text-[11px] font-semibold text-emerald-400 bg-emerald-500/20 px-2.5 py-0.5">
                        <Unlock size={11} /> Unlocked
                      </span>
                    ) : (
                      <span className="clay-badge inline-flex items-center gap-1 text-[11px] font-semibold text-amber-400/90 bg-amber-500/20 px-2.5 py-0.5">
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

                <div className={`w-11 h-11 rounded-2xl flex items-center justify-center ${
                  isUnlocked ? 'clay-btn clay-btn-dark' : 'clay-well text-slate-500'
                }`}>
                  {isUnlocked ? (
                    <ChevronRight size={20} className="text-[#FF8F12]" />
                  ) : (
                    <Lock size={18} className="text-slate-400" />
                  )}
                </div>
              </div>

              {/* Progress Bar (Clay Well Track + Puffy Fill) */}
              <div className="mt-4 pt-3 border-t border-white/5">
                <div className="flex items-center justify-between text-xs mb-1.5">
                  <span className="text-slate-300 font-medium">
                    {stats.passedCount} of {stats.total} blocks passed
                  </span>
                  <span className="font-heading font-bold text-white">
                    {stats.percent}%
                  </span>
                </div>

                <div className="w-full clay-well h-3 overflow-hidden p-0.5">
                  <div
                    className="h-full rounded-full transition-all duration-500 bg-gradient-to-r from-[#FF8F12] to-[#FFD333] shadow-[inset_1px_1px_2px_rgba(255,255,255,0.4)]"
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
