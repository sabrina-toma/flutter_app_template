import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/constants/app_color.dart';
import '../../application/controllers/main_navigation_controller.dart';


class MainNavigationPage extends GetView<MainNavigationController> {
  const MainNavigationPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: controller.persistentTabController,
        screens: controller.buildScreens(),
        items: controller.navBarsItems(),
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: false,
        stateManagement: false,
        hideNavigationBarWhenKeyboardAppears: true,
        popBehaviorOnSelectedNavBarItemPress: PopBehavior.once,
        hideOnScrollSettings: HideOnScrollSettings(
          hideNavBarOnScroll: true,
          scrollControllers: controller.scrollControllers,
        ),
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        selectedTabScreenContext: (final context) {
          controller.testContext = context;
        },
        backgroundColor: Get.isDarkMode ? AppColor.black : AppColor.white,
        isVisible: true,
        animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            // Screen transition animation on change of selected tab.
            animateTabTransition: false,
            duration: Duration(milliseconds: 300),
            screenTransitionAnimationType:
            ScreenTransitionAnimationType.fadeIn,
          ),
          onNavBarHideAnimation: OnHideAnimationSettings(
            duration: Duration(milliseconds: 100),
            curve: Curves.bounceInOut,
          ),
        ),
        confineToSafeArea: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8))
        ),
        navBarHeight: kBottomNavigationBarHeight,
        navBarStyle:
        controller.navBarStyle, // Choose the nav bar style with this property
      ),
    );
  }
}
