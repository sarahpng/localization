import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeController with ChangeNotifier {
  Locale? _appLocale;
  Locale? get appLocale => _appLocale;

  Future<void> fetchLanguage() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final langCode = sp.getString('language_code');
    _appLocale = Locale(langCode ?? 'en');
    notifyListeners();
  }

  void changeLanguage(Locale locale) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (locale == Locale('en')) {
      await sp.setString('language_code', 'en');
      // _appLocale = locale;
    } else {
      await sp.setString('language_code', 'es');
    }
    _appLocale = locale;
    notifyListeners();
  }
}
