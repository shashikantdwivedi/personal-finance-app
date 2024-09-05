import {
  HttpException,
  HttpStatus,
  Injectable,
  NestMiddleware,
} from '@nestjs/common';
import { AppConfig } from 'apps/core/src/config';
import { Request, Response, NextFunction } from 'express';
import { verify } from 'jsonwebtoken';
import { ReqId } from 'pino-http';

@Injectable()
export class AuthMiddleware implements NestMiddleware {
  async use(req: Request, res: Response, next: NextFunction) {
    const token = req.headers['authorization'];
    if (!token) {
      throw new HttpException(
        {
          status: false,
          message: 'Unauthorized access denied',
        },
        HttpStatus.UNAUTHORIZED,
      );
    }
    verify(
      token.replace('Bearer', '').trim(),
      AppConfig.instance.config.JWT_PRIVATE_KEY,
      (err: any, decoded: { _id: ReqId }) => {
        console.log(decoded);
        console.log(err);
        if (err) {
          throw new HttpException(
            {
              status: false,
              message: 'Unauthorized access denied',
            },
            HttpStatus.UNAUTHORIZED,
          );
        } else {
          req.id = decoded._id;
        }
      },
    );
    next();
  }
}
