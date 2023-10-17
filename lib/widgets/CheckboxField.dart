import 'package:flutter/material.dart';

class CheckboxField extends StatefulWidget {
  final String labelText;
  final bool checked;

  const CheckboxField({
    Key? key,
    required this.labelText,
    this.checked = false,
  }) : super(key: key);

  @override
  State<CheckboxField> createState() => _CheckboxFieldState();
}

class _CheckboxFieldState extends State<CheckboxField> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.checked;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Text(widget.labelText),
      ],
    );
  }
}
