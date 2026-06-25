import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/routes/app_routes.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({super.key});

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
          'Evidências Fotográficas',
          style: AppTypography.headlineMedium.copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Registro de Evidências', style: AppTypography.displayMedium),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Registre evidências de forma segura e confidencial para apoiar seu caso.',
              style: AppTypography.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.xxl),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.primary,
                      size: 48,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Funcionalidade em breve',
                    style: AppTypography.headlineMedium,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'O registro seguro de evidências fotográficas estará disponível na próxima versão.',
                    style: AppTypography.bodyMedium,
                    textAlign: TextAlign.center,
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
