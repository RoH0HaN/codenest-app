import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/core/constants/app_texts.dart';
import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/core/widgets/batch_details_card.dart';
import 'package:codenest/core/widgets/curriculum_tile.dart';
import 'package:codenest/core/widgets/pill_tag.dart';
import 'package:codenest/shared/utils/input_decoration_helper.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:codenest/student/controllers/student_curriculums_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class StudentCurriculumsScreen extends StatelessWidget {
  const StudentCurriculumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentCurriculumsController>();

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
          AppTexts.exploreCurriculums,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.paddingWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppTexts.selectBatch,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                icon: SvgPicture.asset(
                  AppIcons.arrowDownSmall,
                  colorFilter:
                      ColorFilter.mode(context.iconThemeColor, BlendMode.srcIn),
                ),
                decoration: inputDecorationHelper(
                    context: context,
                    hint: AppTexts.selectBatch,
                    iconPath: AppIcons.batch),
                value: controller.selectedBatch,
                onChanged: (value) {
                  controller.selectedBatch = value!;
                },
                items: controller.batches
                    .map(
                      (e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
              ),
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
              _buildSectionTitle(context, AppTexts.completionOverview),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.cardPaddingWidth,
                  vertical: Sizes.cardPaddingHeight,
                ),
                decoration: BoxDecoration(
                  color: context.backgroundCard,
                  border: Border.all(color: context.borderColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PillTag(
                          text: "98",
                          color: context.successColor,
                          iconPath: AppIcons.percentageSmall,
                        ),
                        Text(
                          AppTexts.batchProgress,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        PillTag(
                          text: "2",
                          color: context.errorColor,
                          iconPath: AppIcons.percentageSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: 0.75,
                      backgroundColor: context.successColor.withOpacity(0.15),
                      color: context.successColor,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(title, style: Theme.of(context).textTheme.bodyMedium);
  }
}
