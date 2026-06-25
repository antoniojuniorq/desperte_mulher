import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/question_entity.dart';
import '../../mock/mock_questions.dart';

class QuizState {
  final List<QuestionEntity> questions;
  final Map<String, bool> answers;
  final int currentIndex;
  final bool isFinished;

  const QuizState({
    this.questions = const [],
    this.answers = const {},
    this.currentIndex = 0,
    this.isFinished = false,
  });

  QuizState copyWith({
    List<QuestionEntity>? questions,
    Map<String, bool>? answers,
    int? currentIndex,
    bool? isFinished,
  }) =>
      QuizState(
        questions: questions ?? this.questions,
        answers: answers ?? this.answers,
        currentIndex: currentIndex ?? this.currentIndex,
        isFinished: isFinished ?? this.isFinished,
      );

  QuestionEntity? get currentQuestion =>
      currentIndex < questions.length ? questions[currentIndex] : null;

  double get progress =>
      questions.isEmpty ? 0 : currentIndex / questions.length;

  int get totalScore {
    int score = 0;
    for (final q in questions) {
      if (answers[q.id] == true) score += q.weight;
    }
    return score;
  }

  int get maxScore => questions.fold(0, (sum, q) => sum + q.weight);

  int get percentScore =>
      maxScore > 0 ? ((totalScore / maxScore) * 100).round() : 0;
}

class QuizController extends StateNotifier<QuizState> {
  QuizController() : super(const QuizState()) {
    _loadQuestions();
  }

  void _loadQuestions() {
    state = state.copyWith(questions: mockQuestions);
  }

  void answerQuestion(String questionId, bool answer) {
    final newAnswers = Map<String, bool>.from(state.answers);
    newAnswers[questionId] = answer;
    final nextIndex = state.currentIndex + 1;
    final finished = nextIndex >= state.questions.length;

    state = state.copyWith(
      answers: newAnswers,
      currentIndex: nextIndex,
      isFinished: finished,
    );
  }

  void restart() {
    state = QuizState(questions: state.questions);
  }
}

final quizControllerProvider =
    StateNotifierProvider<QuizController, QuizState>(
  (_) => QuizController(),
);
