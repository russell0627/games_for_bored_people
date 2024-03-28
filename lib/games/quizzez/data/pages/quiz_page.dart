import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/screen_utils.dart';
import '../../controllers/quiz_controller.dart';
import '../../controllers/quiz_state.dart';
import '../../widgets/dialogs/game_finished_dialog.dart';
import '../../widgets/dialogs/reset_game_dialog.dart';
import '../../widgets/logo_display.dart';
import '../../widgets/question_display.dart';
import '../animals.dart';
import '../dinosaurs.dart';
import '../models/animal.dart';
import '../models/dinosaur.dart';
import '../models/plant.dart';
import '../models/question.dart';
import '../models/space_object.dart';
import 'home.dart';

//168 Different Questions, 3 per Dinosaur.

class QuizPage extends ConsumerWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizControllerProvider);
    final ctrl = ref.watch(quizControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: LogoDisplay(
          imagePath: QuizState.imagePath,
          imageName: state.questionType == QuestionType.dinosaur ? "parasaurolophus_icon.png" : "galaxy_icon.png",
          imagePadding: med,
          fontFamily: state.questionType == QuestionType.dinosaur ? "dinosauce" : "Induction",
          text: state.questionType == QuestionType.dinosaur ? ["Dinosaur", "Quiz"] : ["Space", "Quiz"],
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))],
      ),

      //
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  '${QuizState.imagePath}${state.questionType == QuestionType.dinosaur ? "herd_of_plesiosaurs.png" : "blue_and_purple_planet.png"}'),
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
              if (state.score == state.questions.length) ...[
                Text(
                  "Question: ${state.questionIndex + 1}/${state.questions.length}",
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
                  child: QuestionDisplay(
                    key: ObjectKey(state.questions[state.questionIndex]),
                    question: state.questions[state.questionIndex],
                    onComplete: (answeredOnFirstTry) {
                      ctrl.nextQuestion(answeredOnFirstTry: answeredOnFirstTry);
                    },
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
