import React from 'react'
import { ChevronLeft, Flame, RefreshCw, User as UserIcon } from 'lucide-react'
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
          <button
            onClick={onOpenAuth}
            className="p-1 rounded-full bg-[#241748] border border-[#38236E] hover:border-[#FF8F12] active:scale-95 transition-all overflow-hidden"
            title={user ? 'User Profile' : 'Sign in with Google'}
          >
            {avatarUrl ? (
              <img
                src={avatarUrl}
                alt="Profile"
                className="w-7 h-7 rounded-full object-cover"
              />
            ) : user ? (
              <div className="w-7 h-7 rounded-full bg-[#6732D8] text-white flex items-center justify-center text-xs font-heading font-bold">
                {user.email ? user.email[0].toUpperCase() : 'U'}
              </div>
            ) : (
              <div className="w-7 h-7 rounded-full bg-[#20133F] text-slate-300 flex items-center justify-center">
                <UserIcon size={16} />
              </div>
            )}
          </button>
        )}
      </div>
    </header>
  )
}
