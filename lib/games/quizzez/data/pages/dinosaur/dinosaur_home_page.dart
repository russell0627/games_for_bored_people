import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/routes.dart';
import '../../../../../settings_dialog.dart';
import '../../../../../utils/screen_utils.dart';
import '../../../controllers/quiz_controller.dart';
import '../../../controllers/quiz_state.dart';
import '../../../widgets/logo_display.dart';
import '../../models/question.dart';
import '../find_item.dart';
import 'dinosaur_viewer.dart';

const dinosaurButtonTextStyle = TextStyle(
  fontFamily: "erasaur",
  fontSize: 18,
);

class DinosaurHomePage extends ConsumerWidget {
  const DinosaurHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const LogoDisplay(
          imagePath: QuizState.dinosaurImagePath,
          imageName: "parasaurolophus_icon.png",
          imagePadding: 8.0,
          fontFamily: "dinosauce",
          text: ["Dinosaur", "Quiz"],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const SettingsDialog(),
              );
            },
          ),
        ],
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("${QuizState.dinosaurImagePath}cretaceous_landscape.png"), fit: BoxFit.cover),
        ),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 150),
              Text("Highest Score: ${state.highestScore}"),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => context.pushNamed(AppRoute.quizLength.name),
                child: const Text(
                  "Start Dinosaur Quiz!",
                  style: dinosaurButtonTextStyle,
                ),
              ),
              boxXXL,
              ElevatedButton(
                onPressed: () => context.pushNamed(AppRoute.taxonomyPage.name),
                child: const Text(
                  "Taxonomy of Dinosaurs",
                  style: dinosaurButtonTextStyle,
                ),
              ),
              boxXXL,
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const FindItemPage(
                          itemType: QuestionType.dinosaur,
                        ))),
                child: const Text(
                  "Find a Dinosaur",
                  style: dinosaurButtonTextStyle,
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const
                    DinosaurViewer()
                )),
                child: const Text(
                  "Dinosaur Viewer",
                  style: dinosaurButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
