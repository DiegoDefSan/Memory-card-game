import 'package:flutter/material.dart';

abstract class TextInterface extends StatelessWidget {
  final double fontSize;
  final bool isBold;
  final String text;
  final Color color;

  const TextInterface({
    Key? key,
    required this.fontSize,
    required this.isBold,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
    );
  }
}
