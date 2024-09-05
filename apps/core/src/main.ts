import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { Logger, LoggerErrorInterceptor } from 'nestjs-pino';
import * as fs from 'fs';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.setGlobalPrefix('/apis/v1/core');
  process.env.TZ = 'Asia/Kolkata';
  app.useLogger(app.get(Logger));
  app.useGlobalInterceptors(new LoggerErrorInterceptor());

  app.enableCors();

  new Promise((resolve, reject) => {
    fs.access('./node_modules/webp-converter/temp', (error) => {
      if (error) {
        fs.mkdirSync('./node_modules/webp-converter/temp');
      }
    });
  });

  await app.listen(4444);
}

bootstrap();
