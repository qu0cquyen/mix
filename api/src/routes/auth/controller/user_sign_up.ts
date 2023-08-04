import { APIError, HttpStatusCode } from '../../../error';
import { NextFunction, Request, Response } from 'express';

export const userSignUp = async (req: Request, res: Response, next: NextFunction) => {
  const { email, password } = req.body;

  if (!email) {
    next(new APIError('Bad Request', HttpStatusCode.BAD_REQUEST, true, 'email is required'));
    return;
  }

  if (!password) {
    next(new APIError('Bad Request', HttpStatusCode.BAD_REQUEST, true, 'password is required'));
    return;
  }
};
