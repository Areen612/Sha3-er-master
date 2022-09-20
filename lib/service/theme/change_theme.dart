import 'package:shagher/service/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeChange extends ChangeNotifier {
  bool isDark = false;

  set updateTheme(bool value) {
    isDark = value;
    notifyListeners();
  }

  void updateThemeShared() async {
    if (isDark != await AppTheme.getTheme) {
      isDark = true;
      notifyListeners();
    }
  }

  ThemeMode get themeModel => isDark ? ThemeMode.dark : ThemeMode.light;
}
