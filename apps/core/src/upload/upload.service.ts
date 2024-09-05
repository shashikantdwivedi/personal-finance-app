import {
  HttpException,
  HttpStatus,
  Injectable,
  UploadedFiles,
} from '@nestjs/common';
import { v4 as uuidv4 } from 'uuid';
import { buffer2webpbuffer } from 'webp-converter';
import * as aws from 'aws-sdk';
import { AppConfig } from '../config';

@Injectable()
export class UploadService {
  constructor() {
    aws.config.update({
      secretAccessKey: AppConfig.instance.config.AWS_SECRET_KEY,
      accessKeyId: AppConfig.instance.config.AWS_ACCESS_KEY,
      region: AppConfig.instance.config.AWS_REGION,
    });
  }

  async uploadImages(
    @UploadedFiles()
    files: Array<Express.Multer.File>,
  ) {
    console.log('HERE');
    console.log(files);
    const s3 = new aws.S3();
    const urls = [];
    for (const file of files) {
      console.log(file);
      console.log(file.mimetype);
      if (
        file.mimetype.includes('image/') ||
        ['png', 'jpg', 'jpeg'].includes(
          file.originalname.split('.')[file.originalname.split('.').length - 1],
        )
      ) {
        const uuid = uuidv4();
        const fileName = `${uuid}.webp`;
        const _file = await buffer2webpbuffer(
          file.buffer,
          file.originalname.split('.')[file.originalname.split('.').length - 1],
          '-q 80',
        );
        const uploadedFile = await s3
          .upload({
            Bucket: AppConfig.instance.config.AWS_S3_BUCKET,
            Key: `UPLOADS/${fileName}`,
            Body: _file,
          })
          .promise();
        urls.push(uploadedFile.Location);
      } else {
        const uuid = uuidv4();
        const fileName = `${uuid}.${
          file.originalname.split('.')[file.originalname.split('.').length - 1]
        }`;
        console.log(fileName);
        const uploadedFile = await s3
          .upload({
            Bucket: AppConfig.instance.config.AWS_S3_BUCKET,
            Key: `UPLOADS/${fileName}`,
            Body: file.buffer,
          })
          .promise();
        urls.push(uploadedFile.Location);
      }
    }
    console.log(urls);
    return {
      data: urls,
    };
  }
}
