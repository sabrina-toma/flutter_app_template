import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/app_color.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    color: AppColor.white,
    iconTheme: IconThemeData(
      color: AppColor.black,
    ),
    foregroundColor: AppColor.black,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColor.primary,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  static const darkAppBarTheme = AppBarTheme(
    color: AppColor.black,
    iconTheme: IconThemeData(
      color: AppColor.white,
    ),
    foregroundColor: AppColor.white,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColor.primary,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
}
