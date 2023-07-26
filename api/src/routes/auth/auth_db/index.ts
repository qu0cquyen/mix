import { DbConnector } from '../../../db';
import { User } from 'models/user';

export const getUserFromDb = async (user_name: string) => {
  const collection = await DbConnector.getInstance().Connector.collection<User>('users');

  const result = collection.findOne({ user_name: user_name });

  return result;
};
