
import 'package:flutter/material.dart';

import '../../core/constants/app_constrains.dart';
import 'app_text_widgets.dart';

class InputFieldTitleText extends StatelessWidget {
  final String text;

  const InputFieldTitleText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          text: text,
          textStyle: TextStyleType.bodyLarge,
          fontWeight: FontWeight.w400,
        ),
        AppConstrains.height5,
      ],
    );
  }
}