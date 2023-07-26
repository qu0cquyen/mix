import passport from 'passport';
import * as passportJwt from 'passport-jwt';
import { DbConnector } from '../db';
import { User } from 'models/user';
import { CustomJWTPayload } from 'models/jwt-payload';
import { ObjectId } from 'mongodb';

const JWTStrategy = passportJwt.Strategy;
const ExtractJWT = passportJwt.ExtractJwt;

passport.use(
  new JWTStrategy(
    {
      jwtFromRequest: ExtractJWT.fromAuthHeaderAsBearerToken(),
      secretOrKey: process.env.JWT_SECRECT,
    },
    async (jwtPayload: CustomJWTPayload, done: any) => {
      const connector = DbConnector.getInstance().Connector.collection<User>('users');
      const user = await connector?.findOne({ _id: new ObjectId(jwtPayload._id) });

      if (user) {
        return done(null, user);
      }

      return done(null, false);
    }
  )
);
