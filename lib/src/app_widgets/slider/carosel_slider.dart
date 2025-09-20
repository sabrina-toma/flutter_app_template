import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCaroselSlider extends StatelessWidget {
  final List<String> imageUrls;
  final double height;

  const ImageCaroselSlider({super.key, required this.imageUrls, required this.height});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height,  // Set the height of the slider
        autoPlay: true,  // Enable auto play
        autoPlayInterval: const Duration(seconds: 5),  // Set auto play interval
        enlargeCenterPage: true,
        viewportFraction: 1.0,  // Show one image at a time
        disableCenter: true,
        clipBehavior: Clip.none,
        autoPlayCurve: Curves.ease,
        animateToClosest: true,
        onPageChanged: (index, reason) {
          // You can handle page change here if needed
        },
      ),
      items: imageUrls.map((url) {
        return Builder(
          builder: (BuildContext context) {
              return Image.asset(
                  url,
                fit: BoxFit.cover,
              );
          },
        );
      }).toList(),
    );
  }
}
