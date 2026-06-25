import 'package:equatable/equatable.dart';

class AnswerEntity extends Equatable {
  final String questionId;
  final bool value;

  const AnswerEntity({
    required this.questionId,
    required this.value,
  });

  @override
  List<Object?> get props => [questionId, value];
}
