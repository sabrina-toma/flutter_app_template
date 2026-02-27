
import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/themes/theme_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../text/app_text_widgets.dart';

class AppToolTipWidget extends StatelessWidget{
  final String toolTipText;


  AppToolTipWidget({super.key, required this.toolTipText});

  final tollTipController = SuperTooltipController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await tollTipController.showTooltip();
      },
      child: SuperTooltip(
        popupDirection: tooltipDirection(),
        constraints: BoxConstraints(maxWidth: Get.width * 0.5),
        showBarrier: true,
        showCloseButton: true,
        controller: tollTipController,
        backgroundColor: context.colors.surfaceContainerHigh,
        content: AppText(text: toolTipText, textStyle: TextStyleType.bodyMedium, fontWeight: FontWeight.w400, overflow: TextOverflow.visible,),
        child: Icon(
          Icons.info_outline,
          size: 18.r,
        ),
      ),
    );
  }

  final GlobalKey tooltipKey = GlobalKey();


  TooltipDirection tooltipDirection() {
    final RenderBox? box = tooltipKey.currentContext?.findRenderObject() as RenderBox?;
    TooltipDirection direction = TooltipDirection.up;
    if (box != null) {
      final offset = box.localToGlobal(Offset.zero);
      final screenHeight = ScreenUtil().screenHeight;

      // Check available space above and below the widget
      final spaceBelow = screenHeight - offset.dy - box.size.height;

      // Determine the direction based on available space
      direction = spaceBelow > 450.h ? TooltipDirection.down : TooltipDirection.up;
      return direction;

      // final tooltip = SuperTooltip(
      //   popupDirection: direction,
      //   content: Material(
      //     child: Text('This is a tooltip'),
      //   ),
      //   showCloseButton: ShowCloseButton.outside,
      // );
      //
      // tooltip.show(context);
    }
    return direction;
  }
}