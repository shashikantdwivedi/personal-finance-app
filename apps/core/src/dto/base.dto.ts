import { Status } from '../schemas/types';

export class BaseDto {
  status: Status;
  deleted: boolean;
}
