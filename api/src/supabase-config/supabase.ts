import { createClient } from '@supabase/supabase-js';

export const supabaseConnector = (token?: string) => {
  return createClient(process.env.SUPABASE_URL!, process.env.SUPABASE_APIKEY!, {
    global: {
      headers: {
        Authorization: token ?? '',
      },
    },
    auth: {
      persistSession: false,
      autoRefreshToken: false,
    },
  });
};
