import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/themes/theme_extension.dart';
import 'package:get/get.dart';


class AppBarLeading extends StatelessWidget {
  const AppBarLeading({super.key, required this.onTap, this.color});

  final Function onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onTap();
      },
      icon: Icon(
        GetPlatform.isAndroid ? Icons.arrow_back : Icons.arrow_back,
        color: color ?? context.textColor,
        size: 28,
      ),
    );
  }
}