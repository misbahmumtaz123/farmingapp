

import 'package:go_router/go_router.dart';

import '../components/navbar.dart';
import '../views/auth/Login/login_view.dart';
import '../views/auth/Signup/signup_view.dart';
import '../views/auth/forgetpassword/forgetpas_view.dart';
import '../views/onboarding/onboarding_view.dart';
import '../views/splash/splash_view.dart';
import 'paths.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutePaths.splash,
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: RoutePaths.onboarding,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: RoutePaths.signup,
      builder: (context, state) => const SignupView(),
    ),
    GoRoute(
      path: RoutePaths.password,
      builder: (context, state) => const ForgotPasswordView(),
    ),
    GoRoute(
      path: RoutePaths.navbar,
      builder: (context, state) => const FarmingNavBar(),
    ),
  ],
);
