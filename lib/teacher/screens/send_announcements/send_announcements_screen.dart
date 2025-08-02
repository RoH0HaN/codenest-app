import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/core/constants/app_texts.dart';
import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/core/widgets/custom_button.dart';
import 'package:codenest/shared/utils/input_decoration_helper.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:codenest/teacher/controllers/send_announcements_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SendAnnouncementsScreen extends StatelessWidget {
  const SendAnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SendAnnouncementsController>();
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
                        AppTexts.sendAnnouncementsTitle,
                        speed: const Duration(milliseconds: 300),
                      )
                    ],
                    repeatForever: true,
                  ),
                ),
                Text(
                  AppTexts.sendAnnouncementsSubtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 30),
                Divider(
                  color: context.borderColor,
                ),
                const SizedBox(height: 30),
                Text(AppTexts.notificationTitle,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 10),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: inputDecorationHelper(
                    context: context,
                    hint: AppTexts.notificationTitleHint,
                    iconPath: AppIcons.batch,
                  ),
                ),
                const SizedBox(height: 10),
                Text(AppTexts.notificationDescription,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 10),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 3,
                  decoration: inputDecorationHelper(
                    context: context,
                    hint: AppTexts.notificationDescriptionHint,
                    iconPath: AppIcons.description,
                  ),
                ),
                const SizedBox(height: 10),
                AppButton(
                  text: AppTexts.next,
                  onPressed: controller.next,
                  type: ButtonType.success,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
