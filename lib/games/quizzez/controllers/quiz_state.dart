import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/models/question.dart';

class QuizState {
  static const imagePath = "assets/quizzez/";
  static const dinosaurImagePath = "assets/images/dinosaurs/";
  static const animalImagePath = "assets/quizzez/images/animals/";
  static const spaceImagePath = "assets/images/space/";

  final List<Question> questions;
  final QuestionType questionType;
  final int score;
  final int questionIndex;

  QuizState({required this.questions, required this.questionType, required this.score, required this.questionIndex});

  QuizState copyWith({List<Question>? questions, QuestionType? questionType, int? score, int? questionIndex}) {
    return QuizState(
      questions: questions ?? this.questions,
      questionType: questionType ?? this.questionType,
      score: score ?? this.score,
      questionIndex: questionIndex ?? this.questionIndex,
    );
  }
}
