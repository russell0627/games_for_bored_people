import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/screen_utils.dart';
import '../../controllers/quiz_controller.dart';
import '../../controllers/quiz_state.dart';
import '../../widgets/dialogs/invalid_quiz_length_dialog.dart';
import '../models/question.dart';
import 'quiz_page.dart';

class QuizLengthPage extends ConsumerStatefulWidget {
  const QuizLengthPage({super.key});

  @override
  ConsumerState<QuizLengthPage> createState() => _QuizLengthPageState();
}

class _QuizLengthPageState extends ConsumerState<QuizLengthPage> {
  int quizLength = 0;

  @override
  Widget build(
    BuildContext context,
  ) {
    final state = ref.watch(quizControllerProvider);
    final ctrl = ref.read(quizControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quiz Length",
          style: TextStyle(
            fontFamily: "erasaur",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(state.questionType == QuestionType.dinosaur
                  ? "${QuizState.dinosaurImagePath}triceratops_in_a_forest.png"
                  : "${QuizState.spaceImagePath}blue_and_purple_planet.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: state.questionType == QuestionType.music ? Column(
              children: [                  SizedBox(
                width: 300,
                child: TextFormField(
                  onChanged: (value) {
                    quizLength = int.tryParse(value) ?? state.minQuizLength;
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    label: Text(
                      "Choose A Quiz Length",
                      style: TextStyle(fontFamily: "Merienda"),
                    ),
                  ),
                ),
              ),
                if (state.endlessQuiz == false)
                  Text(
                    "MIN: ${state.minQuizLength}, MAX: ${state.maxQuizLength}",
                    style: const TextStyle(fontFamily: "Merienda"),
                  ),
                boxXXL,
                ElevatedButton(
                  onPressed: () {
                    if (quizLength > state.maxQuizLength || quizLength < state.minQuizLength) {
                      showDialog(context: context, builder: (_) => const InvalidQuizLengthDialog());
                      return;
                    }
                    if (!state.includeTimePeriodQuestions &&
                        !state.includeTaxonomyQuestions &&
                        !state.includeDietQuestions &&
                        !state.includeOtherQuestions) {
                      showDialog(context: context, builder: (_) => const InvalidQuizLengthDialog());
                    }
                    if (state.endlessQuiz == false) {
                      ctrl.updateQuizLength(quizLength);
                    }
                    Navigator.of(context).pop();
                    ctrl.resetQuestions();
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const QuizPage()));
                  },
                  child: const Text(
                    "Start Quiz",
                    style: TextStyle(fontFamily: "erasaur"),
                  ),
                ),
              ],
            ) : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Include Taxonomy Questions"),
                Switch(
                  value: state.includeTaxonomyQuestions,
                  onChanged: (_) => ctrl.updateQuestionTypes(
                    includeTaxonomyQuestions: !state.includeTaxonomyQuestions,
                  ),
                ),
                const Text("Include Time Period Questions"),
                Switch(
                  value: state.includeTimePeriodQuestions,
                  onChanged: (value) => ctrl.updateQuestionTypes(
                    includeTimePeriodQuestions: !state.includeTimePeriodQuestions,
                  ),
                ),
                const Text("Include Diet Questions"),
                Switch(
                  value: state.includeDietQuestions,
                  onChanged: (_) => ctrl.updateQuestionTypes(
                    includeDietQuestions: !state.includeDietQuestions,
                  ),
                ),
                const Text("Include Other Questions"),
                Switch(
                  value: state.includeOtherQuestions,
                  onChanged: (_) => ctrl.updateQuestionTypes(
                    includeOtherQuestions: !state.includeOtherQuestions,
                  ),
                ),
                const Text("1 Life Mode"),
                Switch(
                  value: state.includeOtherQuestions,
                  onChanged: (_) => ctrl.updateQuestionTypes(
                    includeOtherQuestions: !state.includeOtherQuestions,
                  ),
                ),
                const Text("Endless Quiz"),
                Switch(
                  value: state.endlessQuiz,
                  onChanged: (_) { ctrl.updateQuestionTypes(
                    endlessQuiz: !state.endlessQuiz,
                  );
                  quizLength = state.maxQuizLength;
                  }
                ),
                if (state.endlessQuiz == false)
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      onChanged: (value) {
                        quizLength = int.tryParse(value) ?? state.minQuizLength;
                      },
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        label: Text(
                          "Choose A Quiz Length",
                          style: TextStyle(fontFamily: "Merienda"),
                        ),
                      ),
                    ),
                  ),
                if (state.endlessQuiz == false)
                  Text(
                    "MIN: ${state.minQuizLength}, MAX: ${state.maxQuizLength}",
                    style: const TextStyle(fontFamily: "Merienda"),
                  ),
                boxXXL,
                  ElevatedButton(
                    onPressed: () {
                      if (quizLength > state.maxQuizLength || quizLength < state.minQuizLength) {
                        showDialog(context: context, builder: (_) => const InvalidQuizLengthDialog());
                        return;
                      }
                      if (!state.includeTimePeriodQuestions &&
                          !state.includeTaxonomyQuestions &&
                          !state.includeDietQuestions &&
                          !state.includeOtherQuestions) {
                        showDialog(context: context, builder: (_) => const InvalidQuizLengthDialog());
                      }

                      if (state.oneLifeMode) {
                        ctrl.updateLifeCount(1);
                      }

                    if (state.endlessQuiz == false) {
                        ctrl.updateQuizLength(quizLength);
                      }
                      Navigator.of(context).pop();
                      ctrl.resetQuestions();
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const QuizPage()));
                    },
                    child: const Text(
                      "Start Quiz",
                      style: TextStyle(fontFamily: "erasaur"),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

