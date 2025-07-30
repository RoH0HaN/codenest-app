import 'package:codenest/core/constants/colors.dart';
import 'package:codenest/shared/theme/app_text_themes.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      textTheme: AppTextThemes.lightTextTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundLight,
      ));

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      textTheme: AppTextThemes.darkTextTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundDark,
      ));
}
