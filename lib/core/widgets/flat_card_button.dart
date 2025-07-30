import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_icons.dart';
import '../constants/sizes.dart';

class FlatCardButton extends StatelessWidget {
  final String prefixIconPath;
  final String text;
  final Color color;
  final VoidCallback? onPressed;

  const FlatCardButton({
    super.key,
    required this.prefixIconPath,
    required this.text,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.cardPaddingWidth,
          vertical: Sizes.cardPaddingHeight,
        ),
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              prefixIconPath,
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: color),
            ),
            SvgPicture.asset(
              AppIcons.mouse,
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}
