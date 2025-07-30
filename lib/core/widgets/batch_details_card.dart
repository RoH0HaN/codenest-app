import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/core/widgets/pill_tag.dart';
import 'package:codenest/core/widgets/square_pill.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:flutter/material.dart';

class BatchDetailsCard extends StatelessWidget {
  const BatchDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Data Structure and Algorithms",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  "Master the building blocks of efficient coding. Learn Data Structure and Algorithms to become a master in coding. Get ready for the Coding Interviews and job opportunities.",
                  style: Theme.of(context).textTheme.labelLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  "Prof. Zunaid Ahammed",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                Row(
                  children: [
                    PillTag(
                      text: "B.Tech",
                      color: context.infoColor,
                    ),
                    const SizedBox(width: 10),
                    PillTag(
                      text: "Ongoing",
                      color: context.successColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SquarePill(text: "20th, Mar 25", color: context.successColor),
              const SizedBox(height: 5),
              SquarePill(text: "15th, Jun 25", color: context.errorColor),
              const Spacer(),
              PillTag(
                text: "98",
                color: context.successColor,
                iconPath: AppIcons.percentageSmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
