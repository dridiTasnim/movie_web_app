import 'package:flutter/material.dart';

class Themedata {
  ThemeData getTheme() {
    return ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1D2024),
        primaryColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Color(0xFFF37515),
        ),
        textTheme: TextTheme(
          headline1: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),
          headline2: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
          ),
          subtitle1: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
          subtitle2: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
          bodyText1: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
          button: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
        chipTheme: ChipThemeData(
          selectedColor: Color.fromARGB(255, 62, 100, 149),
          disabledColor: Color(0xFFF37515),
          showCheckmark: false,
          backgroundColor: Color(0xFFF37515),
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
          padding: EdgeInsets.all(8)
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                backgroundColor: Color(0xFFF37515),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))))));
  }
}
