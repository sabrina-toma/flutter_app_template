import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSize {
  /// Default spacing
  static double defaultWidthSpacing = ScreenUtil().setWidth(20);

  /// Border radius sizing
  static double smallBorderRadius = 4;
  static double mediumBorderRadius = 8;
  static double largeBorderRadius = 10;

  static EdgeInsetsGeometry inputFieldContentPadding = EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w);

  static double modelCloseIconSize = ScreenUtil().setWidth(25);

  static double navBarIconSize = 30.r;



  /// Button sizing
  static double smallButtonHeight = ScreenUtil().setHeight(30);
  static double smallButtonWidth = ScreenUtil().setWidth(80);

  /// Calendar dialog sizing
  static double calendarDialogWidth = ScreenUtil().setWidth(300);
  static double calendarDialogHeight = ScreenUtil().setHeight(350);

  /// Toggle switch button scaling factor
  static double scalingFactorMd = 0.8;
  static double scalingFactorLg = 1;

  /// Spacing between items and sections
  static double defaultSpace = 10;
  static double spaceBtwSection = 15;
  static double spaceBtwItem = 10;

  /// Slider/Range Slider
  static double sliderThumbRadius = ScreenUtil().setWidth(13);
  static double sliderInactiveTrackHeight = ScreenUtil().setWidth(2);
  static double sliderActiveTrackHeight = ScreenUtil().setWidth(2.5);
  static double sliderOverlayRadius = ScreenUtil().setWidth(30);

  /// TextForm
  static double cursorHeight = 20.h;
  static double inputBoxConstraints = 35.h;
}