import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { HydratedDocument } from 'mongoose';
import { Base } from './base.schema';
import { AuthVerificationMethod } from './types';

export type AuthVerificationDocument = HydratedDocument<AuthVerification>;

@Schema()
export class AuthVerification extends Base {
  @Prop({ type: String, required: true })
  username: string;

  @Prop({ type: String, enum: AuthVerificationMethod })
  method: AuthVerificationMethod;

  @Prop({ type: Number, required: true })
  otp: number;

  @Prop({ type: Date, required: true })
  expiry: Date;
}

export const AuthVerificationSchema =
  SchemaFactory.createForClass(AuthVerification);
