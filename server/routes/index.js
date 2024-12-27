const Router = require('express');
const usersRouter = require('./userRouter');
const postRouter = require('./postRouter');


const router = new Router();

router.use('/users', usersRouter);
router.use('/post', postRouter);


module.exports = router;