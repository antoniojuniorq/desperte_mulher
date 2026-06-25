import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/routes/app_routes.dart';
import '../../domain/entities/quiz_result_entity.dart';
import '../quiz/quiz_controller.dart';

class ResultPage extends ConsumerWidget {
  final int score;

  const ResultPage({super.key, required this.score});

  RiskLevel get _level {
    if (score <= 20) return RiskLevel.veryLow;
    if (score <= 40) return RiskLevel.low;
    if (score <= 60) return RiskLevel.moderate;
    if (score <= 80) return RiskLevel.high;
    return RiskLevel.extreme;
  }

  List<String> get _recommendations => switch (_level) {
        RiskLevel.extreme => [
            'Busque um local seguro imediatamente',
            'Ligue 180 — Central de Atendimento à Mulher',
            'Ligue 190 — Polícia Militar',
            'Solicite medida protetiva de urgência',
            'Acione sua rede de apoio de confiança agora',
          ],
        RiskLevel.high => [
            'Ligue 180 para orientação especializada',
            'Documente todos os episódios de violência',
            'Solicite medida protetiva de urgência',
            'Procure a Delegacia da Mulher mais próxima',
          ],
        RiskLevel.moderate => [
            'Mantenha um plano de segurança atualizado',
            'Documente os episódios de violência',
            'Procure orientação jurídica gratuita',
            'Fortaleça sua rede de apoio',
          ],
        RiskLevel.low => [
            'Continue atenta aos sinais de alerta',
            'Mantenha sua rede de apoio ativa',
            'Saiba onde buscar ajuda se precisar',
          ],
        RiskLevel.veryLow => [
            'Continue monitorando sua situação',
            'Conheça seus direitos',
            'Mantenha contatos de emergência salvos',
          ],
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final level = _level;
    final color = Color(level.color);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        automaticallyImplyLeading: false,
        title: Text(
          'Seu Resultado',
          style: AppTypography.headlineMedium.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          children: [
            // Card principal do resultado
            _ResultCard(score: score, level: level, color: color),

            const SizedBox(height: AppSpacing.xl),

            // Recomendações
            _RecommendationsCard(
              recommendations: _recommendations,
              level: level,
              color: color,
            ),

            const SizedBox(height: AppSpacing.xl),

            // Contatos de emergência (se risco alto ou extremo)
            if (level == RiskLevel.high || level == RiskLevel.extreme)
              _EmergencyCard(),

            const SizedBox(height: AppSpacing.xl),

            // Botões de ação
            _ActionButtons(
              onRestart: () {
                ref.read(quizControllerProvider.notifier).restart();
                context.go(AppRoutes.quiz);
              },
              onHome: () => context.go(AppRoutes.home),
            ),

            const SizedBox(height: AppSpacing.xxxl),
          ],
        ),
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  final int score;
  final RiskLevel level;
  final Color color;

  const _ResultCard({
    required this.score,
    required this.level,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withOpacity(0.15),
            color.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.4), width: 2),
      ),
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        children: [
          // Ícone de nível
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 3),
            ),
            child: Center(
              child: Icon(
                _iconForLevel(level),
                color: color,
                size: 40,
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.md),

          Text(
            'Nível de Risco',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textHint,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: AppSpacing.xs),

          Text(
            level.label,
            style: AppTypography.displayLarge.copyWith(color: color),
          ),

          const SizedBox(height: AppSpacing.sm),

          // Barra de progresso do score
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: score / 100),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOut,
              builder: (_, value, __) => LinearProgressIndicator(
                value: value,
                minHeight: 10,
                backgroundColor: color.withOpacity(0.15),
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.sm),

          Text(
            '$score% de risco identificado',
            style: AppTypography.bodyMedium.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: AppSpacing.md),

          Text(
            level.description,
            style: AppTypography.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  IconData _iconForLevel(RiskLevel level) => switch (level) {
        RiskLevel.veryLow => Icons.check_circle_outline,
        RiskLevel.low => Icons.info_outline,
        RiskLevel.moderate => Icons.warning_amber_outlined,
        RiskLevel.high => Icons.error_outline,
        RiskLevel.extreme => Icons.dangerous_outlined,
      };
}

class _RecommendationsCard extends StatelessWidget {
  final List<String> recommendations;
  final RiskLevel level;
  final Color color;

  const _RecommendationsCard({
    required this.recommendations,
    required this.level,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: AppColors.shadow, blurRadius: 16),
        ],
      ),
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.tips_and_updates_outlined, color: color, size: 22),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Recomendações',
                style: AppTypography.headlineLarge,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          ...recommendations.map(
            (r) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_right, color: color, size: 20),
                  const SizedBox(width: AppSpacing.xs),
                  Expanded(
                    child: Text(r, style: AppTypography.bodyMedium),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmergencyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.riskExtreme.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.riskExtreme.withOpacity(0.4)),
      ),
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        children: [
          const Icon(Icons.emergency, color: AppColors.riskExtreme, size: 32),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Contatos de Emergência',
            style: AppTypography.headlineLarge.copyWith(
              color: AppColors.riskExtreme,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          _EmergencyRow(number: '180', label: 'Central de Atendimento à Mulher'),
          const SizedBox(height: AppSpacing.sm),
          _EmergencyRow(number: '190', label: 'Polícia Militar'),
          const SizedBox(height: AppSpacing.sm),
          _EmergencyRow(
              number: '(63) 99282-0574', label: 'Ouvidoria da Mulher TO'),
        ],
      ),
    );
  }
}

class _EmergencyRow extends StatelessWidget {
  final String number;
  final String label;

  const _EmergencyRow({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.phone, color: AppColors.riskExtreme, size: 18),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number,
                style: AppTypography.headlineMedium.copyWith(
                  color: AppColors.riskExtreme,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(label, style: AppTypography.bodySmall),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final VoidCallback onRestart;
  final VoidCallback onHome;

  const _ActionButtons({required this.onRestart, required this.onHome});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: onRestart,
            icon: const Icon(Icons.refresh),
            label: const Text('Refazer Avaliação'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: onHome,
            icon: const Icon(Icons.home_outlined),
            label: const Text('Voltar ao Início'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.primary),
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
