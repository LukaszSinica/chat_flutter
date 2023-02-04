import { Request, Response, NextFunction } from 'express';
import axios, { AxiosResponse } from 'axios';
import { Connect, Query } from '../../config/mysql';
import { body, validationResult } from 'express-validator';

const NAMESPACE = "users";

const getAllUsers = (req: Request, res: Response, next: NextFunction) => {
    console.log("getting all users");
    let query = 'SELECT * from users';

    Connect().then(connection => {
        Query(connection, query).then(results => {
            console.log('works :D');
        }).catch(error => {
            console.log('error 1');
        });
    }).catch(error => {
        console.log('error 2');
    });
};

const createUser = (req: Request, res: Response) => {

    const {login, password, email} = req.body;
    const errors = validationResult(req);
    let query = "INSERT INTO users(login, password, email) VALUES ('"+login+"','"+password+"','"+email+"')";
    try {
        validationResult(req).throw();
        Connect().then(connection => {
            Query(connection, query).then(results => {
            console.log('user created');
            }).catch(error => {
            console.log(error);
            })
        }).catch(error => {
            console.log('error 2');
        });
    } catch (err) {
        res.status(400).json(errors);
    }
    return 0;
};

export default { getAllUsers, createUser };