import express, { Request, Response, NextFunction } from 'express';
import { errorHandler } from '../error';
import passport from 'passport';

import '../passport-strategies/passport';
import authorizationChecker from '../middleware/authorization-checker';

const router = express.Router();

// Passport authentication
router.use(passport.initialize());

router.use(express.json());

router.use('/auth', require('./auth'));
// router.use('/services', passport.authenticate('jwt', { session: false }), require('./services'));
router.use('/services', authorizationChecker, require('./services'));
router.use('/customers', authorizationChecker, require('./customers'));
router.use('/materials', authorizationChecker, require('./materials'));

// Error Handler Middleware
router.use(async (err: Error, req: Request, res: Response, next: NextFunction) => {
  if (!errorHandler.isTrustedError(err)) {
    next(err);
  }
  await errorHandler.handleError(err, res);
});

module.exports = router;
