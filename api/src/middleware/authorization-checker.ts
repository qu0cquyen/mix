import { APIError, HttpStatusCode } from '../error';
import { NextFunction, Request, Response } from 'express';

const authorizationChecker = async (req: Request, res: Response, next: NextFunction) => {
  const { authorization } = req.headers;

  if (!authorization) {
    next(new APIError('Unauthorization', HttpStatusCode.UNAUTHORIZED, true, 'Unauthorization'));
    return;
  }

  next();
};

export default authorizationChecker;
