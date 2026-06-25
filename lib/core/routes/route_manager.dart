import 'package:go_router/go_router.dart';
import 'app_routes.dart';
import '../../presentation/home/home_page.dart';
import '../../presentation/quiz/quiz_page.dart';
import '../../presentation/result/result_page.dart';
import '../../presentation/login/login_page.dart';
import '../../presentation/profile/profile_page.dart';
import '../../presentation/registration/register_page.dart';
import '../../presentation/demo/demo_page.dart';
import '../../presentation/photo/photo_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (_, __) => const HomePage(),
    ),
    GoRoute(
      path: AppRoutes.quiz,
      builder: (_, __) => const QuizPage(),
    ),
    GoRoute(
      path: AppRoutes.result,
      builder: (_, state) {
        final score = state.extra as int? ?? 0;
        return ResultPage(score: score);
      },
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (_, __) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.profile,
      builder: (_, __) => const ProfilePage(),
    ),
    GoRoute(
      path: AppRoutes.register,
      builder: (_, __) => const RegisterPage(),
    ),
    GoRoute(
      path: AppRoutes.demo,
      builder: (_, __) => const DemoPage(),
    ),
    GoRoute(
      path: AppRoutes.photo,
      builder: (_, __) => const PhotoPage(),
    ),
  ],
  errorBuilder: (context, state) => const HomePage(),
);
