import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final TextEditingController textController;

  const InputField({
    Key? key,
    required this.hintText,
    required this.textController,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.textController,
        textCapitalization: TextCapitalization.words,
        style: const TextStyle(
          color: Color(0xff78909c),
        ),
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
