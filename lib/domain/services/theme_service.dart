import 'package:combatdex/ui/theme.dart' as theme_data;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService extends ChangeNotifier {
  ThemeData _theme = ThemeData();
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  ThemeService({bool darkMode = false}) {
    _isDarkMode = darkMode;
    _theme = theme_data.getTheme(_isDarkMode);
    GetIt.I<SharedPreferences>().setBool('isDarkMode', _isDarkMode);
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _theme = theme_data.getTheme(_isDarkMode);
    GetIt.I<SharedPreferences>().setBool('isDarkMode', _isDarkMode);
    notifyListeners();
  }

  ThemeData get theme => _theme;
}
