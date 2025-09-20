
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/app_color.dart';
import '../../core/constants/app_size.dart';

class SelectOptionButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function(bool) onTap;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final Color? selectedTextColor;
  final Color? unSelectedTextColor;

  const SelectOptionButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.selectedColor,
    this.unSelectedColor,
    this.selectedTextColor,
    this.unSelectedTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(!isSelected),
      child: Container(
        padding: EdgeInsets.symmetric(vertical:2.h, horizontal: 5.w),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
          color: isSelected ? selectedColor ?? AppColor.white : unSelectedColor ?? Colors.transparent,
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            textStyle: Get.textTheme.bodyMedium!.copyWith(
              overflow: TextOverflow.visible,
              fontWeight: FontWeight.w500,
              color: isSelected ? selectedTextColor ?? AppColor.primary : unSelectedTextColor ?? AppColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
