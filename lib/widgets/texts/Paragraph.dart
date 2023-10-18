import 'package:flutter/material.dart';
import 'package:jogo_memoria/widgets/texts/TextInterface.dart';

class Paragraph extends TextInterface {
  const Paragraph({
    Key? key,
    double fontSize = 16,
    bool isBold = false,
    Color color = Colors.black,
    required String text,
  }) : super(
          key: key,
          fontSize: fontSize,
          isBold: isBold,
          color: color,
          text: text,
        );

  @override
  Widget build(BuildContext context);
}
