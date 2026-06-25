import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/routes/app_routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _orgController = TextEditingController();
  final _passwordController = TextEditingController();
  String _selectedRole = 'Assistente Social';
  bool _isLoading = false;

  static const _roles = [
    'Assistente Social',
    'Psicólogo(a)',
    'Advogado(a)',
    'Delegado(a)',
    'Profissional de Saúde',
    'Educador(a)',
    'Outros',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _orgController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    setState(() => _isLoading = true);
    // TODO: integrar com RegisterUseCase + API
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Solicitação enviada! Aguarde a aprovação.'),
          backgroundColor: AppColors.riskVeryLow,
        ),
      );
      context.go(AppRoutes.home);
    }
  }

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
          'Faça Parte da Rede',
          style: AppTypography.headlineMedium.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cadastro de Parceiro', style: AppTypography.displayMedium),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Profissionais e instituições que atuam no atendimento à mulher em situação de violência.',
              style: AppTypography.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.xl),

            Container(
              padding: const EdgeInsets.all(AppSpacing.xl),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: AppColors.shadow, blurRadius: 20),
                ],
              ),
              child: Column(
                children: [
                  _buildField(
                    controller: _nameController,
                    label: 'Nome completo',
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _buildField(
                    controller: _emailController,
                    label: 'E-mail institucional',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _buildField(
                    controller: _orgController,
                    label: 'Instituição / Organização',
                    icon: Icons.business_outlined,
                  ),
                  const SizedBox(height: AppSpacing.md),

                  // Dropdown de função
                  DropdownButtonFormField<String>(
                    value: _selectedRole,
                    decoration: const InputDecoration(
                      labelText: 'Função / Cargo',
                      prefixIcon: Icon(Icons.work_outline,
                          color: AppColors.primary),
                    ),
                    items: _roles
                        .map((r) =>
                            DropdownMenuItem(value: r, child: Text(r)))
                        .toList(),
                    onChanged: (v) => setState(() => _selectedRole = v!),
                  ),
                  const SizedBox(height: AppSpacing.md),

                  _buildField(
                    controller: _passwordController,
                    label: 'Senha',
                    icon: Icons.lock_outlined,
                    obscureText: true,
                  ),
                  const SizedBox(height: AppSpacing.xl),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _handleRegister,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 52),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.5,
                              ),
                            )
                          : Text(
                              'Solicitar Cadastro',
                              style: AppTypography.labelButton
                                  .copyWith(color: Colors.white),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors.primary),
      ),
    );
  }
}
