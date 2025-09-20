
import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';
import '../../core/utils/common_methods.dart';

Stream<int> countdownStream(DateTime startTime, bool isCountDown) {
  return Stream.periodic(const Duration(seconds: 1), (_) {
    final now = utcFormatDateTime(DateTime.now());
    final difference = isCountDown
        ? startTime.difference(now).inMilliseconds
        : now.difference(startTime).inMilliseconds;
    return difference;
  });
}

class CurrentDurationStatusWidget extends StatelessWidget {
  const CurrentDurationStatusWidget({
    super.key,
    required this.visible,
    this.isFromHomePage = false,
    required this.isCountDown,
    required this.stream,
    required this.tripStartTime,
    required this.formatTime,
  });

  final bool visible;
  final bool? isFromHomePage;
  final bool isCountDown;
  final Stream<int> stream;
  final DateTime tripStartTime;
  final Function(int) formatTime;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: StreamBuilder<int>(
        stream: stream,
        initialData: 0,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                height: 28,
                width: 28,
                child: CircularProgressIndicator(
                  value: null,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColor.secondary),
                ),
              ),
            );
          }

          final value = snapshot.data ?? 0; // Get emitted value from the stream
          return formatTime(value);
          // final displayTime = formatTime(value);

          // return AppText(
          //   text: displayTime,
          //   textStyle: TextStyleType.titleLarge,
          //   fontWeight: FontWeight.w600,
          //   overflow: TextOverflow.visible,
          //   color: AppColor.secondary,
          // );
        },
      ),
    );
  }
}