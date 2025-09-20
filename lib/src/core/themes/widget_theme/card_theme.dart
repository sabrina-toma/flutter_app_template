
import 'package:flutter/material.dart';

import '../../constants/app_color.dart';
import '../../constants/app_size.dart';

/// Custom Class for Light & Dark Card Themes
class TCardTheme {
  TCardTheme._(); // To avoid creating instances

  /// Customizable Light Card Theme
  static CardThemeData lightCardTheme = CardThemeData(
    color: AppColor.white,
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(AppSize.largeBorderRadius),
      ),
    ),
  );

  /// Customizable Dark Card Theme
  static CardThemeData darkCardTheme = CardThemeData(
    color: AppColor.white,
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(AppSize.largeBorderRadius),
      ),
    ),
  );
}
