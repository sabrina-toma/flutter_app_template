import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_template/src/app_widgets/text/app_text_widgets.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_color.dart';
import '../../application/controllers/more_page_controller.dart';

class MorePage extends GetView<MorePageController> {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Get.height,
          decoration: BoxDecoration(color: AppColor.appBackgroundColor),
          child: Center(
            child: AppText(
              text: 'More Page',
              textStyle: TextStyleType.titleLarge,
              color: AppColor.tertiary,
            ),
          ),
        ),
      ),
    );
  }
}
