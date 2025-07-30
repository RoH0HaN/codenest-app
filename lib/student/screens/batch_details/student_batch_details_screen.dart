import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/core/constants/app_images.dart';
import 'package:codenest/core/constants/app_texts.dart';
import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/core/widgets/announcement_tile.dart';
import 'package:codenest/core/widgets/batch_details_card.dart';
import 'package:codenest/core/widgets/curriculum_tile.dart';
import 'package:codenest/core/widgets/custom_button.dart';
import 'package:codenest/core/widgets/note_tile.dart';
import 'package:codenest/core/widgets/pill_tag.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/student_batch_details_controller.dart';

class StudentBatchDetailsScreen extends StatelessWidget {
  const StudentBatchDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentBatchDetailsController>();

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
              _buildSectionTitle(context, AppTexts.notes),
              const SizedBox(height: 10),
              NoteTile(
                title: "Array Insertion & Deletion Notes",
                description:
                    "This PDF explains how to insert and delete elements in arrays with examples and diagrams. Includes edge cases and time complexity analysis.",
                tags: "DSA, Arrays, Beginner, Insertion, Deletion, PDF",
                fileType: "PDF",
                isBookmarked: false,
                onSeeAttachments: () {},
                onBookmarkPressed: () {},
              ),
              NoteTile(
                title: "Normalization Techniques in DBMS",
                description:
                    "Understand 1NF, 2NF, 3NF with practical table examples. This note simplifies complex normalization topics using relatable analogies.",
                tags:
                    "DBMS, Normalization, Tables, 1NF, 2NF, 3NF, Beginner, PDF",
                fileType: "PDF",
                isBookmarked: true,
                onSeeAttachments: () {},
                onBookmarkPressed: () {},
              ),
              const SizedBox(height: 10),
              _buildSectionTitle(context, AppTexts.announcements),
              const SizedBox(height: 10),
              AnnouncementTile(
                title: "Updated Batch Schedule",
                description:
                    "Your batch timing has been updated. The evening slot now begins at 6:00 PM instead of 5:30 PM. Please be on time and inform your classmates!",
                date: DateTime.now(),
              ),
              AnnouncementTile(
                title: "New DSA Notes Available!",
                description:
                    "Fresh notes on Linked Lists and Stacks have been uploaded under the DSA batch. Don’t forget to check them out before this weekend's quiz",
                date: DateTime(2023, 6, 25),
              ),
              const SizedBox(height: 10),
              _buildSectionTitle(context, AppTexts.announcements),
              const SizedBox(height: 10),
              _buildTeacherCard(context),
              const SizedBox(height: 10),
              _buildBottomButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            text: AppTexts.shareBatchCode,
            onPressed: () {},
            type: ButtonType.warning,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: AppButton(
            text: AppTexts.leaveBatch,
            onPressed: () {},
            type: ButtonType.error,
          ),
        ),
      ],
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
