import 'package:flutter/material.dart';

import '/constants/widgets.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.inputLabel,
    this.inputType = kInputTypes.itText
  }) : super(key: key);

  final String inputLabel;
  final kInputTypes inputType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        obscureText: inputType == kInputTypes.itPassword,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: inputLabel,
        ),
      ),
    );
  }
}

