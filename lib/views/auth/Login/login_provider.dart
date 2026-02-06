import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    isLoading = true;
    notifyListeners();

    // Simulate a login delay
    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    notifyListeners();

    // You can add your real login logic here later
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
