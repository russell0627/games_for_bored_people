import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/routes.dart';
import '../../controllers/quiz_controller.dart';
import '../models/question.dart';

class QuizStatsPage extends ConsumerWidget {
  const QuizStatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Stats!"),
        leading: IconButton(
          onPressed: () {
            ref.read(goRouterProvider).pop();
            ref.read(goRouterProvider).pop();
            ref.read(goRouterProvider).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ListView(
              children: [
                for (Question value in state.incorrectQuestions)
                  ListTile(
                    title: Text(value.question),
                    leading: Text("Correct Answer: ${value.answers.toString()}"),
                    subtitle:
                        Text("Your Answer: ${state.incorrectQuestionAnswers[state.incorrectQuestions.indexOf(value)]}"),
                  )
              ],
            ),
            ListView(
              children: [
                for (Question value in state.questions)
                  ListTile(
                    title: Text(value.question),
                    subtitle: Text("Answers: ${value.answers.toString()}"),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
