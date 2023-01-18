import 'package:flutter/material.dart';
import 'package:movie_web_app/shared/colors.dart';

class Themedata {
  static ThemeData getTheme() {
    return ThemeData(
        scaffoldBackgroundColor: AppColors.primary,
        primaryColor: Colors.white,
        fontFamily: 'Outfit',
        iconTheme: const IconThemeData(
          color: AppColors.secondary,
        ),
        textTheme: TextTheme(
          headline1: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w700,
          ),
          headline2: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w600,
          ),
          subtitle1: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 18,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w500,
          ),
          subtitle2: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w500,
          ),
          bodyText1: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 16,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w500,
          ),
          button: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w500,
          ),
        ),
        chipTheme: const ChipThemeData(
            selectedColor: Color.fromARGB(255, 62, 100, 149),
            disabledColor: AppColors.secondary,
            showCheckmark: false,
            backgroundColor: AppColors.primary,
            labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500),
            padding: EdgeInsets.all(8)),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                backgroundColor: AppColors.secondary,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))))));
  }
}
