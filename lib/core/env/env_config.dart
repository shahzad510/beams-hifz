import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static Future<void> init() async {
    await dotenv.load(fileName: ".env");
  }

  static String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? 'https://default-api.com';
  // Add other environment variables here
}
