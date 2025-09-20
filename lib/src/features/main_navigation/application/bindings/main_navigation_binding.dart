import 'package:get/get.dart';

import '../../../../core/network/network_repository.dart';
import '../../../../core/network/network_repository_imp.dart';
import '../../../content_page/application/controllers/content_page_controller.dart';
import '../../../home_page/application/controllers/home_page_controller.dart';
import '../controllers/main_navigation_controller.dart';

class MainNavigationBinding implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut<NetworkRepository>(() => NetworkRepositoryImpl(), fenix: true);

    Get.lazyPut(() => MainNavigationController());

    Get.lazyPut(() => HomePageController(), fenix: true);
    Get.lazyPut(() => ContentPageController(), fenix: true);
  }
}
