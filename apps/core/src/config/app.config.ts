export class AppConfig {
  private readonly _configs: { [key: string]: any } = null;

  constructor() {
    this._configs = {};
    this.loadEnvConfigs();
  }

  loadEnvConfigs() {
    this._configs.DATABASE_URL = process.env.DATABASE_URL;
    this._configs.JWT_PRIVATE_KEY = process.env.JWT_PRIVATE_KEY;
    this._configs.AWS_ACCESS_KEY = process.env.AWS_ACCESS_KEY;
    this._configs.AWS_SECRET_KEY = process.env.AWS_SECRET_KEY;
    this._configs.AWS_REGION = process.env.AWS_REGION;
    this._configs.AWS_S3_BUCKET = process.env.AWS_S3_BUCKET;
    this._configs.TEST_EMAILS = process.env.TEST_EMAILS;
  }
  get config() {
    return this._configs;
  }

  private static ins = null;
  static get instance() {
    if (!AppConfig.ins) {
      AppConfig.ins = new AppConfig();
    }
    return AppConfig.ins;
  }
}
