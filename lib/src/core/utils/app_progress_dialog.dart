
import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/themes/theme_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../constants/app_constrains.dart';

class AppProgressDialog {
  static show(BuildContext context, String title) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: context.colors.primary,
          size: 30,
        ),
      ),
    );
  }

  static hide() {
    return Get.back();
  }

  static void showLoading({Widget? dynamicText}) {
    Get.dialog(
      barrierDismissible: false,
      barrierColor: Get.context!.colors.outline,
      Dialog(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Card(
          color: Get.context!.colors.primary,
          elevation: 5,
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppConstrains.spaceBetweenSections,
                Center(
                  child: LoadingAnimationWidget.threeArchedCircle(
                    color: Get.context!.colors.onPrimary,
                    size: 30.r,
                  ),
                ),
                dynamicText ??
                    Text('Please wait...',
                        style: Get.textTheme.bodyMedium!.copyWith(
                          color: Get.context!.colors.onPrimary,
                        )),
                AppConstrains.spaceBetweenItems,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget progressLoader() {
  return Container(
    alignment: AlignmentDirectional.center,
    decoration: const BoxDecoration(
      color: Colors.white70,
    ),
    child: Container(
      decoration: BoxDecoration(
          color: Get.context!.colors.primary,
          borderRadius: BorderRadius.circular(10.0)),
      width: 300.0,
      height: 100.0,
      alignment: AlignmentDirectional.center,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SizedBox(
              height: 30.0,
              width: 30.0,
              child: CircularProgressIndicator(
                value: null,
                strokeWidth: 2.0,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: Text(
              "loading.. wait...",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}
