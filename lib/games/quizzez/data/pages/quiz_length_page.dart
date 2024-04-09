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
  bool includeCladeQuestions = true;
  bool includeTimePeriodQuestions = true;
  bool includeOtherQuestions = true;
  int quizLength = 0;

  @override
  Widget build(
    BuildContext context,
  ) {
    final state = ref.read(quizControllerProvider);
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                QuestionSwitches(switches: getSwitches(state.questionType)),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    onChanged: (value) {
                      quizLength = int.tryParse(value) ?? getMinQuizLength(state.questionType);
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
                Text(
                  "MIN: ${getMinQuizLength(state.questionType)}, MAX: ${getMaxQuizLength(state.questionType)}",
                  style: const TextStyle(fontFamily: "Merienda"),
                ),
                boxXXL,
                ElevatedButton(
                  onPressed: () {
                    if (quizLength > getMaxQuizLength(state.questionType) ||
                        quizLength < getMinQuizLength(state.questionType)) {
                      showDialog(context: context, builder: (_) => const InvalidQuizLengthDialog());
                      return;
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

  List<Widget> getSwitches(QuestionType questionType) {
    final state = ref.read(quizControllerProvider);

    if (questionType == QuestionType.dinosaur) {
      return [
        const Text("Include Clade Questions"),
        Switch(
          value: state.includeCladeQuestions,
          onChanged: (_) => state.copyWith(includeCladeQuestions: !state.includeCladeQuestions),
        ),
        const Text("Include Time Period Questions"),
        Switch(
          value: includeTimePeriodQuestions,
          onChanged: (_) => state.copyWith(includeTimePeriodQuestions: !state.includeTimePeriodQuestions),
        ),
        const Text("Include Diet Questions"),
        Switch(
          value: state.includeDietQuestions,
          onChanged: (_) => state.copyWith(includeDietQuestions: !state.includeDietQuestions),
        ),
        const Text("Include Other Questions"),
        Switch(
          value: state.includeOtherQuestions,
          onChanged: (_) => state.copyWith(includeOtherQuestions: !state.includeOtherQuestions),
        ),
      ];
    }
    return [];
  }

  int getMinQuizLength(QuestionType questionType) =>
      questionType == QuestionType.dinosaur ? QuizState.minQuizLength : QuizState.spaceMinQuizLength;

  int getMaxQuizLength(QuestionType questionType) =>
      questionType == QuestionType.dinosaur ? QuizState.maxQuizLength : QuizState.spaceMaxQuizLength;
}

class QuestionSwitches extends StatelessWidget {
  final List<Widget> switches;

  const QuestionSwitches({super.key, required this.switches});

  @override
  Widget build(BuildContext context) {
    return const Column();
  }
}

