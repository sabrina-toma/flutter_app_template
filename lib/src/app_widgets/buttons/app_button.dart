import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/themes/theme_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
        this.height,
        this.buttonColor,
        this.child,
        this.onTap,
        this.solid = true,
        this.padding,
        this.borderColor,
        this.borderWidth,
        this.width,
        this.elevation,
        this.radius,
        this.disableColor,
        this.margin});

  final Widget? child;

  final void Function()? onTap;
  final bool solid;
  final EdgeInsets? padding;
  final Color? borderColor;
  final Color? disableColor;
  final double? borderWidth;
  final double? width;
  final double? height;
  final double? radius;
  final Color? buttonColor;
  final double? elevation;

  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.width,
      height: height ?? 45.h,
      margin: margin ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          disabledBackgroundColor: disableColor,
          backgroundColor: solid ? buttonColor ?? context.colors.primary : context.backgroundColor,
          foregroundColor: context.transparent,
          surfaceTintColor: context.transparent,
          elevation: elevation ?? 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 8.r),
            side: BorderSide(
              color: !solid
                  ? borderColor != null
                  ? borderColor!
                  : context.colors.outline
                  : borderColor ?? Colors.transparent,
            ),
          ),
        ),
        child: Padding(
          padding: padding ??  EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}
