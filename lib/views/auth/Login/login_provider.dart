import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
