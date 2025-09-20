
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_color.dart';
import '../../core/constants/app_constrains.dart';
import '../../core/constants/app_size.dart';
import '../buttons/app_button.dart';
import '../text/app_text_widgets.dart';

class ConfirmationDialog extends StatelessWidget {
  final String? dialogTitle;
  final String? dialogText;
  final String? buttonText;
  final String? buttonData;
  final Function(String)? onTapButton;

  const ConfirmationDialog({
    super.key,
    this.dialogTitle,
    this.dialogText,
    this.buttonText,
    this.onTapButton,
    this.buttonData,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadiusGeometry.circular(AppSize.largeBorderRadius)),
      icon: Icon(
        Icons.info,
        size: 30,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// dialog title
          if(dialogTitle != null) AppText(text: dialogTitle ?? '', textStyle: TextStyleType.titleLarge),

          /// dialog text
          if(dialogText != null) AppText(text: dialogText ?? '', textStyle: TextStyleType.bodyMedium),
        ],
      ),

      actions: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// cancel button
            AppButton(
              onTap: (){
                Get.back();
              },
              solid: false,
              child: AppText(text: 'Cancel', textStyle: TextStyleType.titleSmall,),
            ),
            AppConstrains.spaceBetweenItems,

            /// other button
            AppButton(
              onTap: (){
                if(onTapButton!= null ) onTapButton!(buttonData ?? '');
              },
              solid: true,
              child: AppText(text: buttonText ?? 'Confirm', textStyle: TextStyleType.titleSmall, color: AppColor.white,),
            ),
          ],
        )
      ],
    );
  }
}

