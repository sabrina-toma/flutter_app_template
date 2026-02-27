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
}