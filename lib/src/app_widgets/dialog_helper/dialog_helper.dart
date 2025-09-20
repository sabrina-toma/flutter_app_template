
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/constants/app_color.dart';
import '../../core/constants/app_size.dart';
import '../buttons/app_button.dart';
import '../text/app_text_widgets.dart';

class DialogHelper {
  static Future<bool> showAlertDialogBox({
    required BuildContext context,
    String? title,
    required String message,
    Color? cancelBtnColor,
    Color? confirmBtnColor,
    String cancelBtnText = 'Cancel',
    String confirmBtnText = 'Confirm',
  }) async {
    return await Get.dialog<bool>(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.smallBorderRadius)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: AlertDialog(
          actionsPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.smallBorderRadius)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: AppSize.spaceBtwSection.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Text(
                  message,
                  textAlign: TextAlign.start,
                  style: Get.textTheme.bodyLarge,
                ),
              ),
              SizedBox(height: AppSize.spaceBtwItem.h),
              SizedBox(height: AppSize.spaceBtwSection.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => Get.back(result: false),
                      child: Container(
                        height: 40.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: AppColor.greyLight, width: 0.5.w)),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(AppSize.smallBorderRadius),
                            bottomLeft: Radius.circular(AppSize.smallBorderRadius),
                          ),
                        ),
                        child: Text(cancelBtnText, style: Get.textTheme.labelLarge!.copyWith(color: cancelBtnColor ?? Colors.red)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => Get.back(result: true),

                      child: Container(
                        height: 40.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: AppColor.greyLight, width: 0.5.w),
                            left: BorderSide(color: AppColor.greyLight, width: 0.5.w),
                          ),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(AppSize.smallBorderRadius),
                            bottomLeft: Radius.circular(AppSize.smallBorderRadius),
                          ),
                        ),
                        child: Text(confirmBtnText, style: Get.textTheme.labelLarge!.copyWith(color: confirmBtnColor ?? Colors.lightGreen)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ) ??
        false;
  }

  static hideDialog() {
    if (Get.isDialogOpen ?? false) {
      return Get.back();
    }
  }

  static void showLoadingDialog({Widget? dynamicText}) {
    Get.dialog(
      barrierDismissible: false,
      barrierColor: Colors.grey.withOpacity(0.7),
      Dialog(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0.r),
        ),
        child: Card(
          color: AppColor.primary,
          elevation: 5,
          margin: EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsets.only(bottom: 25.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20.h),
                Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: AppColor.white,
                    size: 30.r,
                  ),
                ),
                dynamicText ??
                    Text('Please wait...',
                        style: Get.textTheme.bodyMedium!.copyWith(
                          color: AppColor.white,
                        )),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget progressLoader() {
    return Container(
      alignment: AlignmentDirectional.center,
      decoration: const BoxDecoration(
        color: Colors.white70,
      ),
      child: Container(
        decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(10.0.r)),
        width: 300.0.w,
        height: 100.0.h,
        alignment: AlignmentDirectional.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: SizedBox(
                height: 30.0.h,
                width: 30.0.w,
                child: CircularProgressIndicator(
                  value: null,
                  strokeWidth: 2.0.w,
                  color: Colors.white,
                ),
              ),
            ),
            const Center(
              child: Text(
                "loading.. wait...",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show retry dialog
  static Future<bool> showRetryDialog() async {
    return await Get.dialog<bool>(Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.smallBorderRadius)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: AlertDialog(
        actionsPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.smallBorderRadius)),
        // title: Text('Error', style: Get.textTheme.titleSmall),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: AppSize.spaceBtwSection.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSpace.w),
              child: Text(
                "Something went wrong, Please try again!",
                textAlign: TextAlign.start,
                style: Get.textTheme.bodyLarge,
              ),
            ),
            SizedBox(height: AppSize.spaceBtwSection.h),
            SizedBox(height: AppSize.spaceBtwItem.h),
            InkWell(
              onTap: () => Get.back(result: true),
              child: Container(
                width: double.infinity,
                height: 40.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: AppColor.greyLight, width: 0.5.w)),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(AppSize.smallBorderRadius),
                    bottomLeft: Radius.circular(AppSize.smallBorderRadius),
                  ),
                ),
                child: Text("Retry", style: Get.textTheme.labelLarge!.copyWith(color: Colors.redAccent)),
              ),
            ),
            // Text(
            //
            //   textAlign: TextAlign.start,
            //   style: Get.textTheme.bodyMedium,
            // ),
          ],
        ),
        // actions: <Widget>[
        // TextButton(
        //   onPressed: () => Get.back(result: false),
        //   child: Text("Cancel", style: Get.textTheme.labelLarge!.copyWith(color: Colors.red)),
        // ),
        // TextButton(
        //   onPressed:() => Get.back(result: true),
        //   child: Text("Retry", style: Get.textTheme.labelLarge!.copyWith(color: Colors.lightGreen)),
        // ),
        // ],
      ),
    )) ??
        false; // Return false if the dialog is dismissed
  }
}

Widget progressLoader() {
  return Container(
    alignment: AlignmentDirectional.center,
    decoration: const BoxDecoration(
      color: Colors.white70,
    ),
    child: Container(
      decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(10.0.r)),
      width: 300.0.w,
      height: 100.0.h,
      alignment: AlignmentDirectional.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SizedBox(
              height: 30.0.h,
              width: 30.0.w,
              child: CircularProgressIndicator(
                value: null,
                strokeWidth: 2.0.w,
                color: Colors.white,
              ),
            ),
          ),
          const Center(
            child: Text(
              "loading.. wait...",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}

Future notLoggedInDialog() {
  return showDialog(
    context: Get.context!,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.largeBorderRadius)),
      backgroundColor: Get.isDarkMode ? AppColor.appBackgroundColorDark : AppColor.appBackgroundColor,
      title: AppText(
        text: 'Not Signed In',
        textStyle: TextStyleType.titleMedium,
        fontWeight: FontWeight.w500,
      ),
      content: AppText(
        text: 'Please sign in to continue',
        textStyle: TextStyleType.bodyMedium,
        // fontWeight: FontWeight.w500,
      ),
      actions: [
        AppButton(
          onTap: () {
            Get.back();

            /// go to login page
            // Get.toNamed(RoutesPath.loginPage);
          },
          solid: true,
          child: AppText(
            text: 'Sign In',
            textStyle: TextStyleType.bodyLarge,
            fontWeight: FontWeight.w500,
            color: AppColor.white,
          ),
        ),
      ],
    ),
  );
}
