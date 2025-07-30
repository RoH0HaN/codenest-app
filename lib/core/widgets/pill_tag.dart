import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PillTag extends StatelessWidget {
  final String text;
  final Color color;
  final String iconPath;
  const PillTag({
    super.key,
    required this.text,
    required this.color,
    this.iconPath = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (iconPath != "") ...[
            const SizedBox(width: 5),
            SvgPicture.asset(
              iconPath,
              height: 18,
              width: 18,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
          ]
        ],
      ),
    );
  }
}
