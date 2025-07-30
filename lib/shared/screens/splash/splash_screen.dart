import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:codenest/core/constants/app_images.dart';
import 'package:codenest/routes/route_names.dart';
import 'package:codenest/shared/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() {
              final isDark = Get.find<ThemeController>().currentThemeMode ==
                  ThemeMode.dark;
              return SvgPicture.asset(
                AppImages.appLogo,
                semanticsLabel: "App Logo",
                colorFilter: ColorFilter.mode(
                  isDark ? Colors.white : Colors.black,
                  BlendMode.srcIn,
                ),
                height: 100,
              );
            }),
            const SizedBox(height: 30),
            AnimatedTextKit(
              isRepeatingAnimation: false,
              repeatForever: false,
              onFinished: () {
                final box = GetStorage();
                bool seen = box.read("onboardingSeenKey") ?? false;

                if (seen) {
                  Get.offAllNamed(RouteNames.login);
                } else {
                  Get.offAllNamed(RouteNames.onboarding);
                }
              },
              animatedTexts: [
                TypewriterAnimatedText(
                  'Codenest',
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  speed: const Duration(milliseconds: 150),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
