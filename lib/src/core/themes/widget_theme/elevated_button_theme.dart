import 'package:flutter/material.dart';

import '../../constants/app_color.dart';
import '../../constants/app_size.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightElevatedButtonTheme  = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: AppColor.white,
      backgroundColor: AppColor.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSize.smallBorderRadius,
        ),
      ),
      disabledForegroundColor: AppColor.disabledText,
      disabledBackgroundColor: AppColor.disabled,
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: AppColor.white,
      backgroundColor: AppColor.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSize.smallBorderRadius,
        ),
      ),
      disabledForegroundColor: AppColor.disabledText,
      disabledBackgroundColor: AppColor.disabled,
    ),
  );
}
