import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class FirebaseSetup {
  static Future<void> init() async {
    // Wait for bindings to be initialized in main
    try {
      // Temporarily bypass Firebase initialization on Web to prevent crash due to missing options
      if (kIsWeb) {
        debugPrint('Bypassing Firebase initialization on Web: FirebaseOptions not configured yet.');
        return;
      }
      
      await Firebase.initializeApp(
        // options: DefaultFirebaseOptions.currentPlatform, // Generate this via flutterfire configure later
      );
    } catch (e) {
      debugPrint('Firebase initialization error: $e');
    }
  }
}
