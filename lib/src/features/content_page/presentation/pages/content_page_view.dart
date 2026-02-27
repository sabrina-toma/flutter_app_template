import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/app_widgets/text/app_text_widgets.dart';
import 'package:flutter_app_template/src/core/themes/theme_extension.dart';
import 'package:get/get.dart';

import '../../application/controllers/content_page_controller.dart';

class ContentPage extends GetView<ContentPageController> {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          child: Center(
            child: AppText(
              text: controller.pageName,
              textStyle: TextStyleType.titleLarge,
              color: context.colors.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
