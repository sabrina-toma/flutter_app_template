import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final String _keyAppTheme = 'isDarkMode';

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
}