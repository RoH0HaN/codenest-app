import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/core/constants/app_images.dart';
import 'package:codenest/core/constants/app_texts.dart';
import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/core/widgets/custom_button.dart';
import 'package:codenest/core/widgets/flat_card_button.dart';
import 'package:codenest/core/widgets/large_card_button.dart';
import 'package:codenest/core/widgets/pill_tag.dart';
import 'package:codenest/routes/route_names.dart';
import 'package:codenest/shared/controllers/theme_controller.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:codenest/student/controllers/student_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentProfileController>();

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
        title: Text(
          AppTexts.profile,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
        actions: [
          Obx(
            () => IconButton(
              icon: SvgPicture.asset(
                Get.find<ThemeController>().currentThemeMode == ThemeMode.dark
                    ? AppIcons.sun
                    : AppIcons.moon,
                colorFilter:
                    ColorFilter.mode(context.iconThemeColor, BlendMode.srcIn),
              ),
              onPressed: () => Get.find<ThemeController>().toggleTheme(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.cardPaddingWidth,
          vertical: Sizes.cardPaddingHeight,
        ),
        child: SizedBox(
          width: double.infinity,
          child: AppButton(
            text: AppTexts.logout,
            type: ButtonType.error,
            onPressed: () {},
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.paddingWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Container(
                height: 150,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.cardPaddingWidth,
                  vertical: Sizes.cardPaddingHeight,
                ),
                decoration: BoxDecoration(
                  color: context.backgroundCard,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: context.borderColor),
                ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: context.borderColor),
                            image: const DecorationImage(
                              image: AssetImage(AppImages.imageHint),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.transparent,
                                Colors.transparent,
                                Colors.black54,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              AppIcons.editSmall,
                              height: 24,
                              width: 24,
                              colorFilter: ColorFilter.mode(
                                context.iconThemeColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Rohan Debnath",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          Text(
                            "rohan251@outlook.com",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            "+91 8145312848",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  PillTag(
                    text: "+91 8145312848",
                    color: context.successColor,
                    iconPath: AppIcons.whatsapp,
                  ),
                  PillTag(
                    text: "STUDENT",
                    color: context.infoColor,
                    iconPath: AppIcons.toggle,
                  ),
                  PillTag(
                    text: "25th, Mar 25",
                    color: context.warningColor,
                    iconPath: AppIcons.person,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              FlatCardButton(
                prefixIconPath: AppIcons.key,
                text: AppTexts.changePassword,
                color: context.warningColor,
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: LargeCardButton(
                      color: context.successColor,
                      iconPath: AppIcons.notesLarge,
                      text: AppTexts.savedNotes,
                      onPressed: () =>
                          Get.toNamed(RouteNames.studentSavedNotes),
                      type: ButtonType.success,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: LargeCardButton(
                      color: context.infoColor,
                      iconPath: AppIcons.blogLarge,
                      text: AppTexts.savedBlogs,
                      onPressed: () =>
                          Get.toNamed(RouteNames.studentSavedBlogs),
                      type: ButtonType.info,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                AppTexts.enrolledBatches,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.cardPaddingWidth,
                    ),
                    decoration: BoxDecoration(
                      color: context.backgroundCard,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: context.borderColor),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Batch 1",
                            style: Theme.of(context).textTheme.titleMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            AppIcons.goto,
                            height: 24,
                            width: 24,
                            colorFilter: ColorFilter.mode(
                              context.iconThemeColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemCount: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
