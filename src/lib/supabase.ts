import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL || 'https://jeijmbezltxwqjzfzqyx.supabase.co'
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImplaWptYmV6bHR4d3FqemZ6cXl4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTQxMDEwODAsImV4cCI6MjEwOTY3NzA4MH0.N3KIkw-G4klQ7R3rxdFLjrCJpkOmR1jK18m2cVzElBI'

export const isSupabaseConfigured = Boolean(supabaseUrl && supabaseAnonKey && supabaseAnonKey !== 'YOUR_ANON_KEY')

export const supabase = createClient(
  supabaseUrl,
  supabaseAnonKey,
  {
    auth: {
      persistSession: true,
      autoRefreshToken: true,
      detectSessionInUrl: true,
    }
  }
)
