import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/screen_utils.dart';
import '../../controllers/quiz_state.dart';
import '../../widgets/link_button.dart';

class CreditsPage extends ConsumerWidget {
  const CreditsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Credits Page",
        style: TextStyle(fontFamily: "Merienda"),
      )),
      body: const DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("${QuizState.dinosaurImagePath}brachiosaurus_herd_at_watering_hole.png"), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              boxXL,
              Text(
                "Developed by DinoSquad",
                style: TextStyle(
                  fontFamily: "erasaur",
                  fontSize: 18,
                ),
              ),
              boxXL,
              Text(
                "Dinosaur and Space Icons by Freepik, Published on flaticon.com",
                style: TextStyle(
                  fontFamily: "Merienda",
                  fontSize: 18,
                ),
              ),
              boxXL,
              LinkButton(
                  label: "Dinosaur Quiz Title Icon Source",
                  url:
                      "https://www.flaticon.com/free-icon/parasaurolophus_5475067?term=dinosaur%27&page=1&position=14&origin=style&related_id=5475067"),
              boxXXL,
              LinkButton(
                  label: "Space Quiz Title Icon Source",
                  url:
                      'https://www.flaticon.com/free-icon/galaxy_3919942?term=space&page=1&position=19&origin=style&related_id=3919942'),
              Text("All background images done by DALL-E"),
              Text(
                  "Fonts: DinoSauce (Dinosaur Quiz Title), Induction (Space Quiz Title),Erasaur (Button Labels and Score Display), Merienda(Other)")
            ],
          ),
        ),
      ),
    );
  }
}
