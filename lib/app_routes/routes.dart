import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import '../Views/auth/Login/login_view.dart';
import '../Views/auth/Signup/signup_view.dart';
import '../Views/dashboard/home_screen.dart';
import '../Views/dashboard/mycrop_screen.dart';
import '../Views/dashboard/order_screen.dart';
import '../Views/dashboard/profile_screen.dart';
import '../Views/onboarding/onboarding_view.dart';
import '../Views/splash/splash_view.dart';
import '../components/navbar.dart';
import 'paths.dart';

final router = GoRouter(
  initialLocation: RoutePaths.splash,
  routes: [
    // Splash screen
    GoRoute(
      path: RoutePaths.splash,
      builder: (context, state) => const SplashView(),
    ),

    // Onboarding
    GoRoute(
      path: RoutePaths.onboarding,
      builder: (context, state) => OnboardingView(),
    ),

    // Auth
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: RoutePaths.signup,
      builder: (context, state) => const SignupView(),
    ),

    // Dashboard ShellRoute
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return FarmingNavBar(child: child); // child is the current screen
      },
      routes: [
        GoRoute(
          path: RoutePaths.home,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: RoutePaths.product,
          builder: (context, state) => const ProductsScreen(),
        ),
        GoRoute(
          path: RoutePaths.order,
          builder: (context, state) => const OrdersScreen(),
        ),
        GoRoute(
          path: RoutePaths.profile,
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);
