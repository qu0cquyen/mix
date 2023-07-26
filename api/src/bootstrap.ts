import cors from 'cors';
import express, { Express, Request, Response, NextFunction } from 'express';
import helmet from 'helmet';
import * as dotenv from 'dotenv';
import { DbConnector } from './db';

export default async function expressBoot() {
  dotenv.config();

  const app: Express = express();

  // Db Connection
  if (process.env.NODE_ENV === 'DEV' || process.env.NODE_ENV === 'PROD') {
    const dbConnector = DbConnector.getInstance();
    await dbConnector.connect();
  }

  // Parse Json
  app.use(express.urlencoded({ extended: true }));
  app.use(express.json());

  // Cors
  app.use(cors());

  // Use Helmet to standard security
  app.use(helmet());

  // Routes definition
  app.use('/', require('./routes'));

  // PORT
  const PORT = process.env.PORT || 8080;

  return app.listen(PORT, () => {
    console.log(`Server is running on port: ${PORT}`);
  });
}
