import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/auth_service.dart';

class AppController extends GetxController{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final String _keyAppTheme = 'isDarkMode';

  RxBool themeChanged = true.obs;
  final AuthService _authService = AuthService();

  RxBool isDarkMode = false.obs;
  ThemeMode get theme => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;


  @override
  void onInit() {
    getTheTheme();
    super.onInit();
  }

  @override
  void onReady() {
    getTheTheme();
    super.onReady();
  }

  Future<String> getAppTheme() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(_keyAppTheme) ?? '';
  }

  getTheTheme() async {
    log('getTheTheme');
    String theme = await getAppTheme();
    if(theme == 'true'){
      isDarkMode.value = true;
    }else{
      isDarkMode.value = false;
    }
    log('isDarkMode: $isDarkMode');
    log('theme 1: $theme');
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    update();
    log('Get.isDarkMode: ${Get.isDarkMode}');
    return isDarkMode.value;
  }

  void toggleTheme(bool isDark) async {
    themeChanged.value = false;
    isDarkMode.value = isDark;
    log('isDarkMode value: $isDarkMode');
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    // Get.changeTheme(isDarkMode.value ? ThemeData.dark() : ThemeData.light());
    await _authService.setAppTheme(isDarkMode.value.toString());
    await getTheTheme();
    update();
    themeChanged.value = true;
    log('theme: $theme');
    log('theme mode: ${Get.isDarkMode}');
  }
}