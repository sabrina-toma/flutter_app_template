
import 'package:flutter/material.dart';

import 'app_text_widgets.dart';

class DescriptiveText extends StatelessWidget {
  final String text;
  final FontStyle? fontStyle;
  final Color? color;

  const DescriptiveText({
    super.key,
    required this.text,
    this.fontStyle,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          text: text,
          textStyle: TextStyleType.bodyMedium,
          fontWeight: FontWeight.w300,
          fontStyle: fontStyle ?? FontStyle.normal,
          overflow: TextOverflow.visible,
          color: color,
        ),
      ],
    );
  }
}