import { supabase, isSupabaseConfigured } from '../lib/supabase'
import type { User } from '@supabase/supabase-js'

class AuthService {
  async signInWithGoogle() {
    if (!isSupabaseConfigured) {
      console.warn('Supabase anon key is not yet configured. Please provide VITE_SUPABASE_ANON_KEY.')
      alert('To enable Google Login, configure the Supabase Anon Key and enable Google Provider in the Supabase Dashboard.')
      return
    }

    const redirectUrl = window.location.origin + window.location.pathname

    const { error } = await supabase.auth.signInWithOAuth({
      provider: 'google',
      options: {
        redirectTo: redirectUrl,
        queryParams: {
          access_type: 'offline',
          prompt: 'consent',
        }
      }
    })

    if (error) {
      console.error('Error signing in with Google:', error.message)
      throw error
    }
  }

  async signOut() {
    if (!isSupabaseConfigured) return
    const { error } = await supabase.auth.signOut()
    if (error) {
      console.error('Error signing out:', error.message)
      throw error
    }
  }

  async getUser(): Promise<User | null> {
    if (!isSupabaseConfigured) return null
    try {
      const { data: { user } } = await supabase.auth.getUser()
      return user
    } catch {
      return null
    }
  }

  onAuthStateChange(callback: (user: User | null) => void) {
    if (!isSupabaseConfigured) return () => {}

    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      callback(session?.user || null)
    })

    return () => subscription.unsubscribe()
  }
}

export const authService = new AuthService()
