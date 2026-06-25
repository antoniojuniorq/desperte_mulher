import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/routes/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryDark,
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primaryDark,
                    AppColors.primary.withOpacity(0.8),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: AppColors.accentLight,
                      size: 36,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    'Desperte Mulher',
                    style: AppTypography.headlineLarge
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'Sua segurança importa',
                    style:
                        AppTypography.bodySmall.copyWith(color: Colors.white54),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.sm),

            // Menu items
            _DrawerItem(
              icon: Icons.home_outlined,
              label: 'Início',
              route: AppRoutes.home,
            ),
            _DrawerItem(
              icon: Icons.analytics_outlined,
              label: 'Iniciar Análise de Risco',
              route: AppRoutes.quiz,
              highlight: true,
            ),
            _DrawerItem(
              icon: Icons.info_outline,
              label: 'Sobre',
              route: AppRoutes.about,
            ),
            _DrawerItem(
              icon: Icons.bar_chart_outlined,
              label: 'Observatório',
              route: AppRoutes.observatory,
            ),
            _DrawerItem(
              icon: Icons.gavel_outlined,
              label: 'Termos de Uso',
              route: AppRoutes.terms,
            ),

            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
              child: Divider(color: Colors.white12),
            ),

            _DrawerItem(
              icon: Icons.login_outlined,
              label: 'Login do Acolhe',
              route: AppRoutes.login,
            ),
            _DrawerItem(
              icon: Icons.group_add_outlined,
              label: 'Faça Parte da Rede',
              route: AppRoutes.register,
            ),

            const Spacer(),

            // Emergência
            Container(
              margin: const EdgeInsets.all(AppSpacing.md),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.riskExtreme.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.riskExtreme.withOpacity(0.5),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.emergency, color: Colors.redAccent, size: 18),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        'Em caso de emergência',
                        style: AppTypography.bodySmall.copyWith(
                          color: Colors.white70,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _EmergencyNumber(number: '180', label: 'Central Mulher'),
                      _EmergencyNumber(number: '190', label: 'Polícia'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;
  final bool highlight;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.route,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    if (highlight) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.pop(context);
            context.go(route);
          },
          icon: Icon(icon, size: 18),
          label: Text(label),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
    }

    return ListTile(
      leading: Icon(icon, color: Colors.white60, size: 22),
      title: Text(
        label,
        style: AppTypography.bodyMedium.copyWith(color: Colors.white70),
      ),
      onTap: () {
        Navigator.pop(context);
        context.go(route);
      },
      dense: true,
    );
  }
}

class _EmergencyNumber extends StatelessWidget {
  final String number;
  final String label;

  const _EmergencyNumber({required this.number, required this.label});

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
