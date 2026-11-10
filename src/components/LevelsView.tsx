import React, { useState } from 'react'
import { CheckCircle, Lock, Sparkles, ArrowRight, X, BookOpen, Layers } from 'lucide-react'
import { dataService } from '../services/dataService'

export interface LevelItem {
  code: string
  title: string
  name: string
  tagline: string
  description: string
  status: 'completed' | 'active' | 'locked'
  totalBlocks: number
  totalWords: number
  passedBlocks?: number
  percent?: number
  prereqNote?: string
}

interface LevelsViewProps {
  onBack?: () => void
  onSelectLevel: (levelCode: string) => void
  currentLevel?: string
}

export const LevelsView: React.FC<LevelsViewProps> = ({
  onSelectLevel,
  currentLevel = 'C1'
}) => {
  const [selectedModalLevel, setSelectedModalLevel] = useState<LevelItem | null>(null)
  const c1Stats = dataService.getLevelStats('C1')

  const levels: LevelItem[] = [
    {
      code: 'A1',
      title: 'Nível A1',
      name: 'Iniciante (Beginner)',
      tagline: 'Vocabulário básico e situações cotidianas',
      description: 'Fundamentos essenciais para saudações, compras, números e orientações imediatas.',
      status: 'completed',
      totalBlocks: 60,
      totalWords: 600,
      percent: 100,
    },
    {
      code: 'A2',
      title: 'Nível A2',
      name: 'Básico (Elementary)',
      tagline: 'Comunicação diária e expressões frequentes',
      description: 'Estruturação de conversas simples sobre família, trabalho, rotinas e compras.',
      status: 'completed',
      totalBlocks: 80,
      totalWords: 800,
      percent: 100,
    },
    {
      code: 'B1',
      title: 'Nível B1',
      name: 'Intermediário (Intermediate)',
      tagline: 'Expressão independente e ideias conectadas',
      description: 'Capacidade de expressar planos, relatar acontecimentos e discutir temas de interesse pessoal.',
      status: 'completed',
      totalBlocks: 100,
      totalWords: 1000,
      percent: 100,
    },
    {
      code: 'B2',
      title: 'Nível B2',
      name: 'Pós-Intermediário (Upper Intermediate)',
      tagline: 'Fluência técnica, social e profissional',
      description: 'Compreensão de ideias complexas e interação espontânea sem esforço aparente.',
      status: 'completed',
      totalBlocks: 100,
      totalWords: 1000,
      percent: 100,
    },
    {
      code: 'C1',
      title: 'Nível C1',
      name: 'Avançado (Advanced)',
      tagline: 'Alta utilidade, precisão e imersão pura',
      description: '1.000 palavras profissionais e acadêmicas de alto impacto distribuídas em 5 apostilas estruturadas.',
      status: 'active',
      totalBlocks: 100,
      totalWords: 1000,
      passedBlocks: c1Stats.passedCount,
      percent: c1Stats.percent,
    },
    {
      code: 'C2',
      title: 'Nível C2',
      name: 'Domínio Pleno (Proficiency)',
      tagline: 'Nuances sutis, retórica e fluência nativa',
      description: 'Expressão espontânea com altíssima precisão conceitual e diferenciação de matizes de significado.',
      status: 'locked',
      totalBlocks: 100,
      totalWords: 1000,
      percent: 0,
      prereqNote: 'Requer aprovação em 70% dos blocos do Nível C1',
    },
  ]

  const handleCardClick = (lvl: LevelItem) => {
    if (lvl.status === 'active' || lvl.code === currentLevel) {
      onSelectLevel(lvl.code)
    } else {
      setSelectedModalLevel(lvl)
    }
  }

  return (
    <div className="p-4 space-y-5 pb-20 animate-in fade-in duration-200">
      {/* Intro Header Banner (Clay Card) */}
      <div className="clay-card p-5 relative overflow-hidden">
        <div className="flex items-start justify-between gap-3">
          <div className="space-y-1">
            <span className="text-[11px] font-heading font-bold text-[#FF8F12] uppercase tracking-wider">
              Quadro Comum Europeu (CEFR)
            </span>
            <h2 className="text-xl sm:text-2xl font-heading font-extrabold text-white leading-tight">
              Mapa de Níveis
            </h2>
            <p className="text-xs text-slate-300 leading-relaxed pt-0.5">
              Acompanhe sua trajetória de fluência. Os níveis anteriores foram considerados dominados e o nível <strong className="text-white">C1</strong> está desbloqueado para seus estudos.
            </p>
          </div>

          <div className="w-12 h-12 rounded-2xl shrink-0 clay-badge bg-[#291754] flex items-center justify-center">
            <Layers size={22} className="text-[#FF8F12]" />
          </div>
        </div>
      </div>

      {/* Levels Cards List (Inspired by Duolingo Structure, Claymorphic) */}
      <div className="space-y-3.5">
        {levels.map((lvl) => {
          const isCurrent = lvl.code === currentLevel
          const isCompleted = lvl.status === 'completed'
          const isLocked = lvl.status === 'locked'

          return (
            <div
              key={lvl.code}
              onClick={() => handleCardClick(lvl)}
              className={`p-5 rounded-3xl transition-all duration-200 select-none cursor-pointer ${
                isCurrent
                  ? 'clay-card ring-2 ring-[#FF8F12]/60 hover:scale-[1.01] active:scale-[0.99] shadow-[0_8px_30px_rgba(255,143,18,0.25)]'
                  : isCompleted
                  ? 'clay-card opacity-95 hover:opacity-100 hover:scale-[1.01] active:scale-[0.99]'
                  : isLocked
                  ? 'clay-card opacity-75 hover:opacity-90'
                  : 'clay-card'
              }`}
            >
              {/* Top Row: Level Title + Status Badge */}
              <div className="flex items-center justify-between gap-2">
                <div className="flex items-center gap-2.5">
                  <span className={`w-9 h-9 rounded-xl flex items-center justify-center text-xs font-heading font-extrabold clay-badge ${
                    isCurrent
                      ? 'bg-gradient-to-tr from-[#FF8F12] to-[#FFD333] text-[#1A1202]'
                      : isCompleted
                      ? 'bg-emerald-500/20 text-emerald-300'
                      : 'bg-[#211440] text-slate-400'
                  }`}>
                    {lvl.code}
                  </span>

                  <div>
                    <h3 className="text-base font-heading font-bold text-white leading-tight">
                      {lvl.title}
                    </h3>
                    <p className="text-[11px] text-slate-400 font-medium">
                      {lvl.name}
                    </p>
                  </div>
                </div>

                {/* Right Status Badge */}
                {isCurrent ? (
                  <span className="clay-badge bg-gradient-to-r from-[#FF8F12] to-[#FFD333] text-[#1A1202] text-[11px] font-heading font-extrabold px-3 py-1 flex items-center gap-1 shadow-md">
                    <Sparkles size={12} className="fill-[#1A1202]" />
                    <span>Nível Atual</span>
                  </span>
                ) : isCompleted ? (
                  <span className="clay-badge bg-emerald-500/20 text-emerald-300 text-[11px] font-heading font-bold px-2.5 py-1 flex items-center gap-1">
                    <CheckCircle size={12} />
                    <span>Concluído</span>
                  </span>
                ) : (
                  <span className="clay-badge bg-[#20133D] text-slate-400 text-[11px] font-heading font-bold px-2.5 py-1 flex items-center gap-1">
                    <Lock size={12} />
                    <span>Bloqueado</span>
                  </span>
                )}
              </div>

              {/* Tagline / Subtitle */}
              <p className="text-xs text-slate-300 mt-3 leading-relaxed">
                {lvl.tagline}
              </p>

              {/* Progress Bar (Sunken Clay Well) */}
              <div className="mt-3.5 space-y-1.5">
                <div className="w-full clay-well h-3.5 overflow-hidden p-0.5">
                  <div
                    className={`h-full rounded-full transition-all duration-500 ${
                      isCompleted
                        ? 'bg-gradient-to-r from-[#22C55E] to-[#10B981]'
                        : isCurrent
                        ? 'bg-gradient-to-r from-[#FF8F12] via-[#FFD333] to-[#22C55E]'
                        : 'bg-transparent'
                    }`}
                    style={{
                      width: `${isCompleted ? 100 : isCurrent ? Math.max(3, lvl.percent ?? 0) : 0}%`
                    }}
                  />
                </div>

                {/* Progress Details Footnote */}
                <div className="flex items-center justify-between text-[11px] font-medium text-slate-400 pt-0.5">
                  {isCurrent ? (
                    <>
                      <span>{lvl.passedBlocks ?? 0} de {lvl.totalBlocks} blocos concluídos</span>
                      <span className="font-heading font-bold text-white">{lvl.percent ?? 0}%</span>
                    </>
                  ) : isCompleted ? (
                    <>
                      <span>Nível dominado</span>
                      <span className="font-heading font-bold text-emerald-400">100%</span>
                    </>
                  ) : (
                    <span className="text-amber-400/90 flex items-center gap-1">
                      <Lock size={11} />
                      {lvl.prereqNote}
                    </span>
                  )}
                </div>
              </div>

              {/* Action Button for Active Level */}
              {isCurrent && (
                <button
                  onClick={(e) => {
                    e.stopPropagation()
                    onSelectLevel('C1')
                  }}
                  className="w-full mt-4 clay-btn clay-btn-orange py-3.5 px-4 text-xs font-bold flex items-center justify-center gap-2 shadow-md active:scale-98"
                >
                  <BookOpen size={16} />
                  <span>Continuar Estudando C1</span>
                  <ArrowRight size={14} />
                </button>
              )}
            </div>
          )
        })}
      </div>

      {/* Level Info Modal (when clicking completed or locked levels) */}
      {selectedModalLevel && (
        <div className="fixed inset-0 z-50 bg-black/75 backdrop-blur-sm flex items-center justify-center p-4 animate-in fade-in duration-200">
          <div className="w-full max-w-sm clay-card p-6 relative space-y-4">
            <button
              onClick={() => setSelectedModalLevel(null)}
              className="absolute top-4 right-4 p-2 text-slate-300 hover:text-white rounded-full clay-badge bg-[#241748]"
              aria-label="Close modal"
            >
              <X size={16} />
            </button>

            <div className="space-y-2 pt-1">
              <div className="inline-flex items-center gap-1.5 px-3 py-1 rounded-xl clay-badge bg-[#281854] text-xs font-heading font-bold text-[#FF8F12]">
                <span>{selectedModalLevel.code}</span>
                <span>•</span>
                <span>{selectedModalLevel.name}</span>
              </div>

              <h3 className="text-lg font-heading font-extrabold text-white">
                {selectedModalLevel.title}
              </h3>

              <p className="text-xs text-slate-300 leading-relaxed">
                {selectedModalLevel.description}
              </p>
            </div>

            {selectedModalLevel.status === 'locked' ? (
              <div className="clay-well p-3.5 space-y-2 text-xs">
                <div className="flex items-center gap-2 text-amber-400 font-heading font-bold">
                  <Lock size={15} />
                  <span>Nível em Preparação</span>
                </div>
                <p className="text-slate-300 leading-relaxed">
                  O conteúdo do nível <strong>{selectedModalLevel.code}</strong> será adicionado em breve. Conclua pelo menos <strong>70% dos blocos do nível C1</strong> para desbloqueá-lo automaticamente assim que for lançado!
                </p>
              </div>
            ) : (
              <div className="clay-well p-3.5 space-y-1.5 text-xs">
                <div className="flex items-center gap-2 text-emerald-400 font-heading font-bold">
                  <CheckCircle size={15} />
                  <span>Nível Concluído</span>
                </div>
                <p className="text-slate-300 leading-relaxed">
                  Os blocos fundamentais deste nível foram validados. Seu objetivo ativo atual é dominar o vocabulário do <strong>C1 Avançado</strong>.
                </p>
              </div>
            )}

            <button
              onClick={() => {
                setSelectedModalLevel(null)
                if (selectedModalLevel.code === 'C1') {
                  onSelectLevel('C1')
                }
              }}
              className="w-full py-3 clay-btn clay-btn-purple text-xs font-bold flex items-center justify-center gap-2"
            >
              <span>{selectedModalLevel.code === 'C1' ? 'Ir para C1' : 'Entendido'}</span>
            </button>
          </div>
        </div>
      )}
    </div>
  )
}
