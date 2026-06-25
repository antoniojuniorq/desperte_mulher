import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/routes/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos')),
      );
      return;
    }
    setState(() => _isLoading = true);
    // TODO: integrar com LoginUseCase + API
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);
    if (mounted) context.go(AppRoutes.profile);
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
          'Login do Acolhe',
          style: AppTypography.headlineMedium.copyWith(color: Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite,
                  color: AppColors.primary,
                  size: 40,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text('Área Restrita', style: AppTypography.displayMedium),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Acesso exclusivo para profissionais parceiros da rede.',
                style: AppTypography.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xxl),

              // Card do formulário
              Container(
                padding: const EdgeInsets.all(AppSpacing.xl),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: AppColors.shadow, blurRadius: 24),
                  ],
                ),
                child: Column(
                  children: [
                    // E-mail
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'E-mail institucional',
                        prefixIcon: Icon(Icons.email_outlined,
                            color: AppColors.primary),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // Senha
                    TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        prefixIcon: const Icon(Icons.lock_outlined,
                            color: AppColors.primary),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.textHint,
                          ),
                          onPressed: () => setState(
                              () => _obscurePassword = !_obscurePassword),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xl),

                    // Botão entrar
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _handleLogin,
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
                                'Entrar',
                                style: AppTypography.labelButton
                                    .copyWith(color: Colors.white),
                              ),
                      ),
                    ),

                    const SizedBox(height: AppSpacing.md),

                    // Link para cadastro
                    TextButton(
                      onPressed: () => context.go(AppRoutes.register),
                      child: Text(
                        'Solicitar acesso à rede',
                        style: AppTypography.bodySmall
                            .copyWith(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
