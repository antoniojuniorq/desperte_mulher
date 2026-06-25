import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/constants/app_spacing.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primaryDark,
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        children: [
          // Bloco de emergência
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.riskExtreme.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.riskExtreme.withOpacity(0.4),
              ),
            ),
            child: Column(
              children: [
                const Icon(Icons.emergency, color: Colors.redAccent, size: 24),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Em caso de emergência, ligue:',
                  style: AppTypography.bodyMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.md),
                Wrap(
                  spacing: AppSpacing.lg,
                  runSpacing: AppSpacing.sm,
                  alignment: WrapAlignment.center,
                  children: const [
                    _EmergencyTile(number: '180', label: 'Central da Mulher'),
                    _EmergencyTile(number: '190', label: 'Polícia Militar'),
                    _EmergencyTile(
                        number: '(63) 99282-0574', label: 'Ouvidoria da Mulher'),
                    _EmergencyTile(
                        number: '(63) 3212-7496', label: 'Casa da Mulher Brasileira'),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          Text(
            '© 2025 Desperte Mulher\ndesperte mulher.org',
            style: AppTypography.bodySmall.copyWith(color: Colors.white38),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _EmergencyTile extends StatelessWidget {
  final String number;
  final String label;

  const _EmergencyTile({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: AppTypography.headlineMedium.copyWith(
            color: AppColors.accentLight,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          label,
          style: AppTypography.bodySmall.copyWith(color: Colors.white54),
        ),
      ],
    );
  }
}
