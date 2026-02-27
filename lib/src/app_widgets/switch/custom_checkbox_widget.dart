
import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/themes/theme_extension.dart';

import '../../core/constants/app_size.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;
  final Function(bool) onChanged;
  const CustomCheckBox({super.key, required this.isChecked, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.smallBorderRadius)),
      value: isChecked,
      onChanged: (value) {
        onChanged(value ?? false);
        // isChecked = value ?? false;
      },
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      activeColor: context.colors.primary,
    );
  }

}