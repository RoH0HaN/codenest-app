import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/core/constants/app_texts.dart';
import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/core/widgets/blog_card.dart';
import 'package:codenest/shared/utils/input_decoration_helper.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:codenest/student/controllers/student_saved_blogs_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class StudentSavedBlogsScreen extends StatelessWidget {
  const StudentSavedBlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentSavedBlogsController>();

    return Scaffold(
      appBar: AppBar(
        leading: _buildBackButton(context),
        title: Text(
          AppTexts.savedBlogs,
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
              const SizedBox(height: 10),
              _buildSearchField(context),
              const SizedBox(height: 5),
              _buildCategoryFilters(context, controller),
              const SizedBox(height: 5),
              Divider(color: context.borderColor),
              const SizedBox(height: 5),
              _buildBlogList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        AppIcons.back,
        colorFilter: ColorFilter.mode(context.iconThemeColor, BlendMode.srcIn),
      ),
      onPressed: () => Get.back(),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return TextFormField(
      decoration: inputDecorationHelper(
        context: context,
        hint: AppTexts.searchBlogsHint,
        iconPath: AppIcons.search,
      ),
    );
  }

  Widget _buildCategoryFilters(
      BuildContext context, StudentSavedBlogsController controller) {
    return Obx(() => Wrap(
          spacing: 10,
          runSpacing: 5,
          children: controller.blogCategories.map((category) {
            final isSelected = controller.selectedCategory.value == category;
            final color = isSelected ? context.successColor : context.infoColor;

            return FilterChip(
              label: Text(
                category,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: color),
              ),
              backgroundColor: color.withOpacity(0.15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              side: BorderSide.none,
              showCheckmark: false,
              selectedColor: color.withOpacity(0.15),
              selected: isSelected,
              onSelected: (selected) {
                controller.selectedCategory.value = selected ? category : '';
              },
            );
          }).toList(),
        ));
  }

  Widget _buildBlogList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => const BlogCard(),
      separatorBuilder: (_, __) => const SizedBox(height: 10),
    );
  }
}
