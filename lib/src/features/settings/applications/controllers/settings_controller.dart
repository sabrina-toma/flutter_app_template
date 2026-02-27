import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/controller/app_controller.dart';

class SettingsController extends GetxController{

  final AppController appController = Get.find<AppController>();
  RxString themeText = ''.obs;
  RxBool isDarkModeEnable = false.obs;

  @override
  void onInit() {
    getThemeString();
    super.onInit();
  }

  getThemeString(){
    themeText.value = appController.isDarkMode.value ? 'Dark' : 'Light';
    isDarkModeEnable.value = appController.isDarkMode.value;
  }

  changeTheTheme(ThemeMode themeMode){
    if(themeMode == ThemeMode.light){
      appController.isDarkMode.value = false;
      isDarkModeEnable.value = false;
      appController.toggleTheme(false);
      themeText.value = 'Light';
    }else if(themeMode == ThemeMode.dark) {
      appController.isDarkMode.value = true;
      isDarkModeEnable.value = true;
      appController.toggleTheme(true);
      themeText.value = 'Dark';
    }

    log('Changed theme: ${Get.isDarkMode ? 'Dark' : 'Light'}');
  }
}