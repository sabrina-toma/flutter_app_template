import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/themes/theme_extension.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

DateTime utcFormatDateTime(DateTime date){
  DateTime dateUtc = DateTime.utc(
    date.year,
    date.month,
    date.day,
    date.hour,
    date.minute,
    date.second,
  );
  return dateUtc;
}

String formatNumber(double value) {
  if (value == value.roundToDouble()) {
    // No decimal part
    return NumberFormat("#,##0", "en_US").format(value);
  } else {
    // With decimal part
    return NumberFormat("#,##0.00", "en_US").format(value);
  }
}

String formatString(String input) {
  if(input != ''){
    return input
        .replaceAllMapped(RegExp(r'([a-z])([A-Z])'), (match) {
          return '${match.group(1)} ${match.group(2)}';
        })
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
  return '';
}

String formatDuration(Duration duration) {
  final days = duration.inDays;
  final hours = duration.inHours % 24;
  final minutes = duration.inMinutes % 60;
  final seconds = duration.inSeconds % 60;

  return '$days days, $hours hours, $minutes mins, $seconds secs';
}

Future<File?> pickSingleImage(ImageSource source) async {
  final ImagePicker picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(source: source, imageQuality: 25);


    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
}

Future<PlatformFile?> pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    PlatformFile file = result.files.first;

    log('File name: ${file.name}');
    log('File path: ${file.path}');
    log('File size: ${file.size}');
    // You can use file.path to upload or display
    return file;
  } else {
    // User canceled the picker
    log('No file selected');
    return null;
  }
}

showAppBottomSheet(Widget widget) {
  showModalBottomSheet(
    context: Get.context!,
    useSafeArea: true,
    isScrollControlled: true,
    isDismissible: false,
    barrierColor: Get.context!.colors.outline,
    builder: (context) {
      return SingleChildScrollView(
        child: widget,
      );
    },
  );
}