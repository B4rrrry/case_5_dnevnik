const Router = require('express');
const postController = require('../controllers/postController');
const AuthMiddleware = require('../middleware/AuthMiddleware');

const router = new Router();

router.post('/create', postController.create);
router.get('/', postController.getAll);
router.get('/:id', postController.getOne);
/* router.post('/login', userController.login);
router.get('/auth', AuthMiddleware, userController.check);
router.get('/:id', userController.getOne);
router.get('/', userController.getAll);
 */





module.exports = router;