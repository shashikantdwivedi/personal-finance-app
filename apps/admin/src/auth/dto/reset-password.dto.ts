import { IsEnum, IsNotEmpty, IsNumber, IsString } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';
import { AuthVerificationMethod } from '../../../../core/src/schemas/types';

export class ResetPasswordDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  password: string;

  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  verificationId: string;

  @ApiProperty()
  @IsNumber()
  @IsNotEmpty()
  otp: number;

  @ApiProperty({
    enum: AuthVerificationMethod,
    enumName: 'AuthVerificationMethod',
  })
  @IsEnum(AuthVerificationMethod)
  @IsNotEmpty()
  method: AuthVerificationMethod;
}
