import 'package:flutter/material.dart';

TextTheme appTextTheme(ColorScheme colorScheme) => TextTheme(
  displayLarge: TextStyle(
      color: colorScheme.onPrimaryContainer,
      fontFamily: 'PlayfairDisplay'
  ),
  headlineLarge: TextStyle(
      color: colorScheme.onPrimaryContainer,
      fontFamily: 'PlayfairDisplay'
  ),
  headlineMedium: TextStyle(
      color: colorScheme.onPrimaryContainer,
      fontFamily: 'PlayfairDisplay'
  ),
  headlineSmall: TextStyle(
    color: colorScheme.onPrimaryContainer,
    fontFamily: 'PlayfairDisplay',
    fontWeight: FontWeight.w500,
  ),
  titleLarge: TextStyle(
    color: colorScheme.onPrimaryContainer,
    fontFamily: 'Lexend',
    fontWeight: FontWeight.w500,
  ),
  titleMedium: TextStyle(
    color: colorScheme.onPrimaryContainer,
    fontFamily: 'Lexend',
    fontWeight: FontWeight.w500,
  ),
  titleSmall: TextStyle(
    color: colorScheme.onPrimaryContainer,
    fontFamily: 'Lexend',
    fontWeight: FontWeight.w400,
  ),
  bodyLarge: TextStyle(
    color: colorScheme.onPrimaryContainer,
    fontFamily: 'Inter',
    fontWeight: FontWeight.normal,
  ),
  bodyMedium: TextStyle(
    color: colorScheme.onPrimaryContainer,
    fontFamily: 'Inter',
    fontWeight: FontWeight.normal,
  ),
  bodySmall: TextStyle(
    color: colorScheme.onPrimaryContainer,
    fontFamily: 'Inter',
    fontWeight: FontWeight.normal,
  ),
);