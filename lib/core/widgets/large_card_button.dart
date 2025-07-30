import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_button.dart';

class LargeCardButton extends StatelessWidget {
  final String iconPath;
  final Color color;
  final String text;
  final ButtonType type;
  final VoidCallback onPressed;

  const LargeCardButton({
    super.key,
    required this.iconPath,
    required this.color,
    required this.text,
    required this.type,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      // width: 180,
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 70,
            width: 70,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: AppButton(
              text: text,
              onPressed: onPressed,
              type: type,
            ),
          ),
        ],
      ),
    );
  }
}
