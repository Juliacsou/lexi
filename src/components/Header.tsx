import React from 'react'
import { ChevronLeft, Flame, RefreshCw } from 'lucide-react'
import type { User } from '@supabase/supabase-js'

interface HeaderProps {
  title?: string
  subtitle?: string
  showBack?: boolean
  onBack?: () => void
  streak?: number
  onResetDemo?: () => void
  user?: User | null
  onOpenAuth?: () => void
}

export const Header: React.FC<HeaderProps> = ({
  title,
  subtitle,
  showBack = false,
  onBack,
  streak = 3,
  onResetDemo,
  user,
  onOpenAuth
}) => {
  const avatarUrl = user?.user_metadata?.avatar_url || user?.user_metadata?.picture

  return (
    <header className="sticky top-0 z-30 bg-[#160E33]/95 backdrop-blur-md border-b border-[#2B1B54] px-4 py-3 flex items-center justify-between">
      <div className="flex items-center gap-2">
        {showBack && onBack ? (
          <button
            onClick={onBack}
            className="p-2 -ml-1 text-slate-300 hover:text-white rounded-xl bg-[#241748] active:scale-95 transition-all"
            aria-label="Go back"
          >
            <ChevronLeft size={22} />
          </button>
        ) : (
          <div className="flex items-center gap-2">
            <img
              src="./assets/Logo_V2_Simplificada_Aprovada.png"
              alt="Lexi Fox"
              className="w-10 h-10 object-contain drop-shadow"
            />
            <div>
              <div className="flex items-center gap-1.5">
                <span className="font-heading font-bold text-lg text-white leading-tight">Lexi</span>
                <span className="bg-[#6732D8] text-white text-[11px] font-heading font-bold px-2 py-0.5 rounded-full uppercase tracking-wider">
                  C1
                </span>
              </div>
              <p className="text-[11px] text-[#FFF0DA]/80 font-medium">Mais palavras. Mais confiança.</p>
            </div>
          </div>
        )}

        {showBack && (
          <div>
            <h1 className="text-base font-heading font-bold text-white leading-tight">{title}</h1>
            {subtitle && <p className="text-xs text-slate-400">{subtitle}</p>}
          </div>
        )}
      </div>

      <div className="flex items-center gap-2">
        {onResetDemo && (
          <button
            onClick={onResetDemo}
            title="Reset progress to test again"
            className="p-1.5 text-slate-400 hover:text-white rounded-xl bg-[#241748] active:scale-95 transition-all"
          >
            <RefreshCw size={15} />
          </button>
        )}

        {/* Streak Badge */}
        <div className="flex items-center gap-1 bg-[#241748] border border-[#38236E] px-2.5 py-1 rounded-full text-xs font-heading font-bold text-[#FF8F12]">
          <Flame size={16} className="fill-[#FF8F12]" />
          <span>{streak}d</span>
        </div>

        {/* User / Google Profile Button */}
        {onOpenAuth && (
          user ? (
            <button
              onClick={onOpenAuth}
              className="p-1 rounded-full bg-[#241748] border-2 border-[#FF8F12] hover:scale-105 active:scale-95 transition-all overflow-hidden shadow-md"
              title="User Profile"
            >
              {avatarUrl ? (
                <img
                  src={avatarUrl}
                  alt="Profile"
                  className="w-7 h-7 rounded-full object-cover"
                />
              ) : (
                <div className="w-7 h-7 rounded-full bg-[#6732D8] text-white flex items-center justify-center text-xs font-heading font-bold">
                  {user.email ? user.email[0].toUpperCase() : 'U'}
                </div>
              )}
            </button>
          ) : (
            <button
              onClick={onOpenAuth}
              className="flex items-center gap-1.5 bg-white hover:bg-slate-100 text-slate-900 font-heading font-bold text-xs px-2.5 py-1.5 rounded-xl shadow-md border-b-2 border-slate-300 active:scale-95 transition-all"
              title="Sign in with Google"
            >
              <svg className="w-3.5 h-3.5 shrink-0" viewBox="0 0 24 24">
                <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.06H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.94l2.85-2.22.81-.63z"/>
                <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.06l3.66 2.84c.87-2.6 3.3-4.52 6.16-4.52z"/>
              </svg>
              <span>Entrar</span>
            </button>
          )
        )}
      </div>
    </header>
  )
}
