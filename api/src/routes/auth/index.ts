import express from 'express';

import { getUserController } from './controller/get_user_controller';

const router = express.Router();

router.post('/', getUserController);

module.exports = router;
