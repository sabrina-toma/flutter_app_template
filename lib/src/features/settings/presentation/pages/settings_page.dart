import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/app_widgets/text/app_text_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../applications/controllers/settings_controller.dart';
import '../widgets/setting_page_dialogs.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: 'Settings', textStyle: TextStyleType.titleMedium),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
          child: Column(
            children: [
              /// theme
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(text: 'App Theme', textStyle: TextStyleType.titleMedium),
                  InkWell(
                    onTap: () async {
                      String? selectedTheme = await showThemeOptionDialog();
                      if (selectedTheme != null) {
                        log('User selected: $selectedTheme');
                        controller.changeTheTheme(selectedTheme == 'light' ? ThemeMode.light : ThemeMode.dark);
                        if (selectedTheme == 'light') {
                          Get.changeThemeMode(ThemeMode.light);
                        } else {
                          Get.changeThemeMode(ThemeMode.dark);
                        }
                      }
                    },
                    child: Row(
                      children: [
                        Obx(()=> AppText(text: controller.themeText.value, textStyle: TextStyleType.titleMedium)),
                        Icon(Icons.arrow_right_outlined),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
