import 'package:flutter/material.dart';

class RaceWinDialog extends StatelessWidget {
  final int frog;
  const RaceWinDialog({super.key, required this.frog});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Frog $frog wins!"),
    );
  }
}

