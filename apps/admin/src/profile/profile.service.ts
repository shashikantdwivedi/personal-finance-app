import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { UpdateProfileDto } from './dto/profile.dto';
import { UpdatePasswordDto } from './dto/password.dto';
import { compare, hash } from 'bcrypt';
import { Admin, AdminDocument } from '../../../core/src/schemas/admin.schema';

@Injectable()
export class ProfileService {
  constructor(
    @InjectModel(Admin.name) private adminModel: Model<AdminDocument>,
  ) {}

  async updateProfile(userId: string, data: UpdateProfileDto) {
    const user = await this.adminModel.findById(userId);
    if (!user) {
      throw new HttpException(
        {
          message: 'Admin not found',
        },
        HttpStatus.NOT_FOUND,
      );
    }
    user.name = data.name;
    user.username = data.username;
    await user.save();
    return user;
  }

  async updatePassword(userId: string, data: UpdatePasswordDto) {
    const user = await this.adminModel.findById(userId);
    if (!user) {
      throw new HttpException(
        {
          message: 'User not found',
        },
        HttpStatus.NOT_FOUND,
      );
    }
    const isMatch = await compare(data.oldPassword, user.password);
    if (!isMatch) {
      throw new HttpException(
        {
          message: 'Old password is incorrect',
        },
        HttpStatus.UNAUTHORIZED,
      );
    }
    user.password = await hash(data.password, 10);
    await user.save();
    return {
      message: 'Password updated successfully',
    };
  }
}
