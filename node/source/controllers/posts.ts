/** source/controllers/posts.ts */
import { Request, Response, NextFunction } from 'express';
import axios, { AxiosResponse } from 'axios';
import { Connect, Query } from '../config/mysql';

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

export default { getAllUsers };