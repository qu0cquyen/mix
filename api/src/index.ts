import express, { Express, Request, Response, NextFunction } from 'express';
import cors from 'cors'; 
import helmet from 'helmet'; 
import bodyParser from 'body-parser';
import { errorHandler } from './error';
import mongoose from 'mongoose';
import * as dotenv from 'dotenv';
const app: Express = express(); 

// Parse Json
// app.use(express.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

// CORS
app.use(cors());

// Use Helment to set standard security
app.use(helmet());

dotenv.config();


async function run() {
    await mongoose.connect(process.env.MONGO_DB_URI as string);
    console.log('Connected DB');
}

run(); 

// Routes definition
app.use('/', require('./routes'));



// Error Handler Middleware 
app.use(async (err: Error, req: Request, res: Response, next: NextFunction) => {
    if(!errorHandler.isTrustedError(err)){
        next(err); 
    }
    await errorHandler.handleError(err); 
});

const PORT = process.env.PORT || 8080;

app.listen(PORT, () => {
    console.log(`Server is running on port: ${PORT}`); 
});