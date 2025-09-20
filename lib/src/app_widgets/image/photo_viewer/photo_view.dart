import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../../core/constants/app_color.dart';

PageController? pageController;

class PhotoViewSlider extends StatefulWidget {
  final List<String> photoUrlList;
  final int initialIndex;
  const PhotoViewSlider({super.key, required this.photoUrlList, required this.initialIndex,});

  @override
  State<PhotoViewSlider> createState() => _PhotoViewSliderState();
}

class _PhotoViewSliderState extends State<PhotoViewSlider> {
  late PageController pageController;
  RxInt currentIndex = 0.obs;

  @override
  void initState() {
    super.initState();
    currentIndex.value = widget.initialIndex;
    pageController = PageController(initialPage: widget.initialIndex);
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [ PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(widget.photoUrlList[index]),
              initialScale: PhotoViewComputedScale.contained * 0.99,
              minScale: PhotoViewComputedScale.contained * 0.99,
              maxScale: PhotoViewComputedScale.contained * 3,
                  heroAttributes: PhotoViewHeroAttributes(tag: widget.photoUrlList[index]),
              semanticLabel: index.toString()
          );
        },
        itemCount: widget.photoUrlList.length,
        loadingBuilder: (context, event) => Center(
          child: SizedBox(
            width: 20.0.w,
            height: 20.0.h,
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded / event.expectedTotalBytes!.toInt(),
            ),
          ),
        ),
        backgroundDecoration: BoxDecoration(
          color: AppColor.primary,
        ),
        pageController: pageController,
        onPageChanged:(index) {
          currentIndex.value = index;
        },
      ),
        /// back button
        Positioned(
          top: 60.h,
          left: 10.w,
          child: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.all(Radius.circular(40.r)),
              ),
              child: Icon(Icons.arrow_back, size: 20.r, color: AppColor.primary),
            ),
          ),
        ),
        /// index
        Visibility(
          visible: widget.photoUrlList.length > 1,
          child: Positioned(
            bottom: 250.0.h,
            right: 0.0.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), bottomLeft: Radius.circular(20.r))),
              child: Obx(()=>Text(
                '${currentIndex.value + 1}/${widget.photoUrlList.length}',
                style: GoogleFonts.inter(
                  textStyle: Get.textTheme.bodyMedium!.copyWith(
                    overflow: TextOverflow.visible,
                    color: AppColor.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


