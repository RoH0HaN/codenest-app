import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:codenest/core/constants/app_images.dart';
import 'package:codenest/core/constants/app_texts.dart';
import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/core/widgets/custom_button.dart';
import 'package:codenest/shared/utils/input_decoration_helper.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:codenest/teacher/controllers/create_new_batch_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_icons.dart';

class CreateNewBatchScreen extends StatelessWidget {
  const CreateNewBatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateNewBatchController>();
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
                        AppTexts.createNewBatchTitle,
                        speed: const Duration(milliseconds: 300),
                      )
                    ],
                    repeatForever: true,
                  ),
                ),
                Text(
                  AppTexts.createNewBatchSubtitle,
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
                            AppTexts.createBatchImageHint,
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
                              final avatar =
                                  controller.selectedBatchThumbnail.value;
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
                Text(AppTexts.batchName,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 10),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: inputDecorationHelper(
                    context: context,
                    hint: AppTexts.batchNameHint,
                    iconPath: AppIcons.batch,
                  ),
                ),
                const SizedBox(height: 10),
                Text(AppTexts.batchCode,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 10),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: inputDecorationHelper(
                    context: context,
                    hint: AppTexts.batchCodeHint,
                    iconPath: AppIcons.code,
                  ),
                ),
                const SizedBox(height: 10),
                Text(AppTexts.batchCategory,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 10),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: inputDecorationHelper(
                    context: context,
                    hint: AppTexts.batchCategoryHint,
                    iconPath: AppIcons.categories,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    // Start Date
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(AppTexts.startDate,
                              style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(height: 10),
                          TextFormField(
                            readOnly: true,
                            controller: TextEditingController(
                              text: controller.formatter
                                  .format(controller.startDate.value),
                            ),
                            decoration: inputDecorationHelper(
                              context: context,
                              hint: 'Start Date',
                              iconPath: AppIcons.date,
                              suffix: IconButton(
                                icon: SvgPicture.asset(
                                  AppIcons.toggle,
                                  height: 24,
                                  width: 24,
                                  colorFilter: ColorFilter.mode(
                                      context.warningColor, BlendMode.srcIn),
                                ),
                                onPressed: () =>
                                    controller.pickDate(context, true),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    // End Date
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(AppTexts.endDate,
                              style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(height: 10),
                          TextFormField(
                            readOnly: true,
                            controller: TextEditingController(
                              text: controller.formatter
                                  .format(controller.endDate.value),
                            ),
                            decoration: inputDecorationHelper(
                              context: context,
                              hint: 'End Date',
                              iconPath: AppIcons.date,
                              suffix: IconButton(
                                icon: SvgPicture.asset(
                                  AppIcons.toggle,
                                  height: 24,
                                  width: 24,
                                  colorFilter: ColorFilter.mode(
                                      context.warningColor, BlendMode.srcIn),
                                ),
                                onPressed: () =>
                                    controller.pickDate(context, false),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(AppTexts.batchDescription,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 10),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 3,
                  decoration: inputDecorationHelper(
                    context: context,
                    hint: AppTexts.batchDescriptionHint,
                    iconPath: AppIcons.description,
                  ),
                ),
                const SizedBox(height: 10),
                AppButton(
                  text: AppTexts.create,
                  onPressed: controller.create,
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
