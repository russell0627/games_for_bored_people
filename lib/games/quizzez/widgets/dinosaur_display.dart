import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../../../utils/screen_utils.dart';
import '../controllers/quiz_state.dart';
import '../data/models/dinosaur.dart';


const TextStyle _defaultTextStyle = TextStyle();

class DinosaurDisplay extends StatelessWidget {
  final Dinosaur dinosaur;
  final TextStyle infoTextStyle;

  const DinosaurDisplay({super.key, required this.dinosaur, this.infoTextStyle = _defaultTextStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              child: Image.asset("${QuizState.dinosaurImagePath}${dinosaur.imageFileName}"),
            ),
          ),
        ),
        Text(
          dinosaur.name.titleCase,
          style: infoTextStyle,
        ),
        Text(
          "Diet: ${dinosaur.diet.name.titleCase}",
          style: infoTextStyle,
        ),
        Text(
          "Lowest Clade: ${dinosaur.suborder.name.titleCase}",
          style: infoTextStyle,
        ),
        Text(
          "Time Period: ${dinosaur.timePeriod.name.titleCase}",
          style: infoTextStyle,
        ),
      ],
    );
  }
}
