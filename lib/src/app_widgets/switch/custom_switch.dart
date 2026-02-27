
import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/themes/theme_extension.dart';

import '../../core/constants/app_size.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.scaleFactor,
    this.splashColor,
    this.highlightColor,
    this.activeTrackColor,
    this.activeColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final double? scaleFactor;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? activeTrackColor;
  final Color? activeColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: splashColor ?? Colors.transparent,
        highlightColor: highlightColor ?? Colors.transparent,
      ),
      child: Transform.scale(
        scale: scaleFactor ?? AppSize.scalingFactorMd,// Sizing factor
        child: Switch(
          value: value,
          onChanged:(value) =>  onChanged(value),
          activeColor: activeColor ?? Colors.white,
          activeTrackColor: activeTrackColor ?? context.colors.primary,
          inactiveThumbColor: inactiveThumbColor ?? Colors.white,
          inactiveTrackColor: inactiveTrackColor ?? Colors.grey,
        ),
      ),
    );
  }
}