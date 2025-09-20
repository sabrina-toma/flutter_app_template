import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_color.dart';

class AppBarLeading extends StatelessWidget {
  AppBarLeading({Key? key, required this.onTap, this.color}) : super(key: key);

  final Function onTap;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onTap();
      },
      icon: Icon(
        GetPlatform.isAndroid ? Icons.arrow_back : Icons.arrow_back,
        color: color ?? (Get.isDarkMode ? AppColor.white : AppColor.black),
        size: 28,
      ),
    );
  }
}