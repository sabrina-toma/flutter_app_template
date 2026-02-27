import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/app_widgets/buttons/app_button.dart';
import 'package:flutter_app_template/src/app_widgets/text/app_text_widgets.dart';
import 'package:flutter_app_template/src/core/constants/app_constrains.dart';
import 'package:flutter_app_template/src/core/themes/theme_extension.dart';
import 'package:get/get.dart';

Future<String?> showThemeOptionDialog() async {
  return await showDialog<String>(
    context: Get.context!,
    builder: (context) => AlertDialog(
      title: AppText(text: 'Select Theme', textStyle: TextStyleType.titleMedium,),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
            onTap: (){
              Get.back(result: 'light');
            },
            child: AppText(text: 'Light', textStyle: TextStyleType.bodyMedium, color: context.buttonTextColor,),
          ),
          AppConstrains.spaceBetweenItems,
          AppButton(
            onTap: (){
              Get.back(result: 'dark');
              },
            child: AppText(text: 'Dark', textStyle: TextStyleType.bodyMedium, color: context.buttonTextColor,),
          ),
        ],
      ),
    ),
  );
}