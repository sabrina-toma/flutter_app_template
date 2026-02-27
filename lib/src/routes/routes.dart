
import 'package:flutter_app_template/src/features/settings/applications/bindings/settings_binding.dart';
import 'package:get/get.dart';

import '../features/main_navigation/application/bindings/main_navigation_binding.dart';
import '../features/main_navigation/presentation/pages/main_navigation_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';
import '../features/splash_screen/application/bindings/splash_screen_binding.dart';
import '../features/splash_screen/presentation/pages/splash_screen_page.dart';
import 'route_paths.dart';

class Routes {
  static final List<GetPage> routes = [
    /// splash screen Route
    GetPage(
      name: RoutesPath.splashScreen,
      page: () => const SplashScreenPage(),
      binding: SplashScreenBinding(),
    ),


    /// main navigation Page Route
    GetPage(
      name: RoutesPath.mainNavigationPage,
      page: () => const MainNavigationPage(),
      binding: MainNavigationBinding(),
    ),

    /// setting page route
    GetPage(
      name: RoutesPath.settingsPage,
      page: () => const SettingsPage(),
      binding: SettingsBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}