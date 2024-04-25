import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/screen_utils.dart';
import '../controllers/quiz_controller.dart';
import 'dialogs/incorrect_answer_dialog.dart';

class QuestionDisplay extends ConsumerStatefulWidget {
  final ValueChanged<bool> onComplete;

  const QuestionDisplay({super.key, required this.onComplete});

  @override
  ConsumerState<QuestionDisplay> createState() => _QuestionDisplayState();
}

class _QuestionDisplayState extends ConsumerState<QuestionDisplay> {
  bool answeredOnFirstTry = true;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(quizControllerProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          state.questions[state.questionIndex].question,
          style: const TextStyle(fontSize: 16),
        ),
        boxM,
        Expanded(
          child: SingleChildScrollView(
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final option in state.questions[state.questionIndex].options)
                    TextButton(
                      onPressed: () {
                        for(int i = 0; i < state.questions[state.questionIndex].answers.length; i++) {
                          state.questions[state.questionIndex].answers[i] == option ? widget.onComplete(answeredOnFirstTry) : _onIncorrectAnswer(context);
                      }
                      },
                      child: Text(option.toString()),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onIncorrectAnswer(BuildContext context) {
    showDialog(context: context, builder: (_) => const IncorrectAnswerDialog());

    answeredOnFirstTry = false;
  }
}
