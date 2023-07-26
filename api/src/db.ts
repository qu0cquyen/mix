import { Db, MongoClient } from 'mongodb';
import { errorHandler } from './error';

/**
 * Singleton class for establishing and accessing MongoDB connection
 */
export class DbConnector {
  private static instance: DbConnector;
  private connector: Db | null | undefined;

  /**
   * Private constructor to prevent direct construction calls
   * with the `new` operator
   */
  private constructor() {}

  /**
   * Static method that controls access to the singleton instance
   * @returns The singleton instance of `DbConnector`
   */
  public static getInstance(): DbConnector {
    if (!DbConnector.instance) {
      DbConnector.instance = new DbConnector();
    }

    return DbConnector.instance;
  }

  /**
   * Getter for the MongoDB connection.
   * @returns MongoDB connection
   * @throws {Error} If no connection is established
   */
  public get Connector(): Db {
    if (!this.connector) {
      throw Error('Unable to connect to Database');
    }
    return this.connector;
  }

  /**
   * Connects to the MongoDB server and initializes the connection.
   * @throws {Error} If connection is unable to connect
   */
  public async connect() {
    const client = new MongoClient(process.env.MONGO_DB_URI as string);

    try {
      const conn = await client.connect();
      this.connector = conn.db(process.env.MONGO_DB_NAME);
    } catch (error) {
      if (error instanceof Error) {
        errorHandler.handleError(error);
      }

      console.log(typeof error);
      console.log(error);

      throw error;
    }
  }
}
