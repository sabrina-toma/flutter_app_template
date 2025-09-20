import 'package:flutter/material.dart';
import '../../constants/app_color.dart';

class TTextTheme {
  TTextTheme._();

  static double _scaleFactor(BuildContext context) {
    return MediaQuery.of(context).textScaleFactor;
  }

  static TextTheme lightTextTheme(BuildContext context) {
    double scaleFactor = _scaleFactor(context);

    return TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'Lexend',
        color: AppColor.textColor,
        fontSize: 20 * scaleFactor,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Lexend',
        color: AppColor.textColor,
        fontSize: 18 * scaleFactor,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Lexend',
        color: AppColor.textColor,
        fontSize: 16 * scaleFactor,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Lexend',
        fontSize: 14 * scaleFactor,
        color: AppColor.textColor,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Lexend',
        fontSize: 12 * scaleFactor,
        color: AppColor.textColor,
        fontWeight: FontWeight.w300,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Lexend',
        fontSize: 10 * scaleFactor,
        color: AppColor.textColor,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Lexend',
        fontSize: 14 * scaleFactor,
        color: AppColor.textColor,
        fontWeight: FontWeight.normal,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Lexend',
        fontSize: 12 * scaleFactor,
        color: AppColor.textColor,
        fontWeight: FontWeight.normal,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Lexend',
        fontSize: 10 * scaleFactor,
        color: AppColor.textColor,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextTheme darkTextTheme(BuildContext context) {
    double scaleFactor = _scaleFactor(context);

    return TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'Lexend',
        color: AppColor.textColorDark,
        fontSize: 20 * scaleFactor,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Lexend',
        color: AppColor.textColorDark,
        fontSize: 18 * scaleFactor,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Lexend',
        color: AppColor.textColorDark,
        fontSize: 16 * scaleFactor,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Lexend',
        fontSize: 14 * scaleFactor,
        color: AppColor.textColorDark,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Lexend',
        fontSize: 13 * scaleFactor,
        color: AppColor.textColorDark,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Lexend',
        fontSize: 11 * scaleFactor,
        color: AppColor.textColorDark,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Lexend',
        fontSize: 14 * scaleFactor,
        color: AppColor.textColorDark,
        fontWeight: FontWeight.normal,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Lexend',
        fontSize: 12 * scaleFactor,
        color: AppColor.textColorDark,
        fontWeight: FontWeight.normal,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Lexend',
        fontSize: 10 * scaleFactor,
        color: AppColor.textColorDark,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}


// import 'color_manager.dart'; // Replace with your actual import

// class TTextTheme {
//   TTextTheme._();
//
//   static double _scaleFactor(BuildContext context) {
//     return MediaQuery.of(context).textScaleFactor;
//   }
//
//   /// Customizable Light Text Theme
//   static TextTheme lightTextTheme(BuildContext context) {
//     double scaleFactor = _scaleFactor(context);
//
//     return TextTheme(
//       titleLarge: GoogleFonts.inter(
//         color: AppColor.textColor,
//         fontSize: 20 * scaleFactor,
//         fontWeight: FontWeight.bold,
//       ),
//       titleMedium: GoogleFonts.inter(
//         color: AppColor.textColor,
//         fontSize: 18 * scaleFactor,
//         fontWeight: FontWeight.w500,
//       ),
//       titleSmall: GoogleFonts.inter(
//         color: AppColor.textColor,
//         fontSize: 16 * scaleFactor,
//         fontWeight: FontWeight.w500,
//       ),
//       bodyLarge: GoogleFonts.inter(
//         fontSize: 14 * scaleFactor,
//         color: AppColor.textColor,
//         fontWeight: FontWeight.normal,
//       ),
//       bodyMedium: GoogleFonts.inter(
//         fontSize: 12 * scaleFactor,
//         color: AppColor.textColor,
//         fontWeight: FontWeight.normal,
//       ),
//       bodySmall: GoogleFonts.inter(
//         fontSize: 10 * scaleFactor,
//         color: AppColor.textColor,
//         fontWeight: FontWeight.normal,
//       ),
//       labelLarge: GoogleFonts.inter(
//         fontSize: 14 * scaleFactor,
//         color: AppColor.textColor,
//         fontWeight: FontWeight.normal,
//       ),
//       labelMedium: GoogleFonts.inter(
//         fontSize: 12 * scaleFactor,
//         color: AppColor.textColor,
//         fontWeight: FontWeight.normal,
//       ),
//       labelSmall: GoogleFonts.inter(
//         fontSize: 10 * scaleFactor,
//         color: AppColor.textColor,
//         fontWeight: FontWeight.normal,
//       ),
//     );
//   }
//
//   /// Customizable Dark Text Theme
//   static TextTheme darkTextTheme(BuildContext context) {
//     double scaleFactor = _scaleFactor(context);
//
//     return TextTheme(
//       titleLarge: GoogleFonts.inter(
//         color: AppColor.textColorDark,
//         fontSize: 20 * scaleFactor,
//         fontWeight: FontWeight.bold,
//       ),
//       titleMedium: GoogleFonts.inter(
//         color: AppColor.textColorDark,
//         fontSize: 18 * scaleFactor,
//         fontWeight: FontWeight.w500,
//       ),
//       titleSmall: GoogleFonts.inter(
//         color: AppColor.textColorDark,
//         fontSize: 16 * scaleFactor,
//         fontWeight: FontWeight.w500,
//       ),
//       bodyLarge: GoogleFonts.inter(
//         fontSize: 14 * scaleFactor,
//         color: AppColor.textColorDark,
//         fontWeight: FontWeight.normal,
//       ),
//       bodyMedium: GoogleFonts.inter(
//         fontSize: 13 * scaleFactor,
//         color: AppColor.textColorDark,
//         fontWeight: FontWeight.normal,
//       ),
//       bodySmall: GoogleFonts.inter(
//         fontSize: 11 * scaleFactor,
//         color: AppColor.textColorDark,
//         fontWeight: FontWeight.normal,
//       ),
//       labelLarge: GoogleFonts.inter(
//         fontSize: 14 * scaleFactor,
//         color: AppColor.textColorDark,
//         fontWeight: FontWeight.normal,
//       ),
//       labelMedium: GoogleFonts.inter(
//         fontSize: 12 * scaleFactor,
//         color: AppColor.textColorDark,
//         fontWeight: FontWeight.normal,
//       ),
//       labelSmall: GoogleFonts.inter(
//         fontSize: 10 * scaleFactor,
//         color: AppColor.textColorDark,
//         fontWeight: FontWeight.normal,
//       ),
//     );
//   }
// }