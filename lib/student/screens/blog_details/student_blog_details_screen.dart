import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/core/constants/app_images.dart';
import 'package:codenest/core/constants/app_texts.dart';
import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/core/widgets/blog_card.dart';
import 'package:codenest/core/widgets/custom_button.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:codenest/student/controllers/student_blog_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class StudentBlogDetailsScreen extends StatelessWidget {
  const StudentBlogDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentBlogDetailsController>();

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
          "Mastering the Basics: Why Strong Fundamentals Matter in Software Development",
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              AppIcons.bookmarkActive,
              colorFilter:
                  ColorFilter.mode(context.iconThemeColor, BlendMode.srcIn),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.paddingWidth,
            vertical: Sizes.paddingHeight,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBannerImage(context),
              const SizedBox(height: 5),
              Text(
                "Mastering the Basics: Why Strong Fundamentals Matter in Software Development",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 5),
              _buildAuthorCard(context),
              const SizedBox(height: 10),

              // Blog Content
              Text(
                "When learning to code, it’s tempting to jump straight into building flashy apps or mastering frameworks. But what separates a good programmer from a great one isn’t the tools they use — it’s their foundation in the basics.\n\nStrong fundamentals in data structures, algorithms, and core programming concepts act like a compass in the ever-evolving tech landscape. With a solid base, you’ll find it easier to switch languages, debug tricky bugs, and understand how things work under the hood.\n\nTake arrays or loops, for example — these might seem basic, but they are present in almost every real-world application. Knowing how to use them efficiently gives you a huge edge in both interviews and project development.\n\nSo, if you're just getting started, invest time in understanding the “why” behind each concept. Read, ask questions, and build small projects that reinforce your fundamentals. The flash will follow — but let your foundation lead the way.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              // More from Author
              const SizedBox(height: 10),
              Text(
                AppTexts.moreFromThisAuthor,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              _buildMoreFromAuthor(context),
            ],
          ),
        ),
      ),
    );
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

  Widget _buildAuthorCard(BuildContext context) {
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
          AppButton(
            text: AppTexts.follow,
            onPressed: () {},
            type: ButtonType.info,
          ),
        ],
      ),
    );
  }

  _buildMoreFromAuthor(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const BlogCard();
      },
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemCount: 5,
    );
  }
}
