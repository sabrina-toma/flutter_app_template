
import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/themes/theme_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../text/app_text_widgets.dart';

Widget loadingWidget({String? dynamicText}) {
  return Container(
    alignment: AlignmentDirectional.center,
    decoration: const BoxDecoration(
      color: Colors.white70,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20.h),
        Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: Get.context!.colors.primary,
            size: 30.r,
          ),
        ),
        if(dynamicText != null &&  dynamicText != '')
            AppText(text: 'Please wait...', textStyle: TextStyleType.bodyMedium, color: Get.context!.colors.primary,),
        SizedBox(height: 10.h),
      ],
    ),
  );
}