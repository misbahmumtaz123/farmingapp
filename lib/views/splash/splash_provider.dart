import 'package:farmingapp/app_routes/paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashProvider extends ChangeNotifier {
  Future<void> init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));

    // prevent navigation error in debug
    if (!context.mounted) return;

    context.go(RoutePaths.onboarding);
  }
}
