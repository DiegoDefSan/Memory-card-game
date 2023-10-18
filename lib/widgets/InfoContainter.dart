import 'package:flutter/material.dart';
import 'package:jogo_memoria/widgets/texts/Header2.dart';

class InfoContainer extends StatefulWidget {
  final String title;
  final String subInfo;

  const InfoContainer({
    Key? key,
    required this.title,
    required this.subInfo,
  }) : super(key: key);

  @override
  State<InfoContainer> createState() => _InfoContainerState();
}

class _InfoContainerState extends State<InfoContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Color(0xFFd0d8ff),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Header2(text: widget.title, color: Color(0xFF140ef3)),
          Header2(text: widget.subInfo, color: Color(0xFF140ef3)),
        ],
      ),
    );
  }
}
