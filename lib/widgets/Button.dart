import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final void Function() onPressed;

  const Button({
    Key? key,
    required this.text,
    this.backgroundColor =
        const Color.fromARGB(255, 3, 4, 94), // ARGB format: 0xAARRGGBB
    this.textColor = Colors.white,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.backgroundColor,
        foregroundColor: widget.textColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      ),
      child: Text(widget.text),
    );
  }
}
