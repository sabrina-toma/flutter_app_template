import 'package:flutter/material.dart';

extension ThemeX on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get textStyles => Theme.of(this).textTheme;
}

extension ColorSchemeX on BuildContext {
  /// Access the full color scheme
  ColorScheme get color => Theme.of(this).colorScheme;

  /// Shortcut for the default text color
  Color get textColor => color.onPrimaryContainer;
  Color get disabledColor => color.outline;
  Color get buttonTextColor => color.surface;
  Color get whiteColor => Color(0xFFFFFFFF);
  Color get starColor => Color(0xFFFF9c30);
  Color get transparent => Colors.transparent;
}