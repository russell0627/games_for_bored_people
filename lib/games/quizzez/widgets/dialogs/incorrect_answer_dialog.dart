import 'package:flutter/material.dart';

class IncorrectAnswerDialog extends StatelessWidget {
  const IncorrectAnswerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Incorrect!"),
          Text("Try Again!"),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Close"),
        ),
      ],
    );
  }
}
