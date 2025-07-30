import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/core/constants/app_texts.dart';
import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/core/widgets/batch_details_card.dart';
import 'package:codenest/core/widgets/custom_button.dart';
import 'package:codenest/core/widgets/enrolled_batch_card.dart';
import 'package:codenest/routes/route_names.dart';
import 'package:codenest/shared/utils/input_decoration_helper.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:codenest/student/controllers/student_new_batches_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class StudentNewBatchesScreen extends StatelessWidget {
  const StudentNewBatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentNewBatchesController>();

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
          AppTexts.exploreNewBatches,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      floatingActionButton: AppButton(
        text: AppTexts.join,
        onPressed: () {},
        type: ButtonType.warning,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.paddingWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              TextFormField(
                decoration: inputDecorationHelper(
                  context: context,
                  hint: AppTexts.searchBatchesHint,
                  iconPath: AppIcons.search,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                AppTexts.availableBatches,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return EnrolledBatchCard(
                    onPressed: () => Get.toNamed(RouteNames.studentBatchInfo),
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
