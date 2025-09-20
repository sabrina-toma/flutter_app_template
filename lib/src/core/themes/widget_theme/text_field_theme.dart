import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_color.dart';
import '../../constants/app_size.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    // prefixIconColor: TColors.darkGrey,
    // suffixIconColor: TColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    // labelStyle: const TextStyle().copyWith(fontSize: TSizes.fontSizeMd, color: TColors.black),
    // hintStyle: const TextStyle().copyWith(fontSize: TSizes.fontSizeSm, color: TColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: AppColor.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: AppColor.textInputBorderColorDark,
        width: 2.w,
      ),
      borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: AppColor.primary,
        width: 2.w,
      ),
      borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: AppColor.primary,
        width: 2.w,
      ),
      borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: AppColor.errorColor,
        width: 2.w,
      ),
      borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: AppColor.errorColor,
        width: 2.w,
      ),
      borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    // prefixIconColor: TColors.darkGrey,
    // suffixIconColor: TColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    // labelStyle: const TextStyle().copyWith(fontSize: TSizes.fontSizeMd, color: TColors.white),
    // hintStyle: const TextStyle().copyWith(fontSize: TSizes.fontSizeSm, color: TColors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: AppColor.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: AppColor.textInputBorderColorDark,
        width: 2.w,
      ),
      borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: AppColor.primary,
        width: 2.w,
      ),
      borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: AppColor.primary,
        width: 2.w,
      ),
      borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: AppColor.errorColor,
        width: 2.w,
      ),
      borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: AppColor.errorColor,
        width: 2.w,
      ),
      borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
    ),
  );
}
