import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  String selectedLang = 'en';
  List<String> language = ['en', 'ar'];
  ThemeMode selectedTheme = ThemeMode.light;
  List<String> theme = ['light', 'dark'];

  changeLangauge(String value, BuildContext context) {
    context.setLocale(Locale(value));
    notifyListeners();
  }

  changeTheme(String mode) async {
    var prefs = await SharedPreferences.getInstance();
    mode == 'light'
        ? {selectedTheme = ThemeMode.light}
        : selectedTheme = ThemeMode.dark;
    prefs.setBool('isDark', selectedTheme == ThemeMode.dark);
    notifyListeners();
  }

  getTheme() async {
    var prefs = await SharedPreferences.getInstance();
    bool? currentTheme = prefs.getBool('isDark');
    if (currentTheme != null) {
      if (currentTheme == true) {
        selectedTheme = ThemeMode.dark;
      } else {
        selectedTheme = ThemeMode.light;
      }
    }
    notifyListeners();
  }
}
