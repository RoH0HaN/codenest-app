import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum CurriculumStatus { ongoing, completed }

class CurriculumTile extends StatefulWidget {
  final String title;
  final CurriculumStatus status;
  final List<String> topics;

  const CurriculumTile({
    super.key,
    required this.title,
    required this.status,
    required this.topics,
  });

  @override
  State<CurriculumTile> createState() => _CurriculumTileState();
}

class _CurriculumTileState extends State<CurriculumTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.backgroundCard,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isExpanded
              ? widget.status == CurriculumStatus.ongoing
                  ? context.warningColor.withOpacity(0.35)
                  : context.successColor.withOpacity(0.35)
              : context.borderColor,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                widget.status == CurriculumStatus.ongoing
                    ? AppIcons.hourglassSmall
                    : AppIcons.tickSmall,
                height: 18,
                width: 18,
                colorFilter: ColorFilter.mode(
                  widget.status == CurriculumStatus.ongoing
                      ? context.warningColor
                      : context.successColor,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(width: 6),
              IconButton(
                onPressed: () => setState(() => isExpanded = !isExpanded),
                icon: SvgPicture.asset(
                  isExpanded
                      ? AppIcons.arrowDownSmall
                      : AppIcons.arrowLeftSmall,
                  height: 20,
                  width: 20,
                  colorFilter:
                      ColorFilter.mode(context.iconThemeColor, BlendMode.srcIn),
                ),
              ),
            ],
          ),
          if (isExpanded) ...[
            Divider(color: context.borderColor),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.topics
                  .map(
                    (topic) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        topic,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  )
                  .toList(),
            )
          ]
        ],
      ),
    );
  }
}
