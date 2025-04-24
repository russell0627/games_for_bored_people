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
                  ref.read(goRouterProvider).pop();
                },
                child: const Text("Return to Menu", style: _textStyle),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PerfectGameDialog extends ConsumerWidget {
  final int score;
  final int numberOfQuestions;

  const PerfectGameDialog({super.key, required this.score, required this.numberOfQuestions});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("You answered all $numberOfQuestions questions correctly."),
              Text("Your final score is $score!"),
            ],
          ),
        ),
      ],
    );
  }
}

class HighScoreDialog extends ConsumerWidget {
  final int score;

  const HighScoreDialog({super.key, required this.score});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Text("You got a new high score!"), Text("Your final score was $score!")],
          ),
        ),
      ],
    );
  }
}

class OutOfLivesDialog extends ConsumerWidget {
  const OutOfLivesDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      children: [
        Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [Text("You ran out of lives!")]),
        ),
      ],
    );
  }
}
