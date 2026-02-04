import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  int currentPage = 0;

  void updatePage(int index) {
    currentPage = index;
    notifyListeners();
  }
}
