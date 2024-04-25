import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

class GameFailDialog extends StatelessWidget {
  const GameFailDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: Image.asset("assets/extraterrestrial_extermination/bloody_handprint.png"),
        ),
        const Text("You Failed! The aliens have murdered you and your crew, and stolen your ship."),
        TextButton(
            onPressed: () {
              SmartDialog.dismiss();
              context.pop();
            },
            child: const Text("Continue"))
      ],
    );
  }
}
