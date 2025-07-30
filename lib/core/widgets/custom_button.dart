import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:flutter/material.dart';

enum ButtonType { success, error, info, warning }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final bool isOutlined;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.type,
    this.isOutlined = false,
  });

  Color _getColor(BuildContext context) {
    switch (type) {
      case ButtonType.success:
        return context.successColor;
      case ButtonType.error:
        return context.errorColor;
      case ButtonType.info:
        return context.infoColor;
      case ButtonType.warning:
        return context.warningColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor(context);

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor:
            isOutlined ? Colors.transparent : color.withOpacity(0.15),
        foregroundColor: color,
        side: BorderSide(color: color, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
