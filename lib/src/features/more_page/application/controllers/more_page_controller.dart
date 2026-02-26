import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/routes/route_paths.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../domain/entities/menu_item_entity.dart';

class MorePageController extends GetxController{
  Rx<PackageInfo> packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  ).obs;

  RxList<MenuItem> profileMenuList = <MenuItem>[
    MenuItem(
      "Personal",
      [
        Item(title: "Profile", icon: Icons.person_outline, routPath: '', protected: true),
      ],
    ),
    MenuItem(
      "Help Center",
      [
        Item(title: "About Us", icon: Icons.info_outline, routPath: '', protected: false),
      ],
    ),
    MenuItem(
      "Other",
      [
        Item(title: "App Settings", icon: Icons.settings_outlined, routPath: RoutesPath.settingsPage, protected: false),
        Item(title: "Privacy Policy", icon: Icons.privacy_tip_outlined, routPath: '', protected: false),
        Item(title: "Sign Out", icon: Icons.logout_outlined, routPath: 'sign_out', protected: true),
      ],
    ),
  ].obs;

  @override
  void onReady() {
    initPackageInfo();
    super.onReady();
  }

  Future<void> initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    packageInfo.value = info;

    log("Package Info: ${info.toString()}");
    log("App version: ${packageInfo.value.version ?? "NULL"}");
  }

  routeToNextPageView({required int groupIndex, required int itemIndex, required String routesPath}) {
    if (groupIndex == 0) {
      /// Personal-Group
      routeToPersonalGroupItem(itemIndex, routesPath);
    } else if (groupIndex == 1) {
      /// Help-Center Group
      routeToHelpCenterGroupItem(itemIndex, routesPath);
    } else if (groupIndex == 2) {
      /// Other Group
      routeToOtherGroupItem(itemIndex, routesPath);
    }
  }

  routeToPersonalGroupItem(int index, String routesPath) {
    if (index == 0) {
      /// Profile View page
      Get.toNamed(
        routesPath,
        arguments: () async {
          log("OnRefresh indicator");
          profileMenuList.refresh();
        },
      );
    }
  }

  routeToHelpCenterGroupItem(int index, String routesPath) {
    /// About-us page
    // Get.to(AboutUsPageView(), transition: Transition.rightToLeft);
  }

  routeToOtherGroupItem(int index, String routesPath) async {
    if (index == 0) {
      /// APP Settings
      // Get.to(SettingsPageView(), transition: Transition.rightToLeft);
      Get.toNamed(RoutesPath.settingsPage);
    } else
    if (index == 0) {
      /// privacy policy
    } else if (index == 1) {
      /// Sign-Out logic
    }
  }
}