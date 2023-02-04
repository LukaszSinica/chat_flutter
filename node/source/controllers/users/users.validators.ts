import { check } from 'express-validator';
import { Request } from 'express';

const checkRepeatedPassword = check('password').custom((value, { req }) => {
    console.log(value);
    console.log(req.body.repeatedPassword);
    if (req.body.repeatedPassword !== value) {
        throw new Error('Password confirmation is incorrect');
    } else {
        throw new Error('wtf is goin on');
    }
});

export default { checkRepeatedPassword }