import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ThemeX on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get textStyles => Theme.of(this).textTheme;
}

extension ColorSchemeX on BuildContext {
  /// Access the full color scheme
  ColorScheme get color => Theme.of(this).colorScheme;

  /// Shortcut for the default text color
  Color get textColor => color.onPrimaryContainer;
  Color get disabledColor => Get.context!.theme.disabledColor;
  Color get buttonTextColor => color.surface;
  Color get whiteColor => Color(0xFFFFFFFF);
  Color get starColor => Color(0xFFFF9c30);
  Color get transparent => Colors.transparent;
  Color get backgroundColor => color.surfaceContainer;
  Color get successColor => Color(0xFF388E3C);
}