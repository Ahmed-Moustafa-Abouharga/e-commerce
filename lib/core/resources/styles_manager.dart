import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: ColorManager.primaryColor),
        titleMedium: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        titleSmall: TextStyle(
            fontWeight: FontWeight.w300, fontSize: 16.sp, color: Colors.white),
        headlineSmall: TextStyle(
            fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.white)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.primaryColor,
      selectedIconTheme: IconThemeData(color: ColorManager.primaryColor),
      unselectedIconTheme: IconThemeData(color: Colors.white)
    ),
    colorScheme: ColorScheme.fromSeed(
        secondary: ColorManager.secondaryColor,
        seedColor: Colors.deepPurple,
        primary: ColorManager.primaryColor),
    useMaterial3: true,
  );
}
