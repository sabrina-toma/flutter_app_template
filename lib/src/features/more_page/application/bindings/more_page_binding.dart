import 'package:get/get.dart';
import '../controllers/more_page_controller.dart';

class MorePageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MorePageController(), fenix: true);
  }
}