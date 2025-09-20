import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../core/constants/app_color.dart';


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
    backgroundColor: AppColor.errorSnackBarBackgroundColor,
    toastLength: Toast.LENGTH_LONG,
  );

  static void showSuccess(String message) =>
      Fluttertoast.showToast(msg: message, backgroundColor: AppColor.successSnackBarBackgroundColor);

  static void showWarning(String message) => Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.orange[600],
    toastLength: Toast.LENGTH_LONG,
  );
}