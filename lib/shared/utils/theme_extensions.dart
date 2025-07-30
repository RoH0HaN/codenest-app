import 'package:codenest/core/constants/colors.dart';
import 'package:flutter/material.dart';

extension ThemeColorExtension on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  Color get white => AppColors.white;
  Color get black => AppColors.black;

  Color get iconThemeColor => isDarkMode ? AppColors.white : AppColors.black;

  Color get background =>
      isDarkMode ? AppColors.backgroundDark : AppColors.backgroundLight;

  Color get backgroundCard =>
      isDarkMode ? AppColors.backgroundCardDark : AppColors.backgroundCardLight;

  Color get primaryText =>
      isDarkMode ? AppColors.fontDark : AppColors.fontLight;

  Color get secondaryText =>
      isDarkMode ? AppColors.fontBodyDark : AppColors.fontBodyLight;

  Color get errorColor =>
      isDarkMode ? AppColors.errorDark : AppColors.errorLight;

  Color get successColor =>
      isDarkMode ? AppColors.successDark : AppColors.successLight;

  Color get infoColor => isDarkMode ? AppColors.infoDark : AppColors.infoLight;

  Color get warningColor =>
      isDarkMode ? AppColors.warningDark : AppColors.warningLight;

  Color get borderColor =>
      isDarkMode ? AppColors.borderDark : AppColors.borderLight;
}
