import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { HydratedDocument } from 'mongoose';
import { ApiProperty } from '@nestjs/swagger';
import { Base } from './base.schema';
import { ConfigType } from './types';

export type ConfigDocument = HydratedDocument<Config>;

@Schema()
export class Config extends Base {
  @ApiProperty()
  @Prop({ required: true })
  attribute: string;

  @ApiProperty()
  @Prop({ required: true, default: '' })
  value: string;

  @Prop({ type: String, enum: ConfigType })
  type: ConfigType;
}

export const ConfigSchema = SchemaFactory.createForClass(Config);
