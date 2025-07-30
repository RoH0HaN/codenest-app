import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class AnnouncementTile extends StatelessWidget {
  final String title;
  final String description;
  final DateTime date;

  const AnnouncementTile({
    super.key,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.cardPaddingWidth,
        vertical: Sizes.cardPaddingHeight,
      ),
      decoration: BoxDecoration(
        color: context.backgroundCard,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: context.borderColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 5),
                Text(
                  _formattedDate(date),
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.infoColor,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          SvgPicture.asset(
            AppIcons.read,
            height: 24,
            width: 24,
            colorFilter: ColorFilter.mode(
              context.successColor,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }

  String _formattedDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference.inDays > 5) {
      final day = date.day;
      final suffix = _getDaySuffix(day);
      final formatted = DateFormat("MMM, yy").format(date); // e.g. Jan, 25
      return "$day$suffix $formatted"; // e.g. 20th Jan, 25
    } else if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inMinutes} minutes ago';
    }
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) return 'th';
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
