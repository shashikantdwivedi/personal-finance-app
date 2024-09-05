import { IsNotEmpty, IsOptional, IsString } from 'class-validator';

export class PaginationDto {
  @IsString()
  @IsNotEmpty()
  page: number;

  @IsString()
  @IsNotEmpty()
  limit: number;

  @IsString()
  @IsOptional()
  search: string;
}
