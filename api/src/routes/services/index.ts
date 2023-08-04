import { APIError, HttpStatusCode } from '../../error';
import express, { NextFunction, Request, Response } from 'express';
import { supabaseConnector } from '../../supabase-config/supabase';

const router = express.Router();

router.get('/', async (req: Request, res: Response, next: NextFunction) => {
  const { authorization } = req.headers;

  const { data, error } = await supabaseConnector(authorization).from('services').select();

  if (error) {
    next(new APIError('Internal Error', HttpStatusCode.INTERNAL_SERVER, true, 'Internal Error'));
    return;
  }

  return res.status(200).json(data);
});

// router.get('/', async (req, res, next) => {
//   return res.status(200).json({ status: 200, message: 'OK' });
//   //   return res.status(200).send('Message');
// });

// router.get('/', async (req, res, next) => {
//   passport.authenticate('jwt', { session: false }, function (err: any, user: any, info: any, status: number) {
//     console.log(err);
//     console.log(user);
//     console.log(typeof info);
//     console.log(status);
//     if (err) {
//       //   return next(err);
//       return next(new APIError('Internal Error', HttpStatusCode.INTERNAL_SERVER, true, 'Internal Error'));
//     }

//     if (!user && info) {
//       return res.status(401).json({ status: HttpStatusCode.UNAUTHORIZED, message: 'Res - Unauthorized' });
//     }

//     return res.status(200).json({ status: 200, message: 'OK' });
//   })(req, res, next);
// });

module.exports = router;
