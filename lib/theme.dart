import 'package:flutter/material.dart';
import 'package:blogclub/gen/fonts.gen.dart';
import 'package:blogclub/main.dart';


class ThemeConfig {
  static ThemeData theme() {
    return ThemeData(
      colorScheme: ColorScheme(
        shadow: Color(0x4d000000),
        primaryContainer: Color(0xffffffff),
        brightness: Brightness.light,
        primary: Color(0xFF376AED),
        onPrimary: Color(0xffffffff),
        secondary: Color(0xff376AED),
        onSecondary: Color(0xffffffff),
        error: Color(0xffffffff),
        onError: Color(0xff000000),
        surface: Color(0xffF4F7FF),
        onSurface: Color(0xff000000),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0.8,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,),),

      textTheme: TextTheme(
        labelMedium: TextStyle(
          color: Colors.white,
          fontSize: 19,
          fontWeight: FontWeight.w600,
          fontFamily: "Avenir",
        ),
        headlineMedium: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: "Avenir",
        ),
        labelSmall: TextStyle(
          color: MyApp.primaryFontColor,
          fontWeight: FontWeight.w600,
          fontFamily: FontFamily.avenir,
          fontSize: 20,
        ),
        titleLarge: TextStyle(
          color: MyApp.primaryFontColor,
          fontWeight: FontWeight.w600,
          fontFamily: FontFamily.avenir,
          fontSize: 24,
        ),
        titleMedium: TextStyle(
          color: MyApp.primaryFontColor,
          fontWeight: FontWeight.w400,
          fontFamily: FontFamily.avenir,
          fontSize: 16,
        ),
        titleSmall: TextStyle(
          color: MyApp.primarySchemeColor,
          fontWeight: FontWeight.w400,
          fontFamily: FontFamily.avenir,
          fontSize: 12,
        ),
        bodyMedium: TextStyle(
          color: MyApp.primaryFontColor,
          fontWeight: FontWeight.w200,
          fontFamily: FontFamily.avenir,
          fontSize: 14,
        ),
      ),
    );
  }
}
