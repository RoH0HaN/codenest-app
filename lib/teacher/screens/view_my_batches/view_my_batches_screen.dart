import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/core/constants/app_texts.dart';
import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/core/widgets/batch_details_card.dart';
import 'package:codenest/core/widgets/custom_button.dart';
import 'package:codenest/core/widgets/enrolled_batch_card.dart';
import 'package:codenest/shared/utils/input_decoration_helper.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ViewMyBatchesScreen extends StatelessWidget {
  const ViewMyBatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      floatingActionButton: AppButton(
        text: AppTexts.create,
        onPressed: () {},
        type: ButtonType.success,
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
                  hint: AppTexts.searchBatchesHint,
                  iconPath: AppIcons.search,
                ),
              ),
              const SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return EnrolledBatchCard();
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
