import 'package:flutter/material.dart';

class CheckboxField extends StatefulWidget {
  final String labelText;
  final bool checked;
  final Function(bool) onChecked;

  const CheckboxField({
    Key? key,
    required this.labelText,
    this.checked = false,
    required this.onChecked,
  }) : super(key: key);

  @override
  State<CheckboxField> createState() => _CheckboxFieldState();
}

class _CheckboxFieldState extends State<CheckboxField> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
              widget.onChecked(isChecked);
            });
          },
          activeColor: const Color.fromARGB(255, 3, 4, 94),
        ),
        Text(widget.labelText),
      ],
    );
  }
}
