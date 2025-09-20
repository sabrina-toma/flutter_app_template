
import 'package:flutter/material.dart';

import '../../constants/app_color.dart';
import '../../constants/app_size.dart';

class TBottomSheetThemeData {
  TBottomSheetThemeData._();

  static BottomSheetThemeData lightBottomSheetThemeData = BottomSheetThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppSize.largeBorderRadius),
        topRight: Radius.circular(AppSize.largeBorderRadius),
      ),
    ),
    backgroundColor: AppColor.white,
    showDragHandle: true,
  );

  static BottomSheetThemeData darkBottomSheetThemeData = BottomSheetThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppSize.largeBorderRadius),
        topRight: Radius.circular(AppSize.largeBorderRadius),
      ),
    ),
    backgroundColor: AppColor.black,
    showDragHandle: true,
  );
}