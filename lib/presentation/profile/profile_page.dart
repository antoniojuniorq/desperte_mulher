import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/routes/app_routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
          'Meu Perfil',
          style: AppTypography.headlineMedium.copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white70),
            onPressed: () => context.go(AppRoutes.home),
            tooltip: 'Sair',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          children: [
            // Avatar
            Center(
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 3),
                ),
                child: const Icon(
                  Icons.person,
                  color: AppColors.primary,
                  size: 48,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text('Profissional Acolhe', style: AppTypography.headlineLarge),
            Text('profissional@instituicao.gov.br',
                style: AppTypography.bodySmall),

            const SizedBox(height: AppSpacing.xl),

            // Informações
            _InfoCard(
              title: 'Dados do Perfil',
              items: const [
                (Icons.business_outlined, 'Instituição', 'Casa da Mulher Brasileira'),
                (Icons.work_outline, 'Função', 'Assistente Social'),
                (Icons.location_on_outlined, 'Cidade', 'Palmas - TO'),
              ],
            ),

            const SizedBox(height: AppSpacing.md),

            // Ações rápidas
            _InfoCard(
              title: 'Ações Rápidas',
              items: const [],
              actions: [
                (Icons.analytics_outlined, 'Nova Análise de Risco', AppRoutes.quiz),
                (Icons.bar_chart, 'Observatório', AppRoutes.observatory),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final List<(IconData, String, String)> items;
  final List<(IconData, String, String)>? actions;

  const _InfoCard({
    required this.title,
    required this.items,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: AppColors.shadow, blurRadius: 16)],
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTypography.headlineMedium),
          const SizedBox(height: AppSpacing.md),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Row(
                children: [
                  Icon(item.$1, color: AppColors.primary, size: 20),
                  const SizedBox(width: AppSpacing.md),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.$2, style: AppTypography.bodySmall),
                      Text(item.$3,
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.textPrimary,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (actions != null)
            ...actions!.map(
              (action) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(action.$1, color: AppColors.primary),
                title: Text(action.$2, style: AppTypography.bodyMedium),
                trailing: const Icon(Icons.chevron_right,
                    color: AppColors.textHint),
                onTap: () => context.go(action.$3),
              ),
            ),
        ],
      ),
    );
  }
}
