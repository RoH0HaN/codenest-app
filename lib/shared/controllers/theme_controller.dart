import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/scheduler.dart';

class ThemeController extends GetxController {
  final _storage = GetStorage();
  final _key = 'userPreferredTheme'; // true: dark, false: light, null: system

  // Null means system theme is used
  RxnBool userPreferredTheme = RxnBool(null);

  ThemeMode get currentThemeMode {
    if (userPreferredTheme.value == null) {
      final systemBrightness =
          SchedulerBinding.instance.platformDispatcher.platformBrightness;
      return systemBrightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;
    } else {
      return userPreferredTheme.value! ? ThemeMode.dark : ThemeMode.light;
    }
  }

  @override
  void onInit() {
    userPreferredTheme.value = _storage.read(_key);
    Get.changeThemeMode(currentThemeMode);
    super.onInit();
  }

  void toggleTheme() {
    if (userPreferredTheme.value == null) {
      // From system to explicit light
      userPreferredTheme.value = false;
    } else {
      userPreferredTheme.value = !userPreferredTheme.value!;
    }
    _storage.write(_key, userPreferredTheme.value);
    Get.changeThemeMode(currentThemeMode);
  }

  void resetToSystemTheme() {
    userPreferredTheme.value = null;
    _storage.remove(_key);
    Get.changeThemeMode(currentThemeMode);
  }
}
