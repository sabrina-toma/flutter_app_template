import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/assetes/image_assets_manager.dart';
import '../../core/constants/app_size.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final Widget? errorIcon;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? boxFit;
  final String placeholderImage = AppImageAssets.placeholderImg;
  final Function? onSelectEdit;
  final bool? isShowEditOption;

  const AppNetworkImage({
    super.key,
    this.color,
    required this.url,
    this.errorIcon,
    this.height,
    this.width,
    this.boxFit,
    this.onSelectEdit,
    this.isShowEditOption = false,
  }) : assert(
  isShowEditOption == false || onSelectEdit != null,
  'onSelectEdit must be provided if isShowEditOption is true',
  );

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return errorIcon ??
          Image.asset(
            placeholderImage,
            height: height,
            width: width,
            fit: boxFit ?? BoxFit.contain,
            color: color,
          );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImage(
              imageUrl: url,
              placeholder: (context, url) => Center(
                child: SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Image.asset(
                placeholderImage,
                height: height,
                width: width,
                fit: boxFit ?? BoxFit.contain,
                color: color,
              ),
              height: height,
              width: width,
              fit: boxFit ?? BoxFit.contain,
              color: color,
            ),
        if(isShowEditOption == true) Positioned(
          bottom: 1,
          right: 1,
          child: InkWell(
            onTap: (){
              onSelectEdit?.call();
              },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(AppSize.mediumBorderRadius),
              ),
              height: 40,
              width: 40,
              child: Center(child: FaIcon(Icons.edit, size: 25,)),
            ),
          ),
        ),
      ],
    );


  }
}
