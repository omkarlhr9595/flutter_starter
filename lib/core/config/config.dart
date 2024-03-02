import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static final String BASE_URL = dotenv.get("BASE_URL");
}
