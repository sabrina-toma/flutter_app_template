import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/constants/app_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/assetes/image_assets_manager.dart';
import '../../../../core/constants/app_color.dart';
import '../../application/controllers/splash_screen_controller.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondary,
      body: Center(
        child: controller.animation != null
            ? FadeTransition(
          opacity: controller.animation!,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Icon(AppIcons.flutter, size: 50.r,),//Image.asset(AppImageAssets.appLogo,),// const ColorFilter.mode(AppColor.white, BlendMode.srcIn)),//Image.asset(AppImageAssets.carSaleLogo),
          ),
        )
            : Container(),
      ),
    );
  }
}
