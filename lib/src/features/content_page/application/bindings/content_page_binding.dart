import 'package:get/get.dart';

import '../controllers/content_page_controller.dart';

class ContentPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ContentPageController(), fenix: true);
  }
}