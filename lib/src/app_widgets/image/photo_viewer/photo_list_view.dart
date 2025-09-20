import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app_bar/app_bar_leading.dart';
import 'photo_view.dart';

class PhotoListView extends StatelessWidget {
  final List<String> photoUrlList;
  final String? pageTitle;

  const PhotoListView({super.key, required this.photoUrlList, this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: AppBarLeading(
            onTap: () {
              Get.back();
            },
          ),
          title: Text(
            pageTitle ?? '',
            style: GoogleFonts.inter(
              textStyle: Get.textTheme.bodyMedium!.copyWith(
                overflow: TextOverflow.visible,
                // color: Get.isDarkMode ? ColorManager.white60Dark : ColorManager.black38,
              ),
            ),
          ),
        ),
        body: Scrollbar(
          thumbVisibility: true,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: photoUrlList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0.h),
                  child: InkWell(
                    onTap: () {
                      Get.to(()=>PhotoViewSlider(
                        photoUrlList: photoUrlList,
                        initialIndex: index,
                      ));
                    },
                    child: Image.network(photoUrlList[index]),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
