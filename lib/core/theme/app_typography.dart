import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class AppTypography {
  static TextTheme get lightTheme {
    return GoogleFonts.outfitTextTheme().copyWith(
      displayLarge: GoogleFonts.outfit(fontSize: 57, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
      displayMedium: GoogleFonts.outfit(fontSize: 45, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
      displaySmall: GoogleFonts.outfit(fontSize: 36, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
      headlineLarge: GoogleFonts.outfit(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
      headlineMedium: GoogleFonts.outfit(fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.textPrimaryLight),
      headlineSmall: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.textPrimaryLight),
      titleLarge: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.textPrimaryLight),
      titleMedium: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.textPrimaryLight),
      titleSmall: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textPrimaryLight),
      bodyLarge: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.textPrimaryLight),
      bodyMedium: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.textPrimaryLight),
      bodySmall: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.normal, color: AppColors.textSecondaryLight),
      labelLarge: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimaryLight),
    );
  }

  static TextTheme get darkTheme {
    return GoogleFonts.outfitTextTheme().copyWith(
      displayLarge: GoogleFonts.outfit(fontSize: 57, fontWeight: FontWeight.bold, color: AppColors.textPrimaryDark),
      displayMedium: GoogleFonts.outfit(fontSize: 45, fontWeight: FontWeight.bold, color: AppColors.textPrimaryDark),
      displaySmall: GoogleFonts.outfit(fontSize: 36, fontWeight: FontWeight.bold, color: AppColors.textPrimaryDark),
      headlineLarge: GoogleFonts.outfit(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.textPrimaryDark),
      headlineMedium: GoogleFonts.outfit(fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.textPrimaryDark),
      headlineSmall: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.textPrimaryDark),
      titleLarge: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.textPrimaryDark),
      titleMedium: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.textPrimaryDark),
      titleSmall: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textPrimaryDark),
      bodyLarge: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.textPrimaryDark),
      bodyMedium: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.textPrimaryDark),
      bodySmall: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.normal, color: AppColors.textSecondaryDark),
      labelLarge: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimaryDark),
    );
  }

  static TextStyle arabicLight(double fontSize, {FontWeight weight = FontWeight.normal}) {
    return GoogleFonts.amiri(
      fontSize: fontSize,
      fontWeight: weight,
      color: AppColors.textPrimaryLight,
      height: 1.8,
    );
  }

  static TextStyle arabicDark(double fontSize, {FontWeight weight = FontWeight.normal}) {
    return GoogleFonts.amiri(
      fontSize: fontSize,
      fontWeight: weight,
      color: AppColors.textPrimaryDark,
      height: 1.8,
    );
  }
}
