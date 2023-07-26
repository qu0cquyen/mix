/* Operational Error:
   Represent runtime problems whose results are expected and should be dealt
   with in a proper way. Operational errors don't mean the application itself has bugs
   but developers need to handle them thoughtfully. Examples of operational errors
   include "out of memory", "an invalid input for an API endpoint", and so on..
*/

import { NextFunction, Response } from 'express';

class BaseError extends Error {
  public readonly name: string;
  public readonly httpCode: HttpStatusCode;
  public readonly isOperational: boolean;

  constructor(name: string, httpCode: HttpStatusCode, description: string, isOperational: boolean) {
    super(description);
    Object.setPrototypeOf(this, new.target.prototype);

    this.name = name;
    this.httpCode = httpCode;
    this.isOperational = isOperational;

    Error.captureStackTrace(this);
  }
}

export class APIError extends BaseError {
  constructor(
    name: string,
    httpCode = HttpStatusCode.INTERNAL_SERVER,
    isOperational = true,
    description = 'Internal Server Error'
  ) {
    super(name, httpCode, description, isOperational);
  }
}

class ErrorHandler {
  public async handleError(err: Error | APIError, response?: Response, next?: NextFunction): Promise<void> {
    if (process.env.NODE_ENV === 'DEV') {
      console.log(err);
    }

    if (this.isTrustedError(err)) {
      response?.status((err as APIError).httpCode).send({ status: (err as APIError).httpCode, message: err.message });
    }
    if (!this.isTrustedError(err) && response) {
      response
        .status(HttpStatusCode.INTERNAL_SERVER)
        .send({ status: HttpStatusCode.INTERNAL_SERVER, message: 'Internal Server Error' });
      process.exit(1);
    }
    // Log error
    // Send error to admin
    // await sendMailToAdminIfCritical()
    // Send error to Entry
    // await sendEventsToEntry()
  }

  public isTrustedError(error: Error) {
    if (error instanceof BaseError) {
      return error.isOperational;
    }

    return false;
  }
}

export enum HttpStatusCode {
  OK = 200,
  BAD_REQUEST = 400,
  UNAUTHORIZED = 401,
  PERMISSION_DENIED = 403,
  NOT_FOUND = 404,
  INTERNAL_SERVER = 500,
}
export const errorHandler = new ErrorHandler();

/* Programmer Error
   Represent unexpected bugs in poorly written code. They mean the
   code itself has some issues to solve and was coded wrong. A good
   example is to try to read a property of "undefined". To fix the
   issue, the code has to be changed. That is a bug developer made, 
   not an operational error. 
*/

/*
    Handle Programmer Errors
    The best way to deal with these errors is to crash immediately
    and restart gracefully with an automatic restarter like PM2
    The reason being that programmer errors are unexpected, as 
    they are actual bugs that might cause the application to end up
    in a wrong state and behave in an unpexted way
*/
process.on('uncaughtException', (error: Error) => {
  console.log('Uncaught Exception activated');
  errorHandler.handleError(error);

  if (!errorHandler.isTrustedError(error)) {
    process.exit(1);
  }
});

/*
    Dealing with unhandled promise rejections and execeptions
*/
process.on('unhandledRejection', (reason: Error, promise: Promise<any>) => {
  throw reason;
});

/*
    Example of using Error: 
    User.getUserById(1).then((firstUser) => {
        if(firstUser.isSleeping === false) throw new Error('He is not sleeping');
    })
*/
