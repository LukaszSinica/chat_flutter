/** source/routes/posts.ts */
import express from 'express';
import controller from '../controllers/posts';
const router = express.Router();

router.get('/user/getUsers', controller.getAllUsers);
router.post('/user/createUser', controller.createUser);

export = router;