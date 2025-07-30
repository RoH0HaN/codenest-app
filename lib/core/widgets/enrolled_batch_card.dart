import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/core/widgets/pill_tag.dart';
import 'package:codenest/core/widgets/square_pill.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EnrolledBatchCard extends StatelessWidget {
  final VoidCallback? onPressed;

  const EnrolledBatchCard({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(Sizes.cardPaddingWidth),
        decoration: BoxDecoration(
          color: context.backgroundCard,
          border: Border.all(color: context.borderColor),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: context.borderColor),
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://i.ytimg.com/vi/q-o3__hbDKc/hq720.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Data Structure and Algorithms",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            PillTag(
                              text: "65",
                              color: context.infoColor,
                              iconPath: AppIcons.notesSmall,
                            ),
                            const SizedBox(width: 10),
                            PillTag(
                              text: "98",
                              color: context.successColor,
                              iconPath: AppIcons.percentageSmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Prof. Zunaid Ahammed",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SquarePill(
                        text: "20th, Jan 25",
                        color: context.warningColor,
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        AppIcons.goto,
                        height: 24,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                          context.successColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
