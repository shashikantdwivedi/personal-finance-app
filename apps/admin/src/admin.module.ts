import { MiddlewareConsumer, Module } from '@nestjs/common';
import { AdminController } from './admin.controller';
import { AdminService } from './admin.service';
import { MongooseModule } from '@nestjs/mongoose';
import { Admin, AdminSchema } from '../../core/src/schemas/admin.schema';
import { AuthMiddleware } from '../../core/src/middlewares/auth.middleware';
import { AuthModule } from './auth/auth.module';
import { ProfileModule } from './profile/profile.module';

@Module({
  imports: [
    MongooseModule.forFeature([
      {
        name: Admin.name,
        schema: AdminSchema,
      },
    ]),
    AuthModule,
    ProfileModule,
  ],
  controllers: [AdminController],
  providers: [AdminService],
})
export class AdminModule {
  configure(consumer: MiddlewareConsumer) {
    consumer
      .apply(AuthMiddleware)
      .forRoutes(
        '/admin/auth/refresh-token',
        '/admin/auth/update-profile',
        '/admin/profile',
      );
  }
}
