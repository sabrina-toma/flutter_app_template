import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_template/src/app_widgets/text/app_text_widgets.dart';
import 'package:flutter_app_template/src/core/themes/theme_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../application/controllers/more_page_controller.dart';

class MorePage extends GetView<MorePageController> {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSpace.w, vertical: AppSize.defaultSpace.h),
          child: Obx(
                () => ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.profileMenuList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSpace.w, vertical: AppSize.defaultSpace.h),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(AppSize.mediumBorderRadius.r),
                        border: Border.all(color: AppColor.grey.withOpacity(0.2), width: 0.5.w),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /// Group Title
                          // Text(controller.profileMenuList[index].title, style: Get.textTheme.titleSmall),
                          // SizedBox(height: 8.h),

                          /// Group Items
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.profileMenuList[index].menus.length,
                            itemBuilder: (context, idx) {
                              var item = controller.profileMenuList[index].menus[idx];

                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      log('Clicked');
                                      controller.routeToNextPageView(groupIndex: index, itemIndex: idx, routesPath: item.routPath);
                                    },
                                    child: SizedBox(
                                      height: 36.h,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  color: context.colors.secondaryContainer,
                                                  borderRadius: BorderRadius.circular(100),
                                                ),
                                                child: Icon(
                                                  item.icon,
                                                  color: context.colors.secondary,
                                                  size: 16.r,
                                                ),
                                              ),
                                              SizedBox(width: 10.w),
                                              AppText(
                                                text: item.title,
                                                textStyle: TextStyleType.bodyLarge,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              item.span != null
                                                  ? Container(
                                                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                                                decoration: BoxDecoration(
                                                  color: context.colors.tertiaryContainer,
                                                  borderRadius: BorderRadius.circular(10.r),
                                                ),
                                                child: AppText(
                                                  text: item.span ?? '',
                                                  textStyle: TextStyleType.labelMedium,
                                                  color: context.colors.onTertiaryContainer,
                                                ),
                                              )
                                                  : const SizedBox.shrink(),
                                              item.span != null ? SizedBox(width: 10.w) : const SizedBox.shrink(),
                                              Icon(
                                                Icons.arrow_forward_ios_outlined,
                                                color: context.colors.secondary,
                                                size: 16.r,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  /// Group divider
                                  controller.profileMenuList[index].menus.length - 1 == idx
                                      ? const SizedBox.shrink()
                                      : Container(
                                    height: 0.2.h,
                                    width: double.infinity,
                                    color: AppColor.grey.withOpacity(0.5),
                                    margin: EdgeInsets.symmetric(vertical: 10.h),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    /// Group divider
                    controller.profileMenuList.length - 1 == index
                        ? Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: AppSize.spaceBtwItem),
                      padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSpace.w, vertical: AppSize.defaultSpace.h),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(AppSize.mediumBorderRadius.r),
                        border: Border.all(color: AppColor.grey.withOpacity(0.2), width: 0.5.w),
                      ),
                      child: Column(
                        children: [
                          Obx(() => Text("Version ${controller.packageInfo.value.version}")),

                          SizedBox(height: 60.h),
                        ],
                      ),
                    )
                        : SizedBox(height: 10.h),
                    // Container(
                    //         height: 1.h,
                    //         width: double.infinity,
                    //         color: ColorManager.grey,
                    //         margin: EdgeInsets.symmetric(vertical: 24.h),
                    //       ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
