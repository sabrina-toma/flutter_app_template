
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/themes/theme_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../core/constants/app_constrains.dart';
import '../core/constants/app_size.dart';
import '../core/utils/common_methods.dart';
import 'buttons/app_button.dart';
import 'text/app_text_widgets.dart';

showPhotoAddOptionModal({required String title, required Function(File imageFile) onSave}){
  return showModalBottomSheet(
    context: Get.context!,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppText(text: title, textStyle: TextStyleType.titleLarge,),
            AppConstrains.spaceBetweenSections,

            /// options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// camera
                InkWell(
                  onTap: () async {
                    Get.back();
                    File? pickedImage = await pickSingleImage(ImageSource.camera);
                    if(pickedImage != null){
                      showPicConfirmDialog(
                        title: 'Profile pic Upload',
                        imageFile: pickedImage,
                        onSave: () {
                          onSave(pickedImage);
                        },
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.mediumBorderRadius),
                      color: context.colors.primaryContainer,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                    child: Column(
                      children: [
                        Icon(Icons.camera_alt_outlined, size: 30.r, color: context.colors.onPrimaryContainer,),
                        AppText(text: 'Take a Picture', textStyle:TextStyleType.bodyMedium, color: context.colors.onPrimaryContainer,),
                      ],
                    ),
                  ),
                ),

                /// gallery
                InkWell(
                  onTap: (){
                    pickSingleImage(ImageSource.gallery);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.mediumBorderRadius),
                      color: context.colors.primaryContainer,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                    child: Column(
                      children: [
                        Icon(Icons.image_outlined, size: 30.r,color: context.colors.onPrimaryContainer,),
                        AppText(text: 'Select From Gallery', textStyle:TextStyleType.bodyMedium,color: context.colors.onPrimaryContainer,),
                      ],
                    ),
                  ),
                )
              ],
            ),
            AppConstrains.spaceBetweenSections,
          ],
        ),
      );
    },
  );
}

showPicConfirmDialog({
  required String title,
  required File imageFile,
  required VoidCallback onSave,
}){
  showDialog(context: Get.context!, builder: (context) =>
      AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppSize.largeBorderRadius))),
    title: AppText(text: title, textStyle: TextStyleType.titleLarge),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// selected image
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.mediumBorderRadius),
              child: Container(
                width: 400.w,
                height: 400.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(imageFile),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: context.colors.outlineVariant,
              ),
              padding: EdgeInsets.all(10),
              child: Icon(Icons.edit, size: 20.r,),
            ),),
          ],
        ),
        AppConstrains.spaceBetweenSections,

        /// buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// close button
            AppButton(
              onTap: (){
                Get.back();
              },
              solid: false,
              width: Get.width * 0.25,
              borderColor: context.colors.error,
              child: AppText(text: 'Close', textStyle: TextStyleType.titleSmall),
            ),

            /// save button
            AppButton(
              onTap: (){
                Get.back();
                onSave();
              },
              solid: true,
              width: Get.width * 0.25,
              child: AppText(text: 'Save', textStyle: TextStyleType.titleSmall),
            ),
          ],
        ),
      ],
    ),
  ),
  );


}


class CircleOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.transparent//.withOpacity(0.6) // Dark outside
      ..style = PaintingStyle.fill;

    // Draw full dark rectangle
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Clear the center circle
    paint.blendMode = BlendMode.clear;

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = 100; // Circle radius

    canvas.drawCircle(Offset(centerX, centerY), radius, paint);

    // Optional: Draw a white border around the circle
    paint
      ..blendMode = BlendMode.srcOver
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawCircle(Offset(centerX, centerY), radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}