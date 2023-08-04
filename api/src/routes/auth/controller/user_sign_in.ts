import { APIError, HttpStatusCode } from '../../../error';
import { NextFunction, Request, Response } from 'express';
import { supabaseConnector } from '../../../supabase-config/supabase';
export const userSignIn = async (req: Request, res: Response, next: NextFunction) => {
  const { email, password } = req.body;

  if (!email) {
    next(new APIError('Bad Request', HttpStatusCode.BAD_REQUEST, true, 'email is required'));
    return;
  }

  if (!password) {
    next(new APIError('Bad Request', HttpStatusCode.BAD_REQUEST, true, 'password is required'));
    return;
  }

  //   const { data, error } = await SupabaseConnector.getInstance.auth.signInWithPassword({
  //     email: email,
  //     password: password,
  //   });
  const { data, error } = await supabaseConnector().auth.signInWithPassword({
    email: email,
    password: password,
  });

  if (error) {
    next(new APIError(error.name, error.status, true, error.message));
    return;
  }

  return res.status(200).json(data);
};
