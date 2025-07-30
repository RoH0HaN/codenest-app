import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/core/constants/app_images.dart';
import 'package:codenest/core/constants/app_texts.dart';
import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/core/widgets/batch_details_card.dart';
import 'package:codenest/core/widgets/curriculum_tile.dart';
import 'package:codenest/core/widgets/custom_button.dart';
import 'package:codenest/core/widgets/pill_tag.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:codenest/student/controllers/student_batch_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class StudentBatchInfoScreen extends StatelessWidget {
  const StudentBatchInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentBatchInfoController>();

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
              _buildBannerImage(context),
              const SizedBox(height: 10),
              const BatchDetailsCard(),
              const SizedBox(height: 10),
              _buildSectionTitle(context, AppTexts.curriculumTracker),
              const SizedBox(height: 10),
              const CurriculumTile(
                title: "Data Structure - Arrays",
                status: CurriculumStatus.completed,
                topics: [
                  "Basics of Arrays & Memory Allocation",
                  "Searching & Sorting",
                  "Stacks & Queues"
                ],
              ),
              const CurriculumTile(
                title: "Stack and Heap Data Structure",
                status: CurriculumStatus.ongoing,
                topics: [
                  "Memory Allocation",
                  "String Constants",
                  "Garbage Collection",
                ],
              ),
              const SizedBox(height: 10),
              _buildSectionTitle(context, AppTexts.announcements),
              const SizedBox(height: 10),
              _buildTeacherCard(context),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  text: AppTexts.requestToJoinBatch,
                  onPressed: () {},
                  type: ButtonType.warning,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(title, style: Theme.of(context).textTheme.bodyMedium);
  }

  Widget _buildBannerImage(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        border: Border.all(color: context.borderColor),
        borderRadius: BorderRadius.circular(5),
        image: const DecorationImage(
          image: NetworkImage("https://i.ytimg.com/vi/q-o3__hbDKc/hq720.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTeacherCard(BuildContext context) {
    return Container(
      height: 80,
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
          Container(
            height: double.infinity,
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(color: context.borderColor),
              borderRadius: BorderRadius.circular(2),
              image: const DecorationImage(
                image: AssetImage(AppImages.imageHint),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Prof. Zunaid Ahammed",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text("zunaid.a10@outlook.com",
                    style: Theme.of(context).textTheme.labelLarge),
                const Spacer(),
                Text(
                  "675 followers",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: context.infoColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          PillTag(
            text: "124",
            color: context.successColor,
            iconPath: AppIcons.students,
          ),
        ],
      ),
    );
  }
}
