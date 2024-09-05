import { IsEnum, IsNotEmpty, IsString } from 'class-validator';
import { AuthVerificationMethod } from '../../../../core/src/schemas/types';
import { ApiProperty } from '@nestjs/swagger';

export class AuthVerificationDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  username: string;

  @ApiProperty({
    enum: AuthVerificationMethod,
    enumName: 'AuthVerificationMethod',
  })
  @IsEnum(AuthVerificationMethod)
  @IsNotEmpty()
  method: AuthVerificationMethod;
}
