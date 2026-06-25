import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../common/widgets/app_drawer.dart';
import '../../common/widgets/app_footer.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/routes/app_routes.dart';
import '../../common/widgets/app_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(
          children: const [
            Icon(Icons.favorite, color: AppColors.accentLight, size: 20),
            SizedBox(width: 8),
            Text(
              'Desperte Mulher',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone, color: AppColors.accentLight),
            tooltip: 'Emergência 180',
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _HeroSection(),
            _WhySection(),
            _HowItWorksSection(),
            _RiskLevelsSection(),
            _CtaSection(),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}

// ─── Hero ───────────────────────────────────────────────────────────────────

class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primaryDark, AppColors.primary, Color(0xFFB94FC8)],
        ),
      ),
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.md),
          Text(
            'Conhecimento é o primeiro passo para a',
            style: AppTypography.bodyLarge.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'liberdade.',
            style: AppTypography.displayLarge.copyWith(
              color: AppColors.accentLight,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'A análise de risco ajuda você a entender o nível de perigo, '
            'planejar sua segurança e tomar decisões com clareza — no seu tempo, no seu ritmo.',
            style: AppTypography.bodyMedium.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: AppSpacing.xl),
          AppButton.primary(
            label: 'Quero entender meu risco',
            onPressed: () => context.go(AppRoutes.quiz),
            icon: Icons.shield_outlined,
            width: double.infinity,
          ),
          const SizedBox(height: AppSpacing.sm),
          AppButton.secondary(
            label: 'Como funciona?',
            onPressed: () {},
            width: double.infinity,
          ),
          const SizedBox(height: AppSpacing.xl),
          // Badges
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: const [
              _Badge(icon: '🔒', label: '100% Anônimo'),
              _Badge(icon: '💜', label: 'Gratuito'),
              _Badge(icon: '🔬', label: 'Metodologia científica'),
              _Badge(icon: '🕐', label: 'Suporte 24h'),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String icon;
  final String label;

  const _Badge({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: const TextStyle(fontSize: 14)),
          const SizedBox(width: AppSpacing.xs),
          Text(
            label,
            style: AppTypography.bodySmall.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

// ─── Por que é importante ────────────────────────────────────────────────────

class _WhySection extends StatelessWidget {
  static const _items = [
    (Icons.search, 'Identifica padrões invisíveis',
        'Muitas formas de controle passam despercebidas. A avaliação revela sinais de alerta que você pode não ter reconhecido.'),
    (Icons.shield_outlined, 'Apoia decisões seguras',
        'Com informações claras sobre o nível de perigo, você consegue planejar seus próximos passos com segurança.'),
    (Icons.child_care, 'Protege seus filhos',
        'A avaliação considera o impacto sobre crianças e adolescentes, garantindo que eles estejam no plano de proteção.'),
    (Icons.timer_outlined, 'Você decide o ritmo',
        'Sem julgamentos, prazos ou obrigações. A avaliação é feita no seu tempo, no seu espaço seguro.'),
    (Icons.star_outline, 'Reconhece sua força',
        'O processo não é sobre vulnerabilidade — é sobre empoderamento. Nomear o que acontece é um ato de coragem.'),
    (Icons.bolt_outlined, 'Agiliza o acesso à ajuda',
        'Profissionais de segurança utilizam a análise para priorizar casos e direcionar recursos de forma eficaz.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'POR QUE É IMPORTANTE',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.primary,
              letterSpacing: 2,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'A análise de risco salva vidas',
            style: AppTypography.displayMedium,
          ),
          const SizedBox(height: AppSpacing.xl),
          ..._items.map((item) => _WhyCard(
                icon: item.$1,
                title: item.$2,
                description: item.$3,
              )),
        ],
      ),
    );
  }
}

class _WhyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _WhyCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.primaryLight.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.primary, size: 24),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.headlineMedium,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(description, style: AppTypography.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Como funciona ───────────────────────────────────────────────────────────

class _HowItWorksSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surfaceVariant,
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'COMO FUNCIONA',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.primary,
              letterSpacing: 2,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text('Perguntas simples,\nrespostas que protegem',
              style: AppTypography.displayMedium),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Nosso formulário é baseado no Formulário Nacional de Avaliação de Riscos (FONAR), '
            'desenvolvido pelo CNJ e CNMP.',
            style: AppTypography.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.xl),
          ..._buildSteps(),
        ],
      ),
    );
  }

  List<Widget> _buildSteps() {
    final steps = [
      (Icons.assignment_outlined, '1. Responda as perguntas',
          'Perguntas simples baseadas no FONAR sobre sua situação.'),
      (Icons.calculate_outlined, '2. Calculamos seu risco',
          'Um algoritmo científico analisa suas respostas.'),
      (Icons.insights, '3. Veja seu resultado',
          'Você recebe o nível de risco e recomendações personalizadas.'),
      (Icons.support_agent, '4. Acesse ajuda',
          'Conectamos você com a rede de apoio mais adequada.'),
    ];

    return steps
        .map((s) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(s.$1, color: Colors.white, size: 20),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(s.$2, style: AppTypography.headlineMedium),
                        Text(s.$3, style: AppTypography.bodyMedium),
                      ],
                    ),
                  ),
                ],
              ),
            ))
        .toList();
  }
}

// ─── Níveis de risco ─────────────────────────────────────────────────────────

class _RiskLevelsSection extends StatelessWidget {
  static const _levels = [
    (AppColors.riskVeryLow, 'Muito Baixo', '20%'),
    (AppColors.riskLow, 'Baixo', '40%'),
    (AppColors.riskModerate, 'Moderado', '60%'),
    (AppColors.riskHigh, 'Alto', '80%'),
    (AppColors.riskExtreme, 'Extremo', '100%'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'NÍVEIS DE RISCO IDENTIFICADOS',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.primary,
              letterSpacing: 2,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text('A nota é classificada em 5 níveis diferentes',
              style: AppTypography.headlineLarge),
          const SizedBox(height: AppSpacing.xl),
          // Barra de progresso dos níveis
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Row(
              children: _levels
                  .map((l) => Expanded(child: Container(height: 10, color: l.$1)))
                  .toList(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          // Cards dos níveis
          ..._levels.map((l) => _RiskCard(color: l.$1, label: l.$2, percent: l.$3)),
        ],
      ),
    );
  }
}

class _RiskCard extends StatelessWidget {
  final Color color;
  final String label;
  final String percent;

  const _RiskCard({
    required this.color,
    required this.label,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(label, style: AppTypography.bodyLarge.copyWith(
              color: color, fontWeight: FontWeight.w700)),
          ),
          Text(
            percent,
            style: AppTypography.headlineMedium.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}

// ─── CTA ─────────────────────────────────────────────────────────────────────

class _CtaSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
      ),
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        children: [
          Text(
            'Pronta para dar\no primeiro passo?',
            style: AppTypography.displayMedium.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Você não precisa ter certeza de nada para começar. Nossa avaliação foi criada para te ajudar a enxergar com mais clareza.',
            style: AppTypography.bodyMedium.copyWith(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xl),
          ElevatedButton.icon(
            onPressed: () => context.go(AppRoutes.quiz),
            icon: const Icon(Icons.play_arrow),
            label: const Text('Iniciar Análise de Risco'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accent,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
