import 'package:flutter/material.dart';

class SquarePill extends StatelessWidget {
  final String text;
  final Color color;
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;

  const SquarePill({
    super.key,
    required this.text,
    required this.color,
    this.topLeft = 2,
    this.topRight = 2,
    this.bottomLeft = 2,
    this.bottomRight = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
