import 'package:flutter/material.dart';
import '../utils/GameCard.dart';

class CardContainer extends StatefulWidget {
  final GameCard card;
  bool isFlipped = false; // false = back, true = front

  CardContainer({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  State<CardContainer> createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.isFlipped = !widget.isFlipped;
          });
        },
        child: Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: Color(0xFF00C2DF),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: widget.isFlipped
                ? widget.card.value is String
                    ? Image.asset(widget.card.value)
                    : Text(
                        widget.card.value.toString(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      )
                : const Icon(Icons.bakery_dining_outlined),
          ),
        ),
      ),
    );
  }
}
