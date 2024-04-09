import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/models/question.dart';

class QuizState {
  static const imagePath = "assets/quizzez/";
  static const dinosaurImagePath = "assets/quizzez/images/dinosaurs/";
  static const animalImagePath = "assets/quizzez/images/animals/";
  static const spaceImagePath = "assets/quizzez/images/space/";
  static const minQuizLength = 10;
  static const maxQuizLength = 150;
  static const spaceMinQuizLength = 3;
  static const spaceMaxQuizLength = 7;

  final List<Question> questions;
  final QuestionType questionType;
  final int score;
  final int questionIndex;
  final bool includeCladeQuestions;
  final bool includeTimePeriodQuestions;
  final bool includeDietQuestions;
  final bool includeOtherQuestions;

  QuizState({
    required this.questions,
    required this.questionType,
    required this.score,
    required this.questionIndex,
    this.includeCladeQuestions = true,
    this.includeTimePeriodQuestions = true,
    this.includeOtherQuestions = true,
    this.includeDietQuestions = true,
  });

  QuizState copyWith({
    List<Question>? questions,
    QuestionType? questionType,
    int? score,
    int? questionIndex,
    bool? includeCladeQuestions,
    bool? includeTimePeriodQuestions,
    bool? includeDietQuestions,
    bool? includeOtherQuestions,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      questionType: questionType ?? this.questionType,
      score: score ?? this.score,
      questionIndex: questionIndex ?? this.questionIndex,
      includeCladeQuestions: includeCladeQuestions ?? this.includeCladeQuestions,
      includeTimePeriodQuestions: includeTimePeriodQuestions ?? this.includeTimePeriodQuestions,
      includeDietQuestions: includeDietQuestions ?? this.includeDietQuestions,
      includeOtherQuestions: includeOtherQuestions ?? this.includeOtherQuestions,
    );
  }
}
