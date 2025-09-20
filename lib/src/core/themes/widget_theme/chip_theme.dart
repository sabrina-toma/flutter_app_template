import 'package:flutter/material.dart';

import '../../constants/app_color.dart';
import '../../constants/app_size.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = const ChipThemeData().copyWith(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
    ),
    checkmarkColor: AppColor.white,
    selectedColor: AppColor.primary,
    backgroundColor: AppColor.grey,
    side: const BorderSide(
      color: Colors.transparent,
    ),
  );

  static ChipThemeData darkChipTheme = const ChipThemeData().copyWith(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
    ),
    checkmarkColor: AppColor.black,
    selectedColor: AppColor.primary,
    backgroundColor: AppColor.grey,
    side: const BorderSide(
      color: AppColor.border,
    ),
  );
}
