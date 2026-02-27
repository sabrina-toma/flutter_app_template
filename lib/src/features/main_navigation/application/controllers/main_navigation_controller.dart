import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/themes/theme_extension.dart';
import 'package:flutter_app_template/src/features/content_page/application/bindings/content_page_binding.dart';
import 'package:flutter_app_template/src/features/home_page/presentation/pages/home_page_view.dart';
import 'package:flutter_app_template/src/features/more_page/application/bindings/more_page_binding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/constants/app_size.dart';
import '../../../content_page/presentation/pages/content_page_view.dart';
import '../../../home_page/application/bindings/home_page_binding.dart';
import '../../../more_page/presentation/pages/more_page_view.dart';
import '../../presentation/widgets/binding_tab.dart';

class MainNavigationController extends GetxController{

  late PersistentTabController persistentTabController;
  List<Widget> buildScreens() => [
    BindingTab(
      binding: HomePageBinding(),
      child: const HomePage(),
    ),
    BindingTab(
      binding: ContentPageBinding(),
      child: const ContentPage(),
    ),
    BindingTab(
      binding: MorePageBinding(),
      child: const MorePage(),
    ),
  ];
  NavBarStyle navBarStyle = NavBarStyle.style3;

  final List<ScrollController> scrollControllers =
  List.generate(4, (_) => ScrollController());
  BuildContext? testContext;

  List<PersistentBottomNavBarItem> navBarsItems() => [
    PersistentBottomNavBarItem(
      icon: FaIcon(FontAwesomeIcons.house, size: 18.r), //Image.asset(AppImageAssets.homeIcon),
      title: "Home",
      activeColorPrimary: Get.context!.colors.primary,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: FaIcon(FontAwesomeIcons.mortarPestle, size: 18.r),//Image.asset(AppImageAssets.calenderIcon,),
      iconSize: AppSize.navBarIconSize,
      title: "Content",
      opacity: 0.7,
      activeColorPrimary: Get.context!.colors.primary,
      activeColorSecondary: navBarStyle == NavBarStyle.style7 ||
          navBarStyle == NavBarStyle.style10
          ? Colors.white
          : null,
      inactiveColorPrimary: Get.context!.disabledColor,
      scrollController: scrollControllers.first,
    ),
    PersistentBottomNavBarItem(
      icon: FaIcon(FontAwesomeIcons.bars, size: 18.r),
      title: "More",
      activeColorPrimary: Get.context!.colors.primary,
      inactiveColorPrimary: Colors.grey,
      activeColorSecondary: navBarStyle == NavBarStyle.style7 ||
          navBarStyle == NavBarStyle.style10
          ? Colors.white
          : null,
      scrollController: scrollControllers.last,
    ),
  ];

  @override
  void onInit() {
    persistentTabController = PersistentTabController(initialIndex: 0);
    super.onInit();
  }
}