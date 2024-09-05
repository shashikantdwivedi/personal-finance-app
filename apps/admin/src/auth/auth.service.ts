import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Admin, AdminDocument } from 'apps/core/src/schemas/admin.schema';
import { Model } from 'mongoose';
import { LoginDto } from './dto/login.dto';
import { AppConfig } from 'apps/core/src/config';
import { compare, hash } from 'bcrypt';
import { sign } from 'jsonwebtoken';
import { AuthVerificationDto } from './dto/verify.dto';
import {
  AuthVerification,
  AuthVerificationDocument,
} from '../../../core/src/schemas/auth-verification.schema';
import { AuthVerificationMethod } from '../../../core/src/schemas/types';
import { ResetPasswordDto } from './dto/reset-password.dto';
import { UpdateProfileDto } from './dto/update.dto';

@Injectable()
export class AuthService {
  constructor(
    @InjectModel(Admin.name) private adminModel: Model<AdminDocument>,
    @InjectModel(AuthVerification.name)
    private verificationModel: Model<AuthVerificationDocument>,
  ) {}

  async verify(data: AuthVerificationDto) {
    await this.verificationModel.deleteOne({
      username: data.username,
      method: data.method,
    });
    let otp = Math.floor(100000 + Math.random() * 900000);
    if (AppConfig.instance.config.TEST_EMAILS.includes(data.username)) {
      otp = 123456;
    }
    otp = 123456;
    const verification = await this.verificationModel.create({
      ...data,
      otp,
      expiry: new Date(new Date().getTime() + 10 * 60000),
    });
    if (data.method === AuthVerificationMethod.email) {
      // TODO: Send email
    }
    return verification._id;
  }

  async login(data: LoginDto) {
    const admin = await this.adminModel.findOne({
      $or: [{ username: data.username }, { email: data.username }],
    });
    if (!admin) {
      throw new HttpException(
        {
          message: 'No such admin exists',
        },
        HttpStatus.NOT_FOUND,
      );
    }

    const isPasswordValid = await compare(data.password, admin.password);

    if (!isPasswordValid) {
      throw new HttpException(
        {
          message: 'Wrong password',
        },
        HttpStatus.UNAUTHORIZED,
      );
    }

    const token = sign(
      {
        _id: admin._id,
      },
      AppConfig.instance.config.JWT_PRIVATE_KEY,
      {
        expiresIn: 86400 * 30, // expires in 24 hours
      },
    );
    return {
      token: token,
      name: admin.name,
      username: admin.username,
      email: admin.email,
      profilePic: admin.profilePic,
    };
  }

  async refreshToken(id: string) {
    const admin = await this.adminModel.findOne({ _id: id });
    if (!admin) {
      throw new HttpException(
        {
          message: 'No such admin exists',
        },
        HttpStatus.NOT_FOUND,
      );
    }
    const token = sign(
      {
        _id: admin._id,
      },
      AppConfig.instance.config.JWT_PRIVATE_KEY,
      {
        expiresIn: 86400 * 30, // expires in 24 hours
      },
    );
    return {
      token: token,
      name: admin.name,
      username: admin.username,
      email: admin.email,
      profilePic: admin.profilePic,
    };
  }

  async resetPassword(data: ResetPasswordDto) {
    const verification = await this.verificationModel.findOne({
      _id: data.verificationId,
      method: data.method,
      expiry: { $gt: new Date() },
    });

    if (!verification) {
      throw new HttpException(
        {
          message:
            'Verification not found or expired. Please request a new verification code.',
        },
        HttpStatus.UNAUTHORIZED,
      );
    }

    if (verification.otp !== data.otp) {
      throw new HttpException(
        {
          message: 'Invalid OTP, please try again.',
        },
        HttpStatus.UNAUTHORIZED,
      );
    }

    const password = await hash(data.password, 10);

    await this.adminModel.updateOne(
      {
        ...(data.method === AuthVerificationMethod.email && {
          email: verification.username,
        }),
      },
      {
        password,
      },
    );

    await this.verificationModel.deleteOne({
      _id: data.verificationId,
    });

    return {
      message: 'Password reset successfully',
    };
  }

  async updateProfile(id: string, data: UpdateProfileDto) {
    let admin = await this.adminModel.findOne({ _id: id });
    if (!admin) {
      throw new HttpException(
        {
          message: 'No such admin exists',
        },
        HttpStatus.NOT_FOUND,
      );
    }

    // Username check
    const isUsernameExists = await this.adminModel
      .findOne({ username: data.username })
      .exec();
    if (isUsernameExists) {
      if (isUsernameExists.id !== admin.id) {
        throw new HttpException(
          {
            message: 'Username is already used',
          },
          HttpStatus.BAD_REQUEST,
        );
      }
    }

    // Update required fields
    await this.adminModel.updateOne(
      { _id: id },
      { $set: { username: data.username, name: data.name } },
    );

    if (data.password) {
      const password = await hash(data.password, 10);
      await this.adminModel.updateOne(
        { _id: id },
        { $set: { password: password } },
      );
    }

    if (data.profilePic) {
      await this.adminModel.updateOne(
        { _id: id },
        { $set: { profilePic: data.profilePic } },
      );
    }

    admin = await this.adminModel.findOne({ _id: id });

    return {
      name: admin.name,
      username: admin.username,
      email: admin.email,
      profilePic: admin.profilePic,
    };
  }
}
