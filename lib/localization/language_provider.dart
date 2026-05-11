import 'package:flutter/material.dart';
import 'app_translations.dart';

class LanguageProvider extends ChangeNotifier {
  String _currentLocale = 'en';

  String get currentLocale => _currentLocale;

  void setLocale(String locale) {
    if (_currentLocale != locale) {
      _currentLocale = locale;
      notifyListeners();
    }
  }

  void toggleLocale() {
    _currentLocale = _currentLocale == 'en' ? 'am' : 'en';
    notifyListeners();
  }

  String translate(String key) {
    return AppTranslations.getString(key, _currentLocale);
  }
}
