import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import 'widget_theme/appbar_theme.dart';
import 'widget_theme/bottom_sheet_theme.dart';
import 'widget_theme/card_theme.dart';
import 'widget_theme/chip_theme.dart';
import 'widget_theme/elevated_button_theme.dart';
import 'widget_theme/text_field_theme.dart';
import 'widget_theme/text_theme.dart';

class AppTheme {


  /// Light theme
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColor.appBackgroundColor,
      appBarTheme: TAppBarTheme.lightAppBarTheme,
      textTheme: TTextTheme.lightTextTheme(context),
      inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
      iconTheme: const IconThemeData(
        color: AppColor.primary,
      ),
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      chipTheme: TChipTheme.lightChipTheme,
      checkboxTheme: const CheckboxThemeData(
        shape: StadiumBorder(),
      ),
      cardTheme: TCardTheme.lightCardTheme,
      bottomSheetTheme: TBottomSheetThemeData.lightBottomSheetThemeData,
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.secondary,
            )
          )
        )
      ),
    );
  }

  /// Dark theme
  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColor.appBackgroundColorDark,
      appBarTheme: TAppBarTheme.darkAppBarTheme,
      textTheme: TTextTheme.darkTextTheme(context),
      inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
      iconTheme: const IconThemeData(
        color: AppColor.primary,
      ),
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      chipTheme: TChipTheme.darkChipTheme,
      checkboxTheme: const CheckboxThemeData(
        shape: StadiumBorder(),
      ),
      cardTheme: TCardTheme.darkCardTheme,
      bottomSheetTheme: TBottomSheetThemeData.darkBottomSheetThemeData,
    );
  }
}