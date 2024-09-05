import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { HydratedDocument } from 'mongoose';
import { Base } from './base.schema';

export type AdminDocument = HydratedDocument<Admin>;

@Schema()
export class Admin extends Base {
  @Prop()
  name: string;

  @Prop({ required: true })
  username: string;

  @Prop({ required: true })
  email: string;

  @Prop()
  phoneNumber?: string;

  @Prop({ required: true })
  password: string;

  @Prop()
  profilePic?: string;
}

export const AdminSchema = SchemaFactory.createForClass(Admin);
