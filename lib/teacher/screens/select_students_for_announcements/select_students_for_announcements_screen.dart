import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/core/constants/app_texts.dart';
import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/shared/utils/input_decoration_helper.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:codenest/teacher/controllers/send_announcements_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SelectStudentsForAnnouncementsScreen extends StatelessWidget {
  const SelectStudentsForAnnouncementsScreen({super.key});

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
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.paddingWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: inputDecorationHelper(
                context: context,
                hint: AppTexts.searchStudentsHint,
                iconPath: AppIcons.search,
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.students.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final student = controller.students[index];
                  return Obx(
                    () => CheckboxListTile(
                      value: student.isSelected.value,
                      onChanged: (value) {
                        student.isSelected.value = value ?? false;
                      },
                      title: Text(student.name),
                      checkboxShape: const CircleBorder(side: BorderSide.none),
                      checkColor: context.successColor,
                      activeColor: context.successColor.withOpacity(0.15),
                      enableFeedback: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: context.borderColor),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(student.email),
                          Text(student.phone),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
