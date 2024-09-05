import {
  Body,
  Controller,
  Get,
  Patch,
  Post,
  Req,
  UsePipes,
  ValidationPipe,
} from '@nestjs/common';
import { AuthService } from './auth.service';
import { LoginDto } from './dto/login.dto';
import { ApiSecurity, ApiTags } from '@nestjs/swagger';
import { AuthVerificationDto } from './dto/verify.dto';
import { ResetPasswordDto } from './dto/reset-password.dto';
import { UpdateProfileDto } from './dto/update.dto';

@ApiTags('Authentication')
@Controller('admin/auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('verify')
  @UsePipes(new ValidationPipe())
  otpVerification(@Body() body: AuthVerificationDto): Promise<any> {
    return this.authService.verify(body);
  }

  @Post('login')
  @UsePipes(new ValidationPipe())
  login(@Body() body: LoginDto): Promise<any> {
    return this.authService.login(body);
  }

  @ApiSecurity('token')
  @Get('/refresh-token')
  refreshToken(@Req() req: Request): Promise<any> {
    return this.authService.refreshToken(req['id'] as string);
  }

  @Patch('/reset-password')
  resetPassword(@Body() body: ResetPasswordDto): Promise<any> {
    return this.authService.resetPassword(body);
  }

  @Patch('/update-profile')
  @ApiSecurity('token')
  @UsePipes(new ValidationPipe())
  updateProfile(
    @Req() req: Request,
    @Body() body: UpdateProfileDto,
  ): Promise<any> {
    return this.authService.updateProfile(req['id'] as string, body);
  }
}
