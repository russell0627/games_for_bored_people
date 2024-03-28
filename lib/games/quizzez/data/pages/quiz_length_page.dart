import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/screen_utils.dart';
import '../../controllers/quiz_controller.dart';
import '../../controllers/quiz_state.dart';
import '../../widgets/dialogs/invalid_quiz_length_dialog.dart';
import '../models/question.dart';
import 'home.dart';
import 'quiz_page.dart';

class QuizLengthPage extends ConsumerStatefulWidget {
  final int maxQuizLength;
  final int minQuizLength;
  final QuestionType questionType;

  const QuizLengthPage(
      {Key? key, required this.maxQuizLength, required this.minQuizLength, this.questionType = QuestionType.dinosaur})
      : super(key: key);

  @override
  ConsumerState<QuizLengthPage> createState() => _QuizLengthPageState();
}

class _QuizLengthPageState extends ConsumerState<QuizLengthPage> {
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
              image: AssetImage(widget.questionType == QuestionType.dinosaur
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
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    onChanged: (value) {
                      quizLength = int.tryParse(value) ?? 0;
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
                  "MIN: ${widget.minQuizLength}, MAX: ${widget.maxQuizLength}",
                  style: const TextStyle(fontFamily: "Merienda"),
                ),
                boxXXL,
                ElevatedButton(
                  onPressed: () {
                    if (quizLength > widget.maxQuizLength || quizLength < widget.minQuizLength) {
                      showDialog(context: context, builder: (_) => const InvalidQuizLengthDialog());
                      return;
                    }
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => QuizPage()));
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
