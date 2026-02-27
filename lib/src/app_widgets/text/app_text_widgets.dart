import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/themes/theme_extension.dart';
import 'package:get/get.dart';


class TextStyleType {
  static TextStyle displayLarge = Get.textTheme.displayLarge!;
  static TextStyle displayMedium = Get.textTheme.displayMedium!;
  static TextStyle displaySmall = Get.textTheme.displaySmall!;
  static TextStyle headlineLarge = Get.textTheme.headlineLarge!;
  static TextStyle headlineMedium = Get.textTheme.headlineMedium!;
  static TextStyle headlineSmall = Get.textTheme.headlineSmall!;
  static TextStyle titleLarge = Get.textTheme.titleLarge!;
  static TextStyle titleMedium = Get.textTheme.titleMedium!;
  static TextStyle titleSmall = Get.textTheme.titleSmall!;
  static TextStyle bodyLarge = Get.textTheme.bodyLarge!;
  static TextStyle bodyMedium = Get.textTheme.bodyMedium!;
  static TextStyle bodySmall = Get.textTheme.bodySmall!;
  static TextStyle labelSmall = Get.textTheme.labelSmall!;
  static TextStyle labelMedium = Get.textTheme.labelMedium!;
  static TextStyle hintTextStyle = Get.textTheme.bodyMedium!.copyWith(
    color: Get.context!.theme.hintColor,
    fontWeight: FontWeight.w200,
    decoration: TextDecoration.none,
  );
}

class TitleText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  const TitleText({
    super.key,
    required this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      style: textStyle != null
          ? textStyle?.copyWith(
        overflow: TextOverflow.visible,
      )
          : Get.textTheme.bodyLarge?.copyWith(
        overflow: TextOverflow.visible,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class AppText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final double? decorationThickness, fontSize;

  const AppText({
    super.key,
    required this.text,
    required this.textStyle,
    this.fontWeight,
    this.fontStyle,
    this.color,
    this.textAlign,
    this.overflow,
    this.decoration,
    this.decorationThickness,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      style: textStyle.copyWith(
        overflow: overflow ?? TextOverflow.visible,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontSize: fontSize,
        color: color ?? context.colors.onPrimaryContainer,//(Get.isDarkMode ? AppColor.textColorDark : AppColor.textColor),
        decoration: decoration ?? TextDecoration.none,
        decorationColor: color ?? context.colors.onPrimaryContainer, // (Get.isDarkMode ? AppColor.textColorDark : AppColor.textColor),
        decorationThickness: decorationThickness ?? 1,
      ),

    );
  }
}
