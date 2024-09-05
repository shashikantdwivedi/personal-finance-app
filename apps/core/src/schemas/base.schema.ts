import { Prop, Schema } from '@nestjs/mongoose';
import mongoose, { HydratedDocument, now } from 'mongoose';
import { Status } from './types';
import { Admin } from './admin.schema';

export type BaseDocument = HydratedDocument<Base>;

@Schema()
export class Base {
  @Prop({ type: mongoose.Schema.Types.ObjectId, ref: 'Admin' })
  addedBy?: Admin;

  @Prop({ type: String, enum: Status, default: Status.active })
  status: Status;

  @Prop({ required: true, default: false })
  deleted: boolean;

  @Prop({ default: now() })
  createdAt: Date;

  @Prop({ default: now() })
  updatedAt: Date;
}
