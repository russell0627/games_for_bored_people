import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/animals.dart';
import '../data/dinosaurs.dart';
import '../data/models/animal.dart';
import '../data/models/dinosaur.dart';
import '../data/models/question.dart';
import '../data/models/space_object.dart';
import '../widgets/dialogs/game_finished_dialog.dart';
import 'quiz_state.dart';

part 'quiz_controller.g.dart';

@riverpod
class QuizController extends _$QuizController {
  @override
  QuizState build() =>
      QuizState(questions: [], questionType: QuestionType.dinosaur, score: 0, questionIndex: 0);

  void answerQuestion(final dynamic answer) {
    if (state.questions[state.questionIndex].answers.contains(answer)) {
      state = state.copyWith(questionIndex: state.questionIndex + 1);
    } else {}
  }

  void updateQuestionType(QuestionType questionType) {
    state = state.copyWith(questionType: questionType);
  }

  List<Question> _generateQuestions({
    Dinosaur? currentDinosaur,
    Animal? currentAnimal,
    required QuestionType questionType,
  }) {
    //TODO: make it so that this supports plant questions too
    List<Question> newQuestions = [];

    if (questionType == QuestionType.dinosaur) {
      newQuestions = [
        if (state.includeDietQuestions)
          Question<Diet>(
            question: "What was the diet classification for ${currentDinosaur!.name}?",
            options: Diet.values,
            answers: [currentDinosaur.diet],
            imageFilename: "${QuizState.dinosaurImagePath}${currentDinosaur.imageFileName}",
          ),
        if (state.includeTaxonomyQuestions)
          Question<Suborder>(
            question: "Which of these groups does ${currentDinosaur!.name} belong to?",
            options: Suborder.values,
            answers: [currentDinosaur.suborder],
            imageFilename: "${QuizState.dinosaurImagePath}${currentDinosaur.imageFileName}",
          ),
        if (state.includeTimePeriodQuestions)
          Question<TimePeriod>(
            question: "What time period was ${currentDinosaur!.name} from?",
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
          imageFilename: "${QuizState.spaceImagePath}milky_way.png",
        ),
        Question(
          question: "How far is the Sun from Earth?",
          options: auFormatter([1, 10, 15, 100]),
          answers: ["1 AU"],
        ),
        const Question(
          question: "What is the biggest dwarf planet in the solar system?",
          options: ["Eris", "MakeMake", "Pluto"],
          answers: ["Eris"],
        ),
        Question(
          question: "How many miles are in 1 AU",
          options: [86000000, 113000000, auToMiles(1)],
          answers: [auToMiles(1)],
        ),
        const Question(
          question: "What is at the center of the Milky Way Galaxy",
          options: ["A Star", "Beans", "Black Hole", "Your Mother"],
          answers: ["Black Hole"],
        ),
        const Question(
          question: "How are black holes made",
          options: ["Dead Stars", "Dead Galaxies", "Dead Planets", "Divine Power"],
          answers: ["Dead Stars"],
        ),
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
        ),
      ];
    } else if (questionType == QuestionType.music) {
      newQuestions = [
        Question(
          question: "What note is shown above?",
          options: ["C", "D", "E", "F", "G", "A", "B"],
          answers: ["C"],
          imageFilename: "assets/quizzez/images/music/c.png",
        ),
        Question(
          question: "What note is shown above?",
          options: ["C", "D", "E", "F", "G", "A", "B"],
          answers: ["D"],
          imageFilename: "assets/quizzez/images/music/d.png",
        ),
        Question(
          question: "What note is shown above?",
          options: ["C", "D", "E", "F", "G", "A", "B"],
          answers: ["E"],
          imageFilename: "assets/quizzez/images/music/e.png",
        ),
        Question(
          question: "What note is shown above?",
          options: ["C", "D", "E", "F", "G", "A", "B"],
          answers: ["F"],
          imageFilename: "assets/quizzez/images/music/f.png",
        ),
        Question(
          question: "What note is shown above?",
          options: ["C", "D", "E", "F", "G", "A", "B"],
          answers: ["G"],
          imageFilename: "assets/quizzez/images/music/g.png",
        ),
        Question(
          question: "What note is shown above?",
          options: ["C", "D", "E", "F", "G", "A", "B"],
          answers: ["A"],
          imageFilename: "assets/quizzez/images/music/a.png",
        ),
        Question(
          question: "What note is shown above?",
          options: ["C", "D", "E", "F", "G", "A", "B"],
          answers: ["B"],
          imageFilename: "assets/quizzez/images/music/b.png",
        ),
      ];
    }
    return newQuestions;
  }

  void resetQuestions() {
    final List<Question> newQuestions = [];
    if (state.endlessQuiz) {
      state = state.copyWith(questionIndex: 0, questions: [], answeredOnFirstTry: true);
    } else {
      state = state.copyWith(questionIndex: 0, score: 0, questions: [], answeredOnFirstTry: true);
    }

    switch (state.questionType) {
      case QuestionType.dinosaur:
        final specialQuestions = [
          const Question(
            question: "Was Albertaceratops found in:",
            options: ["Alberta, Canada", "Egypt", "India"],
            answers: ["Alberta, Canada"],
            imageFilename: "${QuizState.dinosaurImagePath}albertaceratops.jpg",
          ),
          const Question(
            question: "How many species of Triceratops were there?",
            options: ["2", "3", "4", "5"],
            answers: ["2"],
            imageFilename: "${QuizState.dinosaurImagePath}albertaceratops.jpg",
          ),
          const Question(
            question: "How many species of Tyrannosaurus were there?",
            options: ["1", "2", "3", "4", "5"],
            answers: ["1"],
            imageFilename: "${QuizState.dinosaurImagePath}tyrannosaurus.jpg",
          ),
          const Question(
            question: "How long was the Cretaceous Period?",
            options: [
              "78 Million Years",
              "200 Million years",
              "66 Million Years",
              "47 Million Years",
              "54 Million Years",
            ],
            answers: ["78 Million Years"],
            imageFilename: "${QuizState.dinosaurImagePath}tyrannosaurus.jpg",
          ),
          const Question(
            question: "How long was the Jurassic Period?",
            options: [
              "78 Million Years",
              "200 Million years",
              "66 Million Years",
              "47 Million Years",
              "50 Million Years",
            ],
            answers: ["50 Million Years"],
            imageFilename: "${QuizState.dinosaurImagePath}tyrannosaurus.jpg",
          ),
          const Question(
            question: "How long was the Triassic Period?",
            options: [
              "78 Million Years",
              "55 Million years",
              "66 Million Years",
              "47 Million Years",
              "54 Million Years",
            ],
            answers: ["55 Million years"],
            imageFilename: "${QuizState.dinosaurImagePath}tyrannosaurus.jpg",
          ),
          const Question(
            question: "Fossils are bones. True or False?",
            options: ["True", "False"],
            answers: ["False"],
            imageFilename: "${QuizState.dinosaurImagePath}tyrannosaurus.jpg",
          ),
        ];

        for (int i = 0; i < dinosaurs.values.length; i++) {
          newQuestions.addAll(
            _generateQuestions(
              currentDinosaur: dinosaurs.values.toList()[i],
              questionType: QuestionType.dinosaur,
            ),
          );
        }
        for (int i = 0; i < dinosaurs.values.length; i++) {
          newQuestions.addAll(
            _generateQuestions(
              currentDinosaur: dinosaurs.values.toList()[i],
              questionType: QuestionType.dinosaur,
            ),
          );
        }
        if (state.includeOtherQuestions) {
          newQuestions.addAll(specialQuestions);
        }
        newQuestions.shuffle();
        break;
      case QuestionType.space:
        newQuestions.addAll(_generateQuestions(questionType: QuestionType.space));
        break;
      case QuestionType.animal:
        for (int i = 0; i < animals.values.length; i++) {
          newQuestions.addAll(
            _generateQuestions(
              currentAnimal: animals.values.toList()[i],
              questionType: QuestionType.animal,
            ),
          );
        }
        break;
      case QuestionType.plant:
        break;
      case QuestionType.music:
        _generateQuestions(questionType: QuestionType.music);
        break;
    }
    if (state.endlessQuiz == false) {
      state = state.copyWith(questions: newQuestions.take(state.quizLength).toList());
    } else {
      state = state.copyWith(questions: newQuestions);
    }
  }

  void updateLifeCount(int newLifeCount) {
    state = state.copyWith(lives: newLifeCount);
  }

  Future<void> nextQuestion({required dynamic answer}) async {
    if (state.questions[state.questionIndex].answers.contains(answer)) {
      if (state.answeredOnFirstTry) {
        state = state.copyWith(score: state.score + 1);
      } else {}

      if (state.questionIndex == state.questions.length - 1 && state.endlessQuiz) {
        resetQuestions();
        return;
      }

      state = state.copyWith(questionIndex: state.questionIndex + 1, answeredOnFirstTry: true);
    } else {
      state = state.copyWith(
        questions: state.questions..add(state.questions[state.questionIndex]),
        answeredOnFirstTry: false,
        lives: state.lives - 1,
      );
      if (state.lives <= 0) {
        endQuiz();
      }
    }
  }

  Future<void> endQuiz() async {
    if (state.lives == 0) {
      await SmartDialog.show(builder: (_) => OutOfLivesDialog());
    }
    if (state.score == state.questions.length) {
      await SmartDialog.show(
        builder:
            (_) => PerfectGameDialog(score: state.score, numberOfQuestions: state.questions.length),
      );
    }
    if (state.score > state.highestScore) {
      await SmartDialog.show(builder: (_) => HighScoreDialog(score: state.score));
    }
    await SmartDialog.show(
      builder:
          (_) => GameFinishedDialog(score: state.score, numberOfQuestions: state.questions.length),
    );
  }

  void updateQuizLength(int quizLength) => state = state.copyWith(quizLength: quizLength);

  void updateQuestionTypes({
    bool? includeTaxonomyQuestions,
    bool? includeDietQuestions,
    bool? includeTimePeriodQuestions,
    bool? includeOtherQuestions,
    bool? endlessQuiz,
  }) =>
      state = state.copyWith(
        includeTaxonomyQuestions: includeTaxonomyQuestions,
        includeTimePeriodQuestions: includeTimePeriodQuestions,
        includeDietQuestions: includeDietQuestions,
        includeOtherQuestions: includeOtherQuestions,
        endlessQuiz: endlessQuiz,
      );
}
