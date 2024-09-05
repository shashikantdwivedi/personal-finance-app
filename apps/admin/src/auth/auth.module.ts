import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { Admin, AdminSchema } from 'apps/core/src/schemas/admin.schema';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import {
  AuthVerification,
  AuthVerificationSchema,
} from '../../../core/src/schemas/auth-verification.schema';

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: Admin.name, schema: AdminSchema },
      { name: AuthVerification.name, schema: AuthVerificationSchema },
    ]),
  ],
  controllers: [AuthController],
  providers: [AuthService],
})
export class AuthModule {}
