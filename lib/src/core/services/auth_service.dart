import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class AuthService{

  static const String _keyAppTheme = 'isDarkMode';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// App Theme
  Future<void> setAppTheme(String theme) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(_keyAppTheme, theme);
    log('Stored theme: $theme');
  }

  Future<String> getAppTheme() async {
    final SharedPreferences prefs = await _prefs;
    String appTheme = prefs.getString(_keyAppTheme) ?? '';
    log('appTheme is restored: $appTheme');
    return appTheme;
  }
}
