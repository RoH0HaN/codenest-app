import 'package:codenest/core/constants/app_texts.dart';
import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/core/widgets/custom_button.dart';
import 'package:codenest/core/widgets/enrolled_batch_card.dart';
import 'package:codenest/core/widgets/home_screen_header_widget.dart';
import 'package:codenest/routes/route_names.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_icons.dart';
import '../../../core/widgets/blog_card.dart';
import '../../../core/widgets/flat_card_button.dart';
import '../../../core/widgets/large_card_button.dart';
import '../../../shared/controllers/theme_controller.dart';
import '../../controllers/student_home_controller.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentHomeController>();

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
                name: "Rohan Debnath",
                email: "rohan251@outlook.com",
                role: "STUDENT",
                profileRoute: RouteNames.studentProfile,
              ),
              const SizedBox(height: 20),
              EnrolledBatchCard(
                onPressed: () => Get.toNamed(RouteNames.studentBatchDetails),
              ),
              const SizedBox(height: 10),
              FlatCardButton(
                color: context.infoColor,
                prefixIconPath: AppIcons.telescope,
                text: AppTexts.viewAllBatches,
                onPressed: () => Get.toNamed(RouteNames.studentNewBatches),
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
                    iconPath: AppIcons.notesLarge,
                    text: AppTexts.notes,
                    onPressed: () => Get.toNamed(RouteNames.studentNotes),
                    type: ButtonType.success,
                  ),
                  LargeCardButton(
                    color: context.warningColor,
                    iconPath: AppIcons.curriculumLarge,
                    text: AppTexts.curriculums,
                    onPressed: () => Get.toNamed(RouteNames.studentCurriculums),
                    type: ButtonType.warning,
                  ),
                  LargeCardButton(
                    color: context.infoColor,
                    iconPath: AppIcons.blogLarge,
                    text: AppTexts.blogs,
                    onPressed: () => Get.toNamed(RouteNames.studentBlogs),
                    type: ButtonType.info,
                  ),
                  LargeCardButton(
                    color: context.errorColor,
                    iconPath: AppIcons.notificationLarge,
                    text: AppTexts.notifications,
                    onPressed: () =>
                        Get.toNamed(RouteNames.studentNotifications),
                    type: ButtonType.error,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                AppTexts.newFromTeachers,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              const BlogCard(),
              TextButton(
                  onPressed: () {
                    Get.find<ThemeController>().toggleTheme();
                  },
                  child: const Text("Change Theme")),
            ],
          ),
        ),
      ),
    );
  }
}
