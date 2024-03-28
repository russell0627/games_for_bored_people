import 'package:flutter/material.dart';

import '../../../../../settings_dialog.dart';
import '../../../../../utils/screen_utils.dart';
import '../../../controllers/quiz_state.dart';
import '../../../widgets/logo_display.dart';
import '../../models/question.dart';
import '../find_item.dart';
import '../quiz_home.dart';
import '../quiz_length_page.dart';
import 'taxonomy_of_dinosaurs_page.dart';

const dinosaurButtonTextStyle = TextStyle(
  fontFamily: "erasaur",
  fontSize: 18,
);

class DinosaurHomePage extends StatefulWidget {
  const DinosaurHomePage({super.key});

  @override
  State<DinosaurHomePage> createState() => _DinosaurHomePageState();
}

class _DinosaurHomePageState extends State<DinosaurHomePage> {
  @override
  Widget build(BuildContext context) {
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
              setState(() {
                showDialog(
                  context: context,
                  builder: (context) => const SettingsDialog(),
                );
              });
            },
          ),
        ],
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("${QuizState.dinosaurImagePath}cretaceous_landscape.png"), fit: BoxFit.cover),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 150),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const QuizLengthPage())),
                    child: const Text(
                      "Start Dinosaur Quiz!",
                      style: dinosaurButtonTextStyle,
                    ),
                  ),
                  boxXXL,
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TypesOfDinosaursPage())),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
