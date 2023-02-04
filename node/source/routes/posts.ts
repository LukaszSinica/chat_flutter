/** source/routes/posts.ts */
import express from 'express';
import controllers from '../controllers/users/users.controller';
import validators from '../controllers/users/users.validators';
const router = express.Router();

router.get('/user/getUsers', controllers.getAllUsers);
router.post('/user/createUser', validators.checkRepeatedPassword, controllers.createUser);

export = router;