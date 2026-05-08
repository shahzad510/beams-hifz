import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static Future<void> init() async {
    try {
      await dotenv.load(fileName: ".env");
    } catch (e) {
      debugPrint("Error loading .env file: $e");
    }
  }

  static String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? 'https://default-api.com';
  // Add other environment variables here
}
