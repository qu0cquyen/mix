import express from 'express';

import { getUserController } from './controller/get_user_controller';
import { userSignUp } from './controller/user_sign_up';
import { userSignIn } from './controller/user_sign_in';

const router = express.Router();

// router.post('/', getUserController);
router.post('/', userSignIn);
router.post('/signup', userSignUp);

module.exports = router;
