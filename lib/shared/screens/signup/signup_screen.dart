import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/core/constants/app_images.dart';
import 'package:codenest/core/constants/app_texts.dart';
import 'package:codenest/core/widgets/custom_button.dart';
import 'package:codenest/shared/controllers/signup_controller.dart';
import 'package:codenest/shared/utils/input_decoration_helper.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/constants/sizes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            AppIcons.back,
            colorFilter:
                ColorFilter.mode(context.iconThemeColor, BlendMode.srcIn),
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.paddingWidth,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.displayLarge!,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        AppTexts.signupTitle,
                        speed: const Duration(milliseconds: 300),
                      )
                    ],
                    repeatForever: true,
                  ),
                ),
                Text(
                  AppTexts.signupSubtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 30),
                Divider(
                  color: context.borderColor,
                ),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: Image.asset(
                              AppImages.imageHint,
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            AppTexts.imageHint,
                            style: Theme.of(context).textTheme.labelLarge,
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: controller.pickAvatarImage,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(8),
                          color: context.borderColor,
                          strokeWidth: 1.5,
                          dashPattern: const [6, 4],
                          child: Container(
                            height: 150,
                            alignment: Alignment.center,
                            child: Obx(() {
                              final avatar = controller.selectedAvatar.value;
                              if (avatar != null) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    avatar,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                );
                              } else {
                                return SvgPicture.asset(
                                  AppIcons.image,
                                  colorFilter: ColorFilter.mode(
                                    context.iconColor!,
                                    BlendMode.srcIn,
                                  ),
                                  semanticsLabel: "Upload Avatar",
                                );
                              }
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(AppTexts.name,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.nameController,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: inputDecorationHelper(
                    context: context,
                    hint: AppTexts.nameHint,
                    iconPath: AppIcons.name,
                  ),
                ),
                const SizedBox(height: 10),
                Text(AppTexts.phone,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.phoneController,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: inputDecorationHelper(
                    context: context,
                    hint: AppTexts.phoneHint,
                    iconPath: AppIcons.phone,
                  ),
                ),
                const SizedBox(height: 10),
                Text(AppTexts.whatsapp,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.whatsappController,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: inputDecorationHelper(
                    context: context,
                    hint: AppTexts.whatsappHint,
                    iconPath: AppIcons.whatsapp,
                  ),
                ),
                const SizedBox(height: 10),
                Text(AppTexts.email,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.emailController,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: inputDecorationHelper(
                    context: context,
                    hint: AppTexts.emailHint,
                    iconPath: AppIcons.email,
                  ),
                ),
                const SizedBox(height: 10),
                Text(AppTexts.password,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 10),
                Obx(
                  () => TextFormField(
                    controller: controller.passwordController,
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
                              context.iconThemeColor, BlendMode.srcIn),
                        ),
                        onPressed: controller.showPassword.toggle,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                AppButton(
                  text: AppTexts.signup,
                  onPressed: controller.signup,
                  type: ButtonType.success,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
