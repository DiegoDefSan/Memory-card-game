import 'package:flutter/material.dart';
import 'package:jogo_memoria/widgets/texts/TextInterface.dart';

class Header1 extends TextInterface {
  const Header1({
    Key? key,
    double fontSize = 24,
    bool isBold = true,
    required String text,
    Color color = Colors.black,
  }) : super(
          key: key,
          fontSize: fontSize,
          isBold: isBold,
          text: text,
          color: color,
        );

  @override
  Widget build(BuildContext context);
}
