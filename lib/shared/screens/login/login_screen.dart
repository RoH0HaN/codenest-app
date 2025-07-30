import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/core/constants/app_images.dart';
import 'package:codenest/core/constants/app_texts.dart';
import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/core/widgets/custom_button.dart';
import 'package:codenest/routes/route_names.dart';
import 'package:codenest/shared/controllers/login_controller.dart';
import 'package:codenest/shared/utils/input_decoration_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.paddingWidth,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.displayLarge!,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        AppTexts.loginTitle,
                        speed: const Duration(milliseconds: 300),
                      )
                    ],
                    repeatForever: true,
                  ),
                ),
                Text(
                  AppTexts.loginSubtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 100),

                // Email
                Text(AppTexts.email,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 10),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: inputDecorationHelper(
                    context: context,
                    hint: AppTexts.emailHint,
                    iconPath: AppIcons.email,
                  ),
                ),

                const SizedBox(height: 10),

                // Password
                Text(AppTexts.password,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 10),
                Obx(
                  () => TextFormField(
                    obscureText: !controller.showPassword.value,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: inputDecorationHelper(
                      context: context,
                      hint: AppTexts.passwordHint,
                      iconPath: AppIcons.password,
                      suffix: IconButton(
                        icon: SvgPicture.asset(
                          controller.showPassword.value
                              ? AppIcons.eyeOpen
                              : AppIcons.eyeClosed,
                          colorFilter: ColorFilter.mode(
                            context.iconThemeColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        onPressed: controller.showPassword.toggle,
                      ),
                    ),
                  ),
                ),

                // Forget Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      AppTexts.forget,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: context.infoColor),
                    ),
                  ),
                ),

                // Login Button
                AppButton(
                  text: AppTexts.login,
                  onPressed: controller.login,
                  type: ButtonType.success,
                ),

                const SizedBox(height: 50),

                // Register Link
                InkWell(
                  onTap: () {
                    Get.toNamed(RouteNames.signup);
                  },
                  child: Text(
                    AppTexts.register,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: context.infoColor),
                  ),
                ),

                const SizedBox(height: 100),

                // App Logo + Welcome Text
                const _WelcomeSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WelcomeSection extends StatelessWidget {
  const _WelcomeSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: context.borderColor, width: 1.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: SvgPicture.asset(
              AppImages.companyLogo,
              semanticsLabel: "App Logo",
              colorFilter:
                  ColorFilter.mode(context.iconThemeColor, BlendMode.srcIn),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppTexts.welcomeTitle,
                  style: Theme.of(context).textTheme.displayLarge),
              Text(AppTexts.welcomeSubtitle,
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
}
