import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/routes/app_routes.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go(AppRoutes.home),
        ),
        title: Text(
          'Demonstração',
          style: AppTypography.headlineMedium.copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Modo Demonstração', style: AppTypography.displayMedium),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Explore as funcionalidades do aplicativo sem inserir dados reais.',
              style: AppTypography.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.xxl),
            _DemoCard(
              icon: Icons.analytics_outlined,
              title: 'Simulação de Análise',
              description: 'Veja como funciona a análise de risco com dados fictícios.',
              onTap: () => context.go(AppRoutes.quiz),
            ),
            const SizedBox(height: AppSpacing.md),
            _DemoCard(
              icon: Icons.bar_chart,
              title: 'Resultado de Exemplo',
              description: 'Visualize um resultado de análise com nível Alto.',
              onTap: () => context.go(AppRoutes.result, extra: 75),
            ),
          ],
        ),
      ),
    );
  }
}

class _DemoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _DemoCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: AppColors.shadow, blurRadius: 12)],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.primary, size: 28),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTypography.headlineMedium),
                  const SizedBox(height: AppSpacing.xs),
                  Text(description, style: AppTypography.bodySmall),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.textHint),
          ],
        ),
      ),
    );
  }
}
