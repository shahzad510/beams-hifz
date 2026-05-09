import 'package:flutter/material.dart';

class AppColors {
  // Primary Premium Colors
  static const Color primaryLight = Color(0xFF0D635D); // Deep Emerald
  static const Color primaryDark = Color(0xFF1B8C86); // Soft Teal
  
  // Accents
  static const Color goldAccent = Color(0xFFD4AF37); // Premium Gold
  static const Color goldLight = Color(0xFFFBEBB5); // Soft Gold for glows
  
  // Backgrounds
  static const Color backgroundLight = Color(0xFFF7F9F8); // Soft Cream
  static const Color backgroundDark = Color(0xFF0D1110); // OLED/Charcoal Black
  
  // Surfaces
  static const Color surfaceLight = Colors.white;
  static const Color surfaceDark = Color(0xFF161C1A);
  
  // Text
  static const Color textPrimaryLight = Color(0xFF1E2B28);
  static const Color textSecondaryLight = Color(0xFF5A6B68);
  
  static const Color textPrimaryDark = Color(0xFFE2E9E6);
  static const Color textSecondaryDark = Color(0xFFA0B3AF);

  // States
  static const Color success = Color(0xFF2E7D32);
  static const Color error = Color(0xFFD32F2F);
  
  // Glassmorphism Base Colors
  static Color glassWhite = Colors.white.withValues(alpha: 0.15);
  static Color glassDark = Colors.black.withValues(alpha: 0.25);
}
