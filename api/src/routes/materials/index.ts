import { APIError, HttpStatusCode } from '../../error';
import express, { NextFunction, Request, Response } from 'express';
import { supabaseConnector } from '../../supabase-config/supabase';

const router = express.Router();

router.get('/', async (req: Request, res: Response, next: NextFunction) => {
  const { authorization } = req.headers;

  const { data, error } = await supabaseConnector(authorization).from('materials').select();

  if (error) {
    return next(new APIError('Internal Error', HttpStatusCode.INTERNAL_SERVER, true, 'Internal Error'));
  }

  return res.status(200).json(data);
});

module.exports = router;