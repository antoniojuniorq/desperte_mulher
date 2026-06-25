import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/constants/app_spacing.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool _isPrimary;
  final IconData? icon;
  final bool isLoading;
  final double? width;

  const AppButton.primary({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.width,
  }) : _isPrimary = true;

  const AppButton.secondary({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.width,
  }) : _isPrimary = false;

  @override
  Widget build(BuildContext context) {
    final child = isLoading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          )
        : icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 18),
                  const SizedBox(width: AppSpacing.sm),
                  Text(label),
                ],
              )
            : Text(label);

    final style = _isPrimary
        ? ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: Colors.white,
            minimumSize: Size(width ?? 0, 50),
            textStyle: AppTypography.labelButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          )
        : OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            side: const BorderSide(color: AppColors.primary),
            minimumSize: Size(width ?? 0, 50),
            textStyle: AppTypography.labelButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          );

    if (_isPrimary) {
      return ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: style,
        child: child,
      );
    }

    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: style,
      child: child,
    );
  }
}
