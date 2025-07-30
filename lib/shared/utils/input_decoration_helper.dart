import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

InputDecoration inputDecorationHelper({
  required BuildContext context,
  required String hint,
  required String iconPath,
  Widget? suffix,
}) {
  return InputDecoration(
    hintText: hint,
    prefixIcon: Padding(
      padding: const EdgeInsets.all(Sizes.prefixIconPadding),
      child: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(context.iconThemeColor, BlendMode.srcIn),
      ),
    ),
    suffixIcon: suffix,
    prefixIconConstraints: const BoxConstraints(minHeight: 24, minWidth: 40),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: context.borderColor, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: context.borderColor, width: 2),
    ),
  );
}
