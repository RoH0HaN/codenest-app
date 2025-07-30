import 'package:codenest/routes/route_names.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constants/app_icons.dart';
import '../constants/sizes.dart';
import 'square_pill.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        RouteNames.studentBlogDetails,
        preventDuplicates: false,
        /*
        Get.toNamed() is pushing the same route (studentBlogDetails) again, which Flutter prevents by design unless the data is different or forced.
        */
      ),
      child: Stack(
        children: [
          Container(
            height: 160,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.cardPaddingWidth,
              vertical: Sizes.cardPaddingHeight,
            ),
            decoration: BoxDecoration(
              color: context.backgroundCard,
              border: Border.all(
                color: context.borderColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: context.borderColor),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://contenthub-static.grammarly.com/blog/wp-content/uploads/2017/11/how-to-write-a-blog-post.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How I Landed My First Internship Through LeetCode Practices",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "From practicing two questions a day to acing the tech interview, here’s my journey. I share how focused DSA prep and a consistent routine can lead to my first internship through LeetCode practices.",
                        style: Theme.of(context).textTheme.labelLarge,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Prof. Zunaid Ahammed",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: SvgPicture.asset(
              AppIcons.dotSmall,
              height: 18,
              width: 18,
              colorFilter:
                  ColorFilter.mode(context.errorColor, BlendMode.srcIn),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SquarePill(
              text: "24th, Apr 25",
              color: context.warningColor,
              bottomRight: 10,
            ),
          ),
        ],
      ),
    );
  }
}
