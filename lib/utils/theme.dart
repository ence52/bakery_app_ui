import 'package:bakery_app_ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  useMaterial3: false,
  iconTheme: const IconThemeData(color: primaryColor),
  inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: themeIconColor,
      prefixIconColor: primaryColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadiusCircular),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadiusCircular),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadiusCircular),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.only(left: 20, bottom: 16, top: 16),
      hintStyle: TextStyle(
          color: const Color.fromARGB(118, 42, 42, 42).withAlpha(100),
          fontSize: 12.sp),
      labelStyle: TextStyle(
          color: const Color.fromARGB(118, 42, 42, 42).withAlpha(200),
          fontWeight: FontWeight.bold,
          fontSize: 12.sp)),
);
