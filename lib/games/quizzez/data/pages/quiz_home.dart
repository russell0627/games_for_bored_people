import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/screen_utils.dart';
import '../../controllers/quiz_controller.dart';
import '../models/question.dart';
import 'credits_page.dart';
import 'dinosaur/dinosaur_home_page.dart';
import 'quiz_length_page.dart';

//TODO: Create plant quiz and finish animal quiz.

class QuizzezHomePage extends ConsumerWidget {
  const QuizzezHomePage({super.key, required this.title});

  final String title;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctrl = ref.read(quizControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quizzes"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DinosaurHomePage()));
              },
              child: const Text(
                "Go To Dinosaur Quiz",
                style: TextStyle(
                  fontFamily: "erasaur",
                ),
              ),
            ),
            boxXXL,
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (_) => const QuizLengthPage(),
            //       ),
            //     );
            //   },
            //   child: const Text(
            //     "Go To Space Quiz",
            //     style: TextStyle(
            //       fontFamily: "Andromeda",
            //       fontSize: 22,
            //     ),
            //   ),
            // ),
            // boxXXL,
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      ctrl.updateQuestionType(QuestionType.music);
                      return QuizLengthPage();
                    },
                  ),
                );
              },
              child: const Text(
                "Go To Music Quiz",
                style: TextStyle(
                  fontFamily: "Andromeda",
                  fontSize: 22,
                ),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CreditsPage())),
              child: const Text(
                "Credits",
                style: TextStyle(fontFamily: "Merienda"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
