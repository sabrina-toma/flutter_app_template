import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../utils/common_methods.dart';

class AppDateFormat {
  static Locale? _currentLocale;

  static Future<void> initializeLocale(Locale locale) async {
    _currentLocale = locale;
    await initializeDateFormatting(locale.toString());
  }

  static String formatDate(DateTime date) {
    if (_currentLocale == null) {
      throw Exception('Locale has not been initialized. Call initializeLocale() first.');
    }
    return DateFormat.yMMMd(_currentLocale!.toString()).format(date);
  }

  static String formatDateWithTime(DateTime date) {
    if (_currentLocale == null) {
      throw Exception('Locale has not been initialized. Call initializeLocale() first.');
    }
    return '${DateFormat.yMMMd(_currentLocale!.toString()).format(date)}, ${DateFormat.jm(_currentLocale!.toString().toUpperCase()).format(date)}';
  }

  static String formatDateWithoutYear(DateTime date) {
    if (_currentLocale == null) {
      throw Exception('Locale has not been initialized. Call initializeLocale() first.');
    }
    return DateFormat('d MMM').format(date);
  }

  static String formatDateWithOnlyDate(DateTime date) {
    if (_currentLocale == null) {
      throw Exception('Locale has not been initialized. Call initializeLocale() first.');
    }
    return DateFormat('d').format(date);
  }

  static String formatTime(DateTime time) {
    return DateFormat.jm(_currentLocale!.toString().toUpperCase()).format(time);// DateFormat.yMMMd(_currentLocale!.toString()).format(date);
  }

  static String formatTime24hr(DateTime time) {
    return DateFormat('HH:mm', _currentLocale.toString()).format(time);// DateFormat.yMMMd(_currentLocale!.toString()).format(date);
  }

  static String formatDay(DateTime day) {
    return DateFormat('E', _currentLocale.toString()).format(day);
  }

  static String getMonthYear(DateTime day) {
    return DateFormat('MMMM yyyy', _currentLocale.toString()).format(day); // e.g., "September 2024"
  }

  static DateTime formatTheDate(String date) {
    return utcFormatDateTime(DateFormat('dd/MM/yyyy').parseStrict(date));
  }

}