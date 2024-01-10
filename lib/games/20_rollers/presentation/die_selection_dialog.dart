import 'package:flutter/material.dart';

import '20_rollers.dart';

class DieSelectionDialog extends StatelessWidget {
  const DieSelectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          DropdownButton<String>(
            value: "d6",
            items: const [
              DropdownMenuItem<String>(child: Text("d6"), value: "d6",),
              DropdownMenuItem<String>(child: Text("d8"), value: "d8",),
              DropdownMenuItem<String>(child: Text("d12"), value: "d10",),
              DropdownMenuItem<String>(child: Text("d20"), value: "d12",),
            ],
            onChanged: (newValue) {
              // if (newValue == "d6") {
              //   currentDie = CurrentDie.d6;
              // }
              // if (newValue == "d8") {
              //   currentDie = CurrentDie.d8;
              // }
              // if (newValue == "d12") {
              //   currentDie = CurrentDie.d12;
              // }
              // if (newValue == "d20") {
              //   currentDie = CurrentDie.d20;
              // }
            },
          ),
          TextButton(
              onPressed: () =>
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TwentyRollersGame())),
              child: const Text("Play!"))
        ],
      ),
    );
  }
}
