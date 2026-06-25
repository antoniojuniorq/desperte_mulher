import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/routes/app_routes.dart';
import 'quiz_controller.dart';
import 'widgets/question_widget.dart';
import 'widgets/quiz_progress_bar.dart';

class QuizPage extends ConsumerWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizControllerProvider);
    final controller = ref.read(quizControllerProvider.notifier);

    // Redireciona ao terminar
    if (state.isFinished) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go(AppRoutes.result, extra: state.percentScore);
      });
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go(AppRoutes.home),
        ),
        title: Text(
          'Análise de Risco',
          style: AppTypography.headlineMedium.copyWith(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.md),
            child: Center(
              child: Text(
                '${state.currentIndex}/${state.questions.length}',
                style: AppTypography.bodySmall.copyWith(color: Colors.white60),
              ),
            ),
          ),
        ],
      ),
      body: state.questions.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Barra de progresso no topo
                QuizProgressBar(progress: state.progress),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(AppSpacing.xl),
                    child: Column(
                      children: [
                        // Cabeçalho da pergunta
                        _QuizHeader(
                          current: state.currentIndex + 1,
                          total: state.questions.length,
                        ),
                        const SizedBox(height: AppSpacing.xl),

                        // Card da pergunta
                        if (state.currentQuestion != null)
                          QuestionWidget(
                            question: state.currentQuestion!,
                            onAnswer: (answer) => controller.answerQuestion(
                              state.currentQuestion!.id,
                              answer,
                            ),
                          ),

                        const SizedBox(height: AppSpacing.xl),

                        // Aviso de confidencialidade
                        _ConfidentialityNote(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class _QuizHeader extends StatelessWidget {
  final int current;
  final int total;

  const _QuizHeader({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pergunta $current de $total',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Responda com honestidade. Suas respostas são anônimas.',
                style: AppTypography.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ConfidentialityNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.primaryLight.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          const Icon(Icons.lock_outline, color: AppColors.primary, size: 18),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              'Suas respostas são 100% confidenciais e não identificam você.',
              style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
