import 'package:flutter/material.dart';

import '../../widgets/logo_display.dart';
import 'quiz_length_page.dart';

class SpaceHomePage extends StatefulWidget {
  const SpaceHomePage({super.key});

  @override
  State<SpaceHomePage> createState() => _SpaceHomePageState();
}

class _SpaceHomePageState extends State<SpaceHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoDisplay(
            imagePath: "", imageName: "", imagePadding: 0, fontFamily: "Induction", text: ["Space", "Quiz"]),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const QuizLengthPage())),
              child: const Text("Start Quiz"),
            )
          ],
        ),
      ),
    );
  }
}
