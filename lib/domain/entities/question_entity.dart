import 'package:equatable/equatable.dart';

class QuestionEntity extends Equatable {
  final String id;
  final String text;
  final int weight;
  final String category;
  final String? helpText;

  const QuestionEntity({
    required this.id,
    required this.text,
    required this.weight,
    required this.category,
    this.helpText,
  });

  @override
  List<Object?> get props => [id, text, weight, category, helpText];
}
