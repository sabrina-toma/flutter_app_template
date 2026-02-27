
import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/app_widgets/text/app_text_widgets.dart';
import 'package:flutter_app_template/src/core/themes/theme_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/constants/app_size.dart';

class InputTextForm extends StatelessWidget {
  const InputTextForm({
    super.key,
    this.controller,
    this.cursorColor,
    this.onChanged,
    this.borderColor,
    this.hintText,
    this.obscureText,
    this.suffixIcon,
    this.obscuringCharacter,
    this.onTapOutside,
    this.prefixIcon,
    this.hintStyle,
    this.style,
    this.initialValue,
    this.inputTextColor,
    this.labelText,
    this.labelStyle,
    this.keyboardType,
    this.textFieldHeight,
    this.errorText,
    this.errorStyle,
    this.enabled,
    this.readOnly, this.maxLines,this.minLines, this.maxLength,
    this.onTap,
    this.scrollPadding,
    this.textCapitalization,
    this.textInputAction,
    this.isHideCounterText,
    this.focusNode,
  });

  final TextEditingController? controller;
  final Color? cursorColor, borderColor, inputTextColor;
  final void Function(String)? onChanged;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function()? onTap;
  final String? hintText, obscuringCharacter, initialValue, labelText, errorText;
  final bool? obscureText, readOnly, enabled, isHideCounterText;
  final TextCapitalization? textCapitalization;
  final Widget? suffixIcon, prefixIcon;
  final TextStyle? hintStyle, style, labelStyle, errorStyle;
  final TextInputType? keyboardType;
  final double? textFieldHeight, scrollPadding;
  final int? maxLines, minLines, maxLength;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: textFieldHeight ?? 45.h,
      child: TextFormField(
        focusNode: focusNode,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        enabled: enabled ?? true,
        controller: controller,
        initialValue: initialValue,
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        minLines: minLines ?? 1,
        readOnly: readOnly ?? false,
        // textInputAction: textInputAction ?? TextInputAction.none,
        cursorColor: cursorColor ?? context.textColor,
        scrollPadding: EdgeInsets.all(scrollPadding ?? 0.0),
        cursorWidth: 1.0.w,
        style: style ??
            Get.textTheme.labelMedium!.copyWith(
              color: (enabled ?? true) ? inputTextColor ?? context.textColor : context.disabledColor,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
            ),
        textAlignVertical: TextAlignVertical.center,
        cursorOpacityAnimates: true,
        onTap: onTap,
        onTapOutside: onTapOutside,
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        obscuringCharacter: obscuringCharacter ?? '.',
        keyboardType: keyboardType,
        decoration: InputDecoration(
          counterText: isHideCounterText == true? "" : null,
          labelText: labelText,
          labelStyle: labelStyle ??
              Get.textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w300,
                // fontStyle: FontStyle.italic,
                decoration: TextDecoration.none,
              ),
          hintStyle: hintStyle ?? TextStyleType.hintTextStyle,
          hintText: hintText,
          errorText: errorText,
          errorStyle: errorStyle,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          contentPadding: AppSize.inputFieldContentPadding,
          // contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? context.colors.outline,
              width: 0.5.w,
            ),
            borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? context.colors.primary,
              width: 0.5.w,
            ),
            borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
          ),
        ),
      ),
    );
  }
}
