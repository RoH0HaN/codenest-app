import 'package:codenest/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTextThemes {
  static const _kalam = 'Kalam';
  static const _afacad = 'Afacad';

  static TextTheme lightTextTheme = const TextTheme(
    displayLarge: TextStyle(
      fontFamily: _kalam,
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: AppColors.fontLight,
    ),
    titleLarge: TextStyle(
      fontFamily: _kalam,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.fontLight,
    ),
    bodyLarge: TextStyle(
      fontFamily: _kalam,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.fontBodyLight,
    ),
    headlineLarge: TextStyle(
      fontFamily: _afacad,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.fontLight,
    ),
    titleMedium: TextStyle(
      fontFamily: _afacad,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.fontLight,
    ),
    bodyMedium: TextStyle(
      fontFamily: _afacad,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.fontBodyLight,
    ),
    labelLarge: TextStyle(
      fontFamily: _afacad,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.fontBodyLight,
    ),
    labelSmall: TextStyle(
      fontFamily: _afacad,
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: AppColors.fontBodyLight,
    ),
  );

  static TextTheme darkTextTheme = lightTextTheme.copyWith(
    displayLarge:
        lightTextTheme.displayLarge?.copyWith(color: AppColors.fontDark),
    titleLarge: lightTextTheme.titleLarge?.copyWith(color: AppColors.fontDark),
    bodyLarge:
        lightTextTheme.bodyLarge?.copyWith(color: AppColors.fontBodyDark),
    headlineLarge:
        lightTextTheme.headlineLarge?.copyWith(color: AppColors.fontDark),
    titleMedium:
        lightTextTheme.titleMedium?.copyWith(color: AppColors.fontDark),
    bodyMedium:
        lightTextTheme.bodyMedium?.copyWith(color: AppColors.fontBodyDark),
    labelLarge:
        lightTextTheme.labelLarge?.copyWith(color: AppColors.fontBodyDark),
    labelSmall:
        lightTextTheme.labelSmall?.copyWith(color: AppColors.fontBodyDark),
  );
}
