import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { HydratedDocument } from 'mongoose';
import { Base } from './base.schema';
import * as mongoose from 'mongoose';
import { Admin } from './admin.schema';
export type AdminNotificationDocument = HydratedDocument<AdminNotification>;

@Schema()
export class AdminNotification extends Base {
  @Prop({
    required: true,
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Admin',
  })
  admin: Admin;

  @Prop()
  image: string;

  @Prop({ required: true })
  notification: string;

  @Prop({ required: true, default: false })
  read: boolean;

  @Prop()
  action: string;
}

export const AdminNotificationSchema =
  SchemaFactory.createForClass(AdminNotification);
