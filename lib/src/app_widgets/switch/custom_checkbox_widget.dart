
import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';
import '../../core/constants/app_size.dart';

class CustomCheckBox extends StatelessWidget {
  bool isChecked;
  final Function(bool) onChanged;
  CustomCheckBox({super.key, required this.isChecked, required this.onChanged});

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
      activeColor: AppColor.primary,
    );
  }

}