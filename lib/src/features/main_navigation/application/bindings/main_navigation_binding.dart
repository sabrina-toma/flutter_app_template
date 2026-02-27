import 'package:get/get.dart';

import '../../../../core/network/network_repository.dart';
import '../../../../core/network/network_repository_imp.dart';
import '../controllers/main_navigation_controller.dart';

class MainNavigationBinding implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut<NetworkRepository>(() => NetworkRepositoryImpl(), fenix: true);

    Get.lazyPut(() => MainNavigationController());

  }
}
