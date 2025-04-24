import '../data/dinosaurs.dart';
import '../data/models/question.dart';

class QuizState {
  static const imagePath = "assets/quizzez/image/";
  static const dinosaurImagePath = "assets/quizzez/images/dinosaurs/";
  static const animalImagePath = "assets/quizzez/images/animals/";
  static const spaceImagePath = "assets/quizzez/images/space/";
  static final questionsPerCategory = dinosaurs.length;
  static const otherQuestions = 7;
  static const minDinosaurQuizLength = 1;
  static const spaceMinQuizLength = 3;
  static const spaceMaxQuizLength = 7;
  final List<Question> questions;
  final QuestionType questionType;
  final int score;
  final int highestScore;
  final int questionIndex;
  final bool answeredOnFirstTry;
  final bool includeTaxonomyQuestions;
  final bool includeTimePeriodQuestions;
  final bool includeDietQuestions;
  final bool includeOtherQuestions;

  final bool oneLifeMode;
  final bool endlessQuiz;
  final int quizLength;
  final List<Question> incorrectQuestions;
  final List<dynamic> incorrectQuestionAnswers;
  final List<Question> correctQuestions;

  final int lives;

  QuizState({
    this.correctQuestions = const [],
    this.incorrectQuestions = const [],
    this.incorrectQuestionAnswers = const [],
    required this.questions,
    required this.questionType,
    this.score = 0,
    this.highestScore = 0,
    required this.questionIndex,
    this.includeTaxonomyQuestions = true,
    this.includeTimePeriodQuestions = true,
    this.includeOtherQuestions = true,
    this.includeDietQuestions = true,
    this.oneLifeMode = false,
    this.endlessQuiz = false,
    this.answeredOnFirstTry = true,
    this.quizLength = 0,
    this.lives = 3,
  });

  QuizState copyWith({
    List<Question>? incorrectQuestions,
    List<dynamic>? incorrectQuestionAnswers,
    List<Question>? correctQuestions,
    List<Question>? questions,
    QuestionType? questionType,
    int? highestScore,
    int? score,
    int? questionIndex,
    int? lives,
    bool? includeTimePeriodQuestions,
    bool? includeDietQuestions,
    bool? includeOtherQuestions,
    bool? includeTaxonomyQuestions,
    bool? endlessQuiz,
    bool? answeredOnFirstTry,
    int? quizLength,
  }) {
    return QuizState(
      incorrectQuestions: incorrectQuestions ?? this.incorrectQuestions,
      lives: lives ?? this.lives,
      incorrectQuestionAnswers: incorrectQuestionAnswers ?? this.incorrectQuestionAnswers,
      correctQuestions: correctQuestions ?? this.correctQuestions,
      questions: questions ?? this.questions,
      questionType: questionType ?? this.questionType,
      score: score ?? this.score,
      highestScore: highestScore ?? this.highestScore,
      questionIndex: questionIndex ?? this.questionIndex,
      includeTaxonomyQuestions: includeTaxonomyQuestions ?? this.includeTaxonomyQuestions,
      includeTimePeriodQuestions: includeTimePeriodQuestions ?? this.includeTimePeriodQuestions,
      includeDietQuestions: includeDietQuestions ?? this.includeDietQuestions,
      includeOtherQuestions: includeOtherQuestions ?? this.includeOtherQuestions,
      endlessQuiz: endlessQuiz ?? this.endlessQuiz,
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

    if (includeTaxonomyQuestions) {
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
