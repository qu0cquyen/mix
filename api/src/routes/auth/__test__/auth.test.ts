import { MongoMemoryServer } from 'mongodb-memory-server';
import mongoose from 'mongoose';
import supertest from 'supertest';
import app from '../../../index';
import { User } from 'models/user';
import { ObjectId } from 'mongodb';
import { CustomJWTPayload } from 'models/jwt-payload';

const mongod = MongoMemoryServer.create();

export const connect = async () => {
  const uri = await (await mongod).getUri();
  await mongoose.connect(uri);
};

export const closeDatabase = async () => {
  await mongoose.connection.dropDatabase();
  await mongoose.connection.close();
  await (await mongod).stop();
};

export const clearDatabase = async () => {
  const collections = mongoose.connection.collections;
  for (const key in collections) {
    const collection = collections[key];
    await collection.deleteMany({});
  }
};

let request: supertest.SuperTest<supertest.Test>;

const mockUser: User = {
  _id: new ObjectId(123),
  user_name: 'mockUser',
  password: 'mockPassword',
  status: 'active',
  name: 'Fake User',
  address: 'Fake Address',
  services_provided: ['Fake Industry'],
};

const dbSpy = jest.spyOn(require('../auth_db'), 'getUserFromDb');

describe('Test request with mongoose', () => {
  beforeAll(async () => {
    request = supertest(await app);
    await connect();
  });

  beforeEach(async () => {
    await dbSpy.mockImplementation(() => mockUser);
  });

  afterEach(async () => {
    await clearDatabase();
  });

  afterAll(async () => {
    await closeDatabase();
  });

  test('POST - /auth - Require user name', async () => {
    const res = await request.post('/auth').send();

    expect(res.statusCode).toBe(400);
    expect(res.body).toEqual({ status: 400, message: 'user_name is required' });
  });

  test('POST - /auth - Require password', async () => {
    const res = await request.post('/auth').send({ user_name: mockUser.user_name });

    expect(res.statusCode).toBe(400);
    expect(res.body).toEqual({ status: 400, message: 'password is required' });
  });

  test('POST - /auth - Non-exist user name', async () => {
    const res = await request
      .post('/auth ')
      .send({ user_name: mockUser.user_name + 'ASDASDSAD', password: mockUser.password });

    expect(res.statusCode).toBe(400);
    expect(res.body).toEqual({ status: 400, message: 'username or password is incorrect' });
  });

  test('POST - /auth - Password is incorrect', async () => {
    const res = await request
      .post('/auth')
      .send({ user_name: mockUser.user_name, password: mockUser.password + 'ASDASD' });

    expect(res.statusCode).toBe(400);
    expect(res.body).toEqual({ status: 400, message: 'username or password is incorrect' });
  });

  test('POST - /auth', async () => {
    const res = await request.post('/auth').send({
      user_name: mockUser.user_name,
      password: mockUser.password,
    });

    const body = res.body as { user: User; token: CustomJWTPayload };

    expect(res.statusCode).toBe(200);
    expect(body.user._id).toEqual(mockUser._id.toString());
  });
});
