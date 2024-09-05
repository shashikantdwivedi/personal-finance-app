import {
  Controller,
  Post,
  UploadedFiles,
  UseInterceptors,
} from '@nestjs/common';
import { UploadService } from './upload.service';
import { FilesInterceptor } from '@nestjs/platform-express';

@Controller('/upload')
export class UploadController {
  constructor(private readonly uploadService: UploadService) {}

  @Post()
  @UseInterceptors(FilesInterceptor('files'))
  uploadFile(
    @UploadedFiles()
    files: Array<Express.Multer.File>,
  ): Promise<any> {
    console.log(files);
    return this.uploadService.uploadImages(files);
  }
}
