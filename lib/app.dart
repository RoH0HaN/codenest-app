import 'package:codenest/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/bindings/initial_bindings.dart';
import 'routes/route_names.dart';
import 'routes/routes.dart';
import 'shared/controllers/theme_controller.dart';

class Codenest extends StatelessWidget {
  const Codenest({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Codenest',
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: Get.put(ThemeController()).currentThemeMode,
      getPages: Routes.pages,
      initialRoute: RouteNames.splash,
    );
  }
}
