import 'package:flutter/material.dart';
import 'package:jogo_memoria/widgets/texts/TextInterface.dart';

class Header2 extends TextInterface {
  const Header2({
    Key? key,
    double fontSize = 20,
    bool isBold = true,
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
