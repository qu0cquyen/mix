import { NextFunction, Request, Response } from 'express';
import { getUserFromDb } from '../auth_db';
import { APIError, HttpStatusCode } from '../../../error';
import jwt from 'jsonwebtoken';
import { randomUUID } from 'crypto';

export const getUserController = async (req: Request, res: Response, next: NextFunction) => {
  const { user_name, password } = req.body;

  if (!user_name) {
    next(new APIError('Bad Request', HttpStatusCode.BAD_REQUEST, true, 'user_name is required'));
    return;
  }

  if (!password) {
    next(new APIError('Bad Request', HttpStatusCode.BAD_REQUEST, true, 'password is required'));
    return;
  }

  const userFromDb = await getUserFromDb(user_name);

  if (!userFromDb) {
    next(new APIError('Bad Request', HttpStatusCode.BAD_REQUEST, true, 'username or password is incorrect'));
    return;
  }

  if (userFromDb.user_name !== user_name) {
    next(new APIError('Bad Request', HttpStatusCode.BAD_REQUEST, true, 'username or password is incorrect'));
    return;
  }

  if (userFromDb?.password !== password) {
    next(new APIError('Bad Request', HttpStatusCode.BAD_REQUEST, true, 'username or password is incorrect'));
    return;
  }

  const token = jwt.sign({ _id: userFromDb._id.toString(), name: userFromDb.name }, process.env.JWT_SECRECT as string, {
    expiresIn: process.env.JWT_EXPIRATION,
  });
  const refreshToken = randomUUID();

  return res.status(200).send({
    user: {
      _id: userFromDb._id.toString(),
      name: userFromDb.name,
      address: userFromDb.address,
      status: userFromDb.status,
      services_provided: userFromDb.services_provided,
    },
    token: token,
    refreshToken: refreshToken,
  });
};
