import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/animals.dart';
import '../data/dinosaurs.dart';
import '../data/models/animal.dart';
import '../data/models/dinosaur.dart';
import '../data/models/plant.dart';
import '../data/models/question.dart';
import '../data/models/space_object.dart';
import '../widgets/dialogs/game_finished_dialog.dart';
import 'quiz_state.dart';

part 'quiz_controller.g.dart';

@riverpod
class QuizController extends _$QuizController {
  @override
  QuizState build() => QuizState(questions: [], questionType: QuestionType.dinosaur, score: 0, questionIndex: 0);

  void answerQuestion(final dynamic answer) {
    if(state.questions[state.questionIndex].answers.contains(answer)) {
      state = state.copyWith(questionIndex: state.questionIndex + 1, score: state.score + 1);
    }
  }
  List<Question> _generateQuestions(
      {Dinosaur? currentDinosaur, Animal? currentAnimal, Plant? currentPlant, required QuestionType questionType}) {
    //TODO: make it so that this supports plant questions too
    List<Question> newQuestions = [];

    if (questionType == QuestionType.dinosaur) {
      newQuestions = [
        Question<Diet>(
          question: "What was the diet classification for ${currentDinosaur!.name}?",
          options: Diet.values,
          answers: [currentDinosaur.diet],
          imageFilename: "${QuizState.dinosaurImagePath}${currentDinosaur.imageFileName}",
        ),
        Question<Suborder>(
          question: "What is the lowest clade for ${currentDinosaur.name}?",
          options: Suborder.values,
          answers: [currentDinosaur.suborder],
          imageFilename: "${QuizState.dinosaurImagePath}${currentDinosaur.imageFileName}",
        ),
        Question<TimePeriod>(
          question: "What time period was ${currentDinosaur.name} from?",
          options: TimePeriod.values,
          answers: [currentDinosaur.timePeriod],
          imageFilename: "${QuizState.dinosaurImagePath}${currentDinosaur.imageFileName}",
        ),
      ];
    } else if (questionType == QuestionType.space) {
      newQuestions = [
        Question(
          question: "What is the hottest type of star?",
          options: StarColor.values.map((color) => color.toString()).toList(),
          answers: [StarColor.blue.toString()],
        ),
        Question(
          question: "What is the coldest type of star?",
          options: StarColor.values.map((color) => color.toString()).toList(),
          answers: [StarColor.red.toString()],
        ),
        Question(
            question: "What type of galaxy is the Milky Way?",
            options: GalaxyType.values.map((type) => type.toString()).toList(),
            answers: [GalaxyType.spiral.toString()],
            imageFilename: "${QuizState.spaceImagePath}milky_way.png"),
        Question(question: "How far is the Sun from Earth?", options: auFormatter([1, 10, 15, 100]), answers: ["1 AU"]),
        const Question(
            question: "What is the biggest dwarf planet in the solar system?",
            options: ["Eris", "MakeMake", "Pluto"],
            answers: ["Eris"]),
        Question(question: "How many miles are in 1 AU", options: [
          86000000,
          113000000,
          auToMiles(1),
        ], answers: [
          auToMiles(1)
        ]),
        const Question(
          question: "What is at the center of the Milky Way Galaxy",
          options: ["A Star", "Beans", "Black Hole", "Your Mother"],
          answers: ["Black Hole"],
        ),
        const Question(
            question: "How are black holes made",
            options: ["Dead Stars", "Dead Galaxies", "Dead Planets", "Divine Power"],
            answers: ["Dead Stars"]),
      ];
    } else if (questionType == QuestionType.animal) {
      newQuestions = [
        Question<String>(
          question: "What is the diet classification for ${currentAnimal!.name}?",
          options: Diet.values.map((diet) => diet.toString()).toList(),
          answers: [currentAnimal.diet.toString()],
          imageFilename: "${QuizState.animalImagePath}${currentAnimal.imageFileName}",
        ),
        Question<String>(
          question: "What is the category of animal for ${currentAnimal.name}?",
          options: AnimalCategory.values.map((category) => category.toString()).toList(),
          answers: [currentAnimal.category.toString()],
          imageFilename: "${QuizState.animalImagePath}${currentAnimal.imageFileName}",
        ),
        Question(
          question: "Where does ${currentAnimal.name} live?",
          options: AnimalHabitat.values.map((habitat) => habitat.toString()).toList(),
          answers: currentAnimal.habitats.map((habitat) => habitat.toString()).toList(),
          imageFilename: "${QuizState.animalImagePath}${currentAnimal.imageFileName}",
        )
      ];
    }
    return newQuestions;
  }

  void resetQuestions() {
    final List<Question> newQuestions = [];
    state = state.copyWith(questionIndex: 0, score: 0, questions: []);

    switch (state.questionType) {
      case QuestionType.dinosaur:
        for (int i = 0; i < dinosaurs.values.length; i++) {
          newQuestions.addAll(
              _generateQuestions(currentDinosaur: dinosaurs.values.toList()[i], questionType: QuestionType.dinosaur));
        }
        newQuestions.shuffle();
        newQuestions.add(
          const Question(
              question: "Was Albertaceratops found in:",
              options: ["Alberta, Canada", "Egypt", "India"],
              answers: ["Alberta, Canada"],
              imageFilename: "${QuizState.dinosaurImagePath}albertaceratops.jpg"),
        );
        newQuestions.add(
          const Question(
              question: "How many species of Triceratops were there?",
              options: [
                "2",
                "3",
                "4",
                "5",
              ],
              answers: ["2"],
              imageFilename: "${QuizState.dinosaurImagePath}albertaceratops.jpg"),
        );
        break;
      case QuestionType.space:
        newQuestions.addAll(_generateQuestions(questionType: QuestionType.space));
        break;
      case QuestionType.animal:
        for (int i = 0; i < animals.values.length; i++) {
          newQuestions
              .addAll(_generateQuestions(currentAnimal: animals.values.toList()[i], questionType: QuestionType.animal));
        }
        break;
      case QuestionType.plant:
        break;
    }
    state = state.copyWith(questions:newQuestions.take(state.questions.length).toList());
  }

  Future<void> nextQuestion({required bool answeredOnFirstTry}) async {
      if (answeredOnFirstTry) {
        state.copyWith(score: state.score + 1);
      }

      state.copyWith(questionIndex: state.questionIndex + 1);

    if (state.questionIndex == state.questions.length) {
      await SmartDialog.show(
        builder: (_) => GameFinishedDialog(
          score: state.score,
          numberOfQuestions: state.questions.length,
        ),
      );

      resetQuestions();

      answeredOnFirstTry = true;
    }
  }

}
