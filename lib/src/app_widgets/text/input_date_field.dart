
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_template/src/app_widgets/text/app_text_widgets.dart';
import 'package:flutter_app_template/src/core/themes/theme_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/constants/app_size.dart';


class InputDateField extends StatelessWidget {
  const InputDateField({
    super.key,
    this.controller,
    this.cursorColor,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.borderColor,
    this.focusedBorderColor,
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
    this.focusNode,
  });

  final TextEditingController? controller;
  final Color? cursorColor, borderColor, focusedBorderColor, inputTextColor;
  final void Function(String)? onChanged, onFieldSubmitted;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function()? onTap, onEditingComplete;
  final String? hintText, obscuringCharacter, initialValue, labelText, errorText;
  final bool? obscureText, readOnly, enabled;
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
        keyboardType: TextInputType.number,
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
        inputFormatters: [
          DateInputFormatter(), // Formats input to dd/MM/yyyy
        ],
        style: style ??
            Get.textTheme.bodyMedium!.copyWith(
              color: (enabled ?? true) ? inputTextColor ?? context.textColor : context.disabledColor,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
            ),
        textAlignVertical: TextAlignVertical.center,
        cursorOpacityAnimates: true,
        onTap: onTap,
        onTapOutside: onTapOutside,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: onEditingComplete,
        obscureText: obscureText ?? false,
        obscuringCharacter: obscuringCharacter ?? '.',
        // keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: labelStyle ??
              Get.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
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
          floatingLabelBehavior: FloatingLabelBehavior.always,
          // contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.disabledColor,
              width: 1.5.w,
            ),
            borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? context.colors.outline,
              width: 1.5.w,
            ),
            borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: focusedBorderColor ?? context.colors.primary,
              width: 2.w,
            ),
            borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
          ),
        ),
      ),
    );
  }
}


class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Allow only digits
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (text.length > 8) return oldValue;

    // Format as MM/DD/YYYY
    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i == 2 || i == 4) buffer.write('/');
      buffer.write(text[i]);
    }
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}