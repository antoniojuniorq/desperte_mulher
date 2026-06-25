import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class QuizProgressBar extends StatelessWidget {
  final double progress;

  const QuizProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: progress),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      builder: (_, value, __) {
        return LinearProgressIndicator(
          value: value,
          minHeight: 5,
          backgroundColor: AppColors.divider,
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.accent),
        );
      },
    );
  }
}
