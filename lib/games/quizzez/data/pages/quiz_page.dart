import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/screen_utils.dart';
import '../../controllers/quiz_controller.dart';
import '../../controllers/quiz_state.dart';
import '../../widgets/logo_display.dart';
import '../models/question.dart';

//168 Different Questions, 3 per Dinosaur. 56 per category

class QuizPage extends ConsumerWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizControllerProvider);
    final ctrl = ref.read(quizControllerProvider.notifier);

    // print("QUESTIONS: ${state.questions.length}");
    // print("QUESTION INDEX: ${state.questionIndex}");

    return Scaffold(
      appBar: AppBar(
        title: LogoDisplay(
          imagePath:
              state.questionType == QuestionType.dinosaur ? QuizState.dinosaurImagePath : QuizState.spaceImagePath,
          imageName: state.questionType == QuestionType.dinosaur ? "parasaurolophus_icon.png" : "galaxy_icon.png",
          imagePadding: med,
          fontFamily: state.questionType == QuestionType.dinosaur ? "dinosauce" : "Induction",
          text: state.questionType == QuestionType.dinosaur ? ["Dinosaur", "Quiz"] : ["Space", "Quiz"],
        ),
        actions: [Text("Lives: ${state.lives}/3"), IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))],
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  '${state.questionType == QuestionType.dinosaur ? QuizState.dinosaurImagePath : QuizState.spaceImagePath}${state.questionType == QuestionType.dinosaur ? "herd_of_plesiosaurs.png" : "blue_and_purple_planet.png"}'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Score: ${state.score}",
                style: const TextStyle(fontSize: 16, fontFamily: "erasaur"),
              ),
              if (state.score != state.questions.length) ...[
                Text(
                  "Question: ${state.questionIndex + 1}/${ state.endlessQuiz == false?state.questions.length : "INFINITY!"}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "Merienda",
                  ),
                ),
                Padding(
                  padding: paddingAllL,
                  child: DecoratedBox(
                    position: DecorationPosition.foreground,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: med,
                        color: const Color(0xFF452C09),
                      ),
                    ),
                    child: Padding(
                      padding: paddingAllM,
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset(state.questions[state.questionIndex].imageFilename ??
                            "${QuizState.dinosaurImagePath}triceratops.jpg"),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
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
                                      ctrl.nextQuestion(
                                        answer: option,
                                      );
                                    },
                                    child: Text(option.toString()),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
