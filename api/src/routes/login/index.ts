import express from 'express';

const router = express.Router(); 

interface User{
    username: string; 
    password: string;
}

router.post('/', (req, res) => {
    const body = req.body as User; 
    return res.status(200).send(body);
});

module.exports = router; 