import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { AppConfig } from './config';
import { LoggerModule } from 'nestjs-pino';
import { MongooseModule } from '@nestjs/mongoose';
import { Admin, AdminSchema } from './schemas/admin.schema';
import {
  AdminNotification,
  AdminNotificationSchema,
} from './schemas/admin-notification.schema';
import { AdminModule } from '../../admin/src/admin.module';
import {
  AuthVerification,
  AuthVerificationSchema,
} from './schemas/auth-verification.schema';
import { Config, ConfigSchema } from './schemas/config.schema';
import { UploadModule } from './upload/upload.module';

@Module({
  imports: [
    ConfigModule.forRoot(),
    AppConfig,
    LoggerModule.forRoot({
      pinoHttp: {
        transport: {
          target: 'pino-pretty',
        },
      },
    }),
    MongooseModule.forRoot(AppConfig.instance.config.DATABASE_URL),
    MongooseModule.forFeature([
      {
        name: Admin.name,
        schema: AdminSchema,
      },
      {
        name: AdminNotification.name,
        schema: AdminNotificationSchema,
      },
      {
        name: AuthVerification.name,
        schema: AuthVerificationSchema,
      },
      {
        name: Config.name,
        schema: ConfigSchema,
      },
    ]),
    UploadModule,
    AdminModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
