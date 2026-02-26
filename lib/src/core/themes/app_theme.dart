import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/// The [AppTheme] defines light and dark themes for the app.
///
/// Theme setup for FlexColorScheme package v8.
/// Use same major flex_color_scheme package version. If you use a
/// lower minor version, some properties may not be supported.
/// In that case, remove them after copying this theme to your
/// app or upgrade the package to version 8.4.0.
///
/// Use it in a [MaterialApp] like this:
///
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
/// );
abstract final class AppTheme {
  // The FlexColorScheme defined light mode ThemeData.
  static ThemeData light = FlexThemeData.light(
    // Using FlexColorScheme built-in FlexScheme enum based colors
    scheme: FlexScheme.blumineBlue,
    // Component theme configurations for light mode.
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorRadius: 12.0,
      alignedDropdown: true,
      snackBarRadius: 8,
      snackBarElevation: 4,
      menuRadius: 8.0,
      searchBarRadius: 12.0,
      searchViewRadius: 12.0,
      navigationRailUseIndicator: true,
    ),
    // Direct ThemeData properties.
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );

  // The FlexColorScheme defined dark mode ThemeData.
  static ThemeData dark = FlexThemeData.dark(
    // Using FlexColorScheme built-in FlexScheme enum based colors.
    scheme: FlexScheme.blumineBlue,
    // Component theme configurations for dark mode.
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      blendOnColors: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorRadius: 12.0,
      alignedDropdown: true,
      snackBarRadius: 8,
      snackBarElevation: 4,
      menuRadius: 8.0,
      searchBarRadius: 12.0,
      searchViewRadius: 12.0,
      navigationRailUseIndicator: true,
    ),
    // Direct ThemeData properties.
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}



// import 'package:flutter/material.dart';
//
// import '../constants/app_color.dart';
// import 'widget_theme/appbar_theme.dart';
// import 'widget_theme/bottom_sheet_theme.dart';
// import 'widget_theme/card_theme.dart';
// import 'widget_theme/chip_theme.dart';
// import 'widget_theme/elevated_button_theme.dart';
// import 'widget_theme/text_field_theme.dart';
// import 'widget_theme/text_theme.dart';
//
// class AppTheme {
//
//
//   /// Light theme
//   static ThemeData lightTheme(BuildContext context) {
//     return ThemeData(
//       useMaterial3: true,
//       brightness: Brightness.light,
//       scaffoldBackgroundColor: AppColor.appBackgroundColor,
//       appBarTheme: TAppBarTheme.lightAppBarTheme,
//       textTheme: TTextTheme.lightTextTheme(context),
//       inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
//       iconTheme: const IconThemeData(
//         color: AppColor.primary,
//       ),
//       elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
//       chipTheme: TChipTheme.lightChipTheme,
//       checkboxTheme: const CheckboxThemeData(
//         shape: StadiumBorder(),
//       ),
//       cardTheme: TCardTheme.lightCardTheme,
//       bottomSheetTheme: TBottomSheetThemeData.lightBottomSheetThemeData,
//       dropdownMenuTheme: DropdownMenuThemeData(
//         inputDecorationTheme: InputDecorationTheme(
//           border: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: AppColor.secondary,
//             )
//           )
//         )
//       ),
//     );
//   }
//
//   /// Dark theme
//   static ThemeData darkTheme(BuildContext context) {
//     return ThemeData(
//       useMaterial3: true,
//       brightness: Brightness.dark,
//       scaffoldBackgroundColor: AppColor.appBackgroundColorDark,
//       appBarTheme: TAppBarTheme.darkAppBarTheme,
//       textTheme: TTextTheme.darkTextTheme(context),
//       inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
//       iconTheme: const IconThemeData(
//         color: AppColor.primary,
//       ),
//       elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
//       chipTheme: TChipTheme.darkChipTheme,
//       checkboxTheme: const CheckboxThemeData(
//         shape: StadiumBorder(),
//       ),
//       cardTheme: TCardTheme.darkCardTheme,
//       bottomSheetTheme: TBottomSheetThemeData.darkBottomSheetThemeData,
//     );
//   }
// }