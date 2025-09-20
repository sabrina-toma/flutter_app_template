import 'package:get/get.dart';

import '../../../../core/network/network_repository.dart';
import '../../../../core/network/network_repository_imp.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController(), fenix: true);
    Get.lazyPut<NetworkRepository>(() => NetworkRepositoryImpl(), fenix: true);
  }
}
