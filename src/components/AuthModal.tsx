import React from 'react'
import { X, LogOut, CheckCircle, Shield, Sparkles } from 'lucide-react'
import type { User } from '@supabase/supabase-js'
import { authService } from '../services/authService'

interface AuthModalProps {
  isOpen: boolean
  onClose: () => void
  user: User | null
  streak: number
}

export const AuthModal: React.FC<AuthModalProps> = ({
  isOpen,
  onClose,
  user,
  streak
}) => {
  if (!isOpen) return null

  const handleGoogleLogin = async () => {
    try {
      await authService.signInWithGoogle()
    } catch (err: unknown) {
      const errorMsg = err instanceof Error ? err.message : String(err)
      alert(`Could not sign in with Google: ${errorMsg}`)
    }
  }

  const handleLogout = async () => {
    await authService.signOut()
    onClose()
  }

  const avatarUrl = user?.user_metadata?.avatar_url || user?.user_metadata?.picture
  const fullName = user?.user_metadata?.full_name || user?.user_metadata?.name || user?.email?.split('@')[0]

  return (
    <div className="fixed inset-0 z-50 bg-black/75 backdrop-blur-sm flex items-center justify-center p-4 animate-in fade-in duration-200">
      <div className="w-full max-w-sm clay-card p-6 relative space-y-5">
        {/* Close Button */}
        <button
          onClick={onClose}
          className="absolute top-4 right-4 p-2 text-slate-300 hover:text-white rounded-full clay-badge bg-[#281A54] transition-all"
        >
          <X size={18} />
        </button>

        {user ? (
          /* LOGGED IN USER PROFILE */
          <div className="space-y-5 pt-2 text-center">
            <div className="relative inline-block">
              {avatarUrl ? (
                <img
                  src={avatarUrl}
                  alt={fullName || 'User'}
                  className="w-20 h-20 rounded-full mx-auto clay-badge object-cover"
                />
              ) : (
                <div className="w-20 h-20 rounded-full mx-auto clay-badge bg-gradient-to-tr from-[#6732D8] to-[#FF8F12] flex items-center justify-center text-2xl font-heading font-bold text-white">
                  {fullName ? fullName[0].toUpperCase() : 'U'}
                </div>
              )}
              <div className="absolute -bottom-1 -right-1 bg-emerald-500 text-white p-1 rounded-full clay-badge">
                <CheckCircle size={14} />
              </div>
            </div>

            <div>
              <h3 className="text-xl font-heading font-extrabold text-white leading-tight">
                {fullName}
              </h3>
              <p className="text-xs text-slate-400 mt-0.5">{user.email}</p>
            </div>

            <div className="clay-well p-3.5 rounded-2xl grid grid-cols-2 gap-2 text-center text-xs">
              <div>
                <span className="text-slate-400">Current Level</span>
                <p className="font-heading font-bold text-white text-sm mt-0.5">C1 Advanced</p>
              </div>
              <div>
                <span className="text-slate-400">Study Streak</span>
                <p className="font-heading font-bold text-[#FF8F12] text-sm mt-0.5">🔥 {streak} days</p>
              </div>
            </div>

            <div className="flex items-center gap-1.5 justify-center text-[11px] text-emerald-400 clay-badge bg-emerald-500/15 py-1.5 px-3">
              <Shield size={13} />
              <span>Progress safely synced to Supabase Cloud</span>
            </div>

            <button
              onClick={handleLogout}
              className="w-full py-3.5 rounded-2xl clay-btn clay-btn-dark text-xs font-bold text-rose-300 hover:text-white flex items-center justify-center gap-2"
            >
              <LogOut size={16} />
              <span>Sign Out</span>
            </button>
          </div>
        ) : (
          /* GUEST / SIGN IN WITH GOOGLE */
          <div className="space-y-5 pt-2 text-center">
            <div className="w-16 h-16 rounded-3xl clay-badge bg-gradient-to-tr from-[#6732D8] to-[#FF8F12] mx-auto flex items-center justify-center">
              <img
                src="./assets/Logo_V2_Simplificada_Aprovada.png"
                alt="Lexi Mascot"
                className="w-12 h-12 object-contain drop-shadow"
              />
            </div>

            <div>
              <div className="inline-flex items-center gap-1 clay-badge bg-[#FFD333]/15 text-[#FFD333] text-[11px] font-heading font-bold px-3 py-1 mb-1">
                <Sparkles size={12} />
                <span>Cloud Sync</span>
              </div>
              <h3 className="text-2xl font-heading font-extrabold text-white">
                Save Your Progress
              </h3>
              <p className="text-xs text-slate-300 mt-1.5 leading-relaxed">
                Sign in with Google to synchronize your mastered blocks, streak, and certificates across mobile and desktop.
              </p>
            </div>

            {/* Google Sign In Button */}
            <button
              onClick={handleGoogleLogin}
              className="w-full py-3.5 px-4 rounded-2xl clay-btn clay-btn-white text-sm font-bold flex items-center justify-center gap-3"
            >
              {/* Google Official G SVG */}
              <svg className="w-5 h-5" viewBox="0 0 24 24">
                <path
                  fill="#4285F4"
                  d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"
                />
                <path
                  fill="#34A853"
                  d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"
                />
                <path
                  fill="#FBBC05"
                  d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.06H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.94l2.85-2.22.81-.63z"
                />
                <path
                  fill="#EA4335"
                  d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.06l3.66 2.84c.87-2.6 3.3-4.52 6.16-4.52z"
                />
              </svg>
              <span>Continue with Google</span>
            </button>

            <p className="text-[11px] text-slate-400 italic">
              100% free • No passwords to remember
            </p>
          </div>
        )}
      </div>
    </div>
  )
}
