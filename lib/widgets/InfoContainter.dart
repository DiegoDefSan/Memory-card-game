import 'package:flutter/material.dart';
import 'package:jogo_memoria/widgets/texts/Paragraph.dart';

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
      width: 170,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFffffff),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: const Color(0xFF78909c),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Paragraph(
          text: "${widget.title}: ${widget.subInfo}",
          color: const Color(0xFF000000),
        ),
      ),
    );
  }
}
