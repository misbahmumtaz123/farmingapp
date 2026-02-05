import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../Views/auth/Login/login_view.dart';
import '../Views/auth/Signup/signup_view.dart';
import '../Views/onboarding/onboarding_view.dart';
import '../Views/splash/splash_view.dart';
import '../components/navbar.dart';
import 'paths.dart';

final router = GoRouter(
  initialLocation: RoutePaths.splash,
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: RoutePaths.onboarding,
      builder: (context, state) =>  OnboardingView(),
    ),
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: RoutePaths.signup,
      builder: (context, state) => const SignupView(),
    ),

    // Main app with bottom nav
    GoRoute(
      path: RoutePaths.navbar,
      builder: (context, state) => const FarmingNavBar(),
    ),
  ],
);
