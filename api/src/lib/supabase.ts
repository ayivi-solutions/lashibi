import { createClient } from "@supabase/supabase-js";

// This client only ever verifies credentials against Supabase Auth
// (auth.users). It is not the source of API session state — see
// lib/session.ts for the JWT the API itself issues after verification.
export const supabaseAuth = createClient(
  process.env.SUPABASE_URL as string,
  process.env.SUPABASE_ANON_KEY as string
);
