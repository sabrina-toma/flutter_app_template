import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../../../routes/route_paths.dart';

class SplashScreenController extends GetxController with GetSingleTickerProviderStateMixin{

  Timer? _timer;
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animation = CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeIn,
    );

    animationController!.forward();
    _startDelay();
  }

  @override
  void onClose() {
    _timer?.cancel();
    animationController?.dispose();
    super.onClose();
  }

  _startDelay() {
    _timer = Timer(const Duration(seconds: 4), _goNext);
  }

  _goNext() async {
    Get.offNamedUntil(RoutesPath.mainNavigationPage, (route) => false);

  }
}