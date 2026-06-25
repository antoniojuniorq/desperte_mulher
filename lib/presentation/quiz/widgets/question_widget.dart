import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../domain/entities/question_entity.dart';

class QuestionWidget extends StatefulWidget {
  final QuestionEntity question;
  final void Function(bool answer) onAnswer;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.onAnswer,
  });

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeIn);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeOut));
    _animController.forward();
  }

  @override
  void didUpdateWidget(QuestionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.question.id != widget.question.id) {
      _animController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnim,
      child: SlideTransition(
        position: _slideAnim,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cabeçalho do card com categoria
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.08),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.label_outline,
                      color: AppColors.primary,
                      size: 16,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      widget.question.category.toUpperCase(),
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),

              // Conteúdo
              Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Texto da pergunta
                    Text(
                      widget.question.text,
                      style: AppTypography.headlineLarge,
                    ),

                    // Texto de ajuda
                    if (widget.question.helpText != null) ...[
                      const SizedBox(height: AppSpacing.md),
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.sm),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceVariant,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.info_outline,
                              color: AppColors.textHint,
                              size: 16,
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            Expanded(
                              child: Text(
                                widget.question.helpText!,
                                style: AppTypography.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    const SizedBox(height: AppSpacing.xxl),

                    // Botões de resposta
                    Row(
                      children: [
                        Expanded(
                          child: _AnswerButton(
                            label: 'Sim',
                            icon: Icons.check_circle_outline,
                            color: AppColors.riskHigh,
                            onTap: () => widget.onAnswer(true),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: _AnswerButton(
                            label: 'Não',
                            icon: Icons.cancel_outlined,
                            color: AppColors.riskVeryLow,
                            onTap: () => widget.onAnswer(false),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnswerButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _AnswerButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: AppTypography.labelButton,
      ),
    );
  }
}
