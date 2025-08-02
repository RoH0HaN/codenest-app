import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/core/constants/app_texts.dart';
import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/core/widgets/blog_card.dart';
import 'package:codenest/core/widgets/custom_button.dart';
import 'package:codenest/core/widgets/home_screen_header_widget.dart';
import 'package:codenest/core/widgets/pill_tag.dart';
import 'package:codenest/routes/route_names.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/widgets/large_card_button.dart';
import '../../controllers/teacher_home_controller.dart';

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TeacherHomeController>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.paddingWidth,
            vertical: Sizes.paddingWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeScreenHeaderWidget(
                name: "Zunaid Ahammed",
                email: "zunaid.a10@outlook.com",
                role: "TEACHER",
                profileRoute: RouteNames.studentProfile,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.cardPaddingWidth,
                  vertical: Sizes.cardPaddingHeight,
                ),
                decoration: BoxDecoration(
                  color: context.backgroundCard,
                  border: Border.all(color: context.borderColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          PillTag(
                            text: "124 Students",
                            color: context.successColor,
                            iconPath: AppIcons.students,
                          ),
                          PillTag(
                            text: "47 Requests",
                            color: context.infoColor,
                            iconPath: AppIcons.hourglass,
                          ),
                          PillTag(
                            text: "1876 Notes",
                            color: context.warningColor,
                            iconPath: AppIcons.writingPad,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () => Get.toNamed(RouteNames.pendingJoinRequests),
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          border: Border.all(color: context.successColor),
                          color: context.successColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              height: 24,
                              width: 24,
                              AppIcons.eyeOpen,
                              colorFilter: ColorFilter.mode(
                                context.successColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Requests",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: context.successColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 150,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                children: [
                  LargeCardButton(
                    color: context.successColor,
                    iconPath: AppIcons.batchLarge,
                    text: AppTexts.createBatch,
                    onPressed: () => Get.toNamed(RouteNames.createNewBatch),
                    type: ButtonType.success,
                  ),
                  LargeCardButton(
                    color: context.warningColor,
                    iconPath: AppIcons.arrowTopLeftLarge,
                    text: AppTexts.myBatches,
                    onPressed: () => Get.toNamed(RouteNames.myBatches),
                    type: ButtonType.warning,
                  ),
                  LargeCardButton(
                    color: context.infoColor,
                    iconPath: AppIcons.microphoneLarge,
                    text: AppTexts.announcements,
                    onPressed: () => Get.toNamed(RouteNames.sendAnnouncements),
                    type: ButtonType.info,
                  ),
                  LargeCardButton(
                    color: context.errorColor,
                    iconPath: AppIcons.notificationLarge,
                    text: AppTexts.notifications,
                    onPressed: () =>
                        Get.toNamed(RouteNames.teacherNotifications),
                    type: ButtonType.error,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                AppTexts.manageCurriculums,
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
                            "Data Structure and Algorithms.",
                            style: Theme.of(context).textTheme.titleMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 10),
                        AppButton(
                          text: AppTexts.manage,
                          onPressed: () {},
                          type: ButtonType.success,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 5),
                itemCount: 5,
              ),
              const SizedBox(height: 10),
              Text(
                AppTexts.newFromTeachers,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              const BlogCard(),
            ],
          ),
        ),
      ),
    );
  }
}
