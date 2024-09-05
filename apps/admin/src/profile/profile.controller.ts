import {
  Body,
  Controller,
  Patch,
  Req,
  UsePipes,
  ValidationPipe,
} from '@nestjs/common';
import { ProfileService } from './profile.service';
import { UpdateProfileDto } from './dto/profile.dto';
import { UpdatePasswordDto } from './dto/password.dto';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

@ApiBearerAuth()
@ApiTags('Profile Management')
@Controller('admin/profile')
export class ProfileController {
  constructor(private readonly userService: ProfileService) {}

  @Patch()
  @UsePipes(new ValidationPipe())
  async updateProfile(@Req() req: Request, @Body() data: UpdateProfileDto) {
    return this.userService.updateProfile(req['id'], data);
  }

  @Patch('/password')
  @UsePipes(new ValidationPipe())
  async updatePassword(@Req() req: Request, @Body() data: UpdatePasswordDto) {
    return this.userService.updatePassword(req['id'], data);
  }
}
