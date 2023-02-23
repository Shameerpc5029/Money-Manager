import 'package:flutter/material.dart';
import 'package:money_manager/common/style/colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: false,
      foregroundColor: Colors.black,
      backgroundColor: AppColors().backgroundLightColor,
    ),
    scaffoldBackgroundColor: AppColors().backgroundLightColor,
    useMaterial3: true,
    primaryColor: AppColors().backgroundLightColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Colors.black38,
      ),
      titleLarge: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
      headlineLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.black,
      ),
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors().backgroundDarkColor,
    primaryColor: AppColors().backgroundDarkColor,
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: AppColors().backgroundDarkColor,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: Colors.white,
      ),
      displayLarge: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: Colors.white,
      ),
    ),
    useMaterial3: true,
  );
}
