import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final void Function() onPressed;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFFe18544), // ARGB format: 0xAARRGGBB
    this.textColor = Colors.white,
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
      child: Text(
        widget.text,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
