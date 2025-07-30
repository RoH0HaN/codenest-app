import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/core/constants/app_texts.dart';
import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/core/widgets/custom_button.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoteTile extends StatelessWidget {
  final String title;
  final String description;
  final String tags;
  final String fileType;
  final bool isBookmarked;
  final VoidCallback onSeeAttachments;
  final VoidCallback onBookmarkPressed;

  const NoteTile({
    super.key,
    required this.title,
    required this.description,
    required this.tags,
    required this.onSeeAttachments,
    required this.onBookmarkPressed,
    required this.fileType,
    required this.isBookmarked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: context.backgroundCard,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + Bookmark
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title + Desc
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: onBookmarkPressed,
                icon: SvgPicture.asset(
                  isBookmarked
                      ? AppIcons.bookmarkActive
                      : AppIcons.bookmarkInactive,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    context.iconThemeColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),

          // Tags and Button
          // Tags

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.cardPaddingWidth,
                      vertical: Sizes.cardPaddingHeight),
                  decoration: BoxDecoration(
                    color: context.infoColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    tags,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: context.infoColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.cardPaddingWidth,
                    vertical: Sizes.cardPaddingHeight),
                decoration: BoxDecoration(
                  color: context.warningColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(fileType,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: context.warningColor,
                        fontWeight: FontWeight.bold)),
              ),

              // Button
            ],
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: double.infinity,
            child: AppButton(
              text: AppTexts.seeAttachments,
              onPressed: onSeeAttachments,
              type: ButtonType.success,
            ),
          ),
        ],
      ),
    );
  }
}
