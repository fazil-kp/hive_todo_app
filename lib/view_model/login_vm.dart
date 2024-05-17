import 'package:flutter/material.dart';

class LoginVM extends ChangeNotifier {
  bool isLightTheme = true;

  void toggleTheme() {
    isLightTheme = !isLightTheme;
    notifyListeners();
  }
}
