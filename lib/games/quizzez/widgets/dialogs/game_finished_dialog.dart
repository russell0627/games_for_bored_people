import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../app/routes.dart';

const TextStyle _textStyle = TextStyle(fontFamily: "erasaur");

class GameFinishedDialog extends ConsumerWidget {
  final int score;
  final int numberOfQuestions;

  const GameFinishedDialog({super.key, required this.score, required this.numberOfQuestions});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("You Finished The Game!", style: _textStyle),
              Text("You got $score out of $numberOfQuestions correct!", style: _textStyle),
              TextButton(
                onPressed: () {
                  SmartDialog.dismiss();
                  ref.read(goRouterProvider).push(AppRoute.quizStats.name);
                },
                child: const Text(
                  "View Stats",
                  style: _textStyle,
                ),
              ),
              TextButton(
                onPressed: () {
                  SmartDialog.dismiss();
                  ref.read(goRouterProvider).pop();
                },
                child: const Text(
                  "Return to Menu",
                  style: _textStyle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
