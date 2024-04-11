import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/dinosaurs.dart';
import '../data/models/question.dart';

class QuizState {
  static const imagePath = "assets/quizzez/";
  static const dinosaurImagePath = "assets/quizzez/images/dinosaurs/";
  static const animalImagePath = "assets/quizzez/images/animals/";
  static const spaceImagePath = "assets/quizzez/images/space/";
  static final questionsPerCategory = dinosaurs.length;
  static const otherQuestions = 2;
  static const minDinosaurQuizLength = 10;
  static const spaceMinQuizLength = 3;
  static const spaceMaxQuizLength = 7;

  final List<Question> questions;
  final QuestionType questionType;
  final int score;
  final int questionIndex;
  final bool answeredOnFirstTry;
  final bool includeCladeQuestions;
  final bool includeTimePeriodQuestions;
  final bool includeDietQuestions;
  final bool includeOtherQuestions;
  final int quizLength;

  QuizState({
    required this.questions,
    required this.questionType,
    required this.score,
    required this.questionIndex,
    this.includeCladeQuestions = true,
    this.includeTimePeriodQuestions = true,
    this.includeOtherQuestions = true,
    this.includeDietQuestions = true,
    this.answeredOnFirstTry = true,
    this.quizLength = 0,
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
    bool? answeredOnFirstTry,
    int? quizLength,
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
      answeredOnFirstTry: answeredOnFirstTry ?? this.answeredOnFirstTry,
      quizLength: quizLength ?? this.quizLength,
    );
  }

  int get minQuizLength {
    if (questionType == QuestionType.space) {
      return QuizState.spaceMinQuizLength;
    }
    if (maxQuizLength <= 10) {
      if (maxQuizLength == 0) {
        return 0;
      }
      return 1;
    }
    return minDinosaurQuizLength;
  }

  int get maxQuizLength {
    if (questionType == QuestionType.space) {
      return QuizState.spaceMaxQuizLength;
    }

    int maxQuizLength = 0;

    if (includeCladeQuestions) {
      maxQuizLength += questionsPerCategory;
    }
    if (includeTimePeriodQuestions) {
      maxQuizLength += questionsPerCategory;
    }
    if (includeDietQuestions) {
      maxQuizLength += questionsPerCategory;
    }
    if (includeOtherQuestions) {
      maxQuizLength += otherQuestions;
    }

    return maxQuizLength;
  }
}
