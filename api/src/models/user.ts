import { ObjectId } from 'mongodb';

export interface User {
  _id: ObjectId;
  user_name: string;
  password: string;
  status: string;
  name: string;
  address: string;
  services_provided: string[];
}
