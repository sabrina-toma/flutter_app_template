import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/themes/theme_extension.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';



class AppSnacks {
  AppSnacks._();

  static void showDefault(String title, String message) => Fluttertoast.showToast(msg: message);

  static void showError(String message) => Fluttertoast.showToast(msg: message, backgroundColor: Colors.red[600], toastLength: Toast.LENGTH_LONG);

  static void showSuccess(String message) => Fluttertoast.showToast(msg: message);

  static void showWarning(String message) => Fluttertoast.showToast(msg: message, backgroundColor: Colors.orange[600], toastLength: Toast.LENGTH_LONG);
}

class AppSnack {
  AppSnack._();

  static void showDefault(String message) =>
      Fluttertoast.showToast(msg: message);

  static void showError(String message) => Fluttertoast.showToast(
    msg: message,
    backgroundColor: Get.context!.colors.errorContainer,
    toastLength: Toast.LENGTH_LONG,
  );

  static void showSuccess(String message) =>
      Fluttertoast.showToast(msg: message, backgroundColor: Get.context!.successColor);

  static void showWarning(String message) => Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.orange[600],
    toastLength: Toast.LENGTH_LONG,
  );
}