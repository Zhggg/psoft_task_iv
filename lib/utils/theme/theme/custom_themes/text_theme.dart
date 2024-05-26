import 'package:flutter/material.dart';

import '../../../../common/constant/colors.dart';

class AppTextTheme {
//Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    //-----Headline-----

    headlineLarge: const TextStyle().copyWith(
      fontSize: 30.0,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryColor,
    ),

    //Title
    titleLarge: const TextStyle().copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryColor,
    ),

    titleMedium: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryColor,
    ),

    titleSmall: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryColor,
    ),

    //Label
    labelLarge: const TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryColor,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryColor,
    ),

    labelSmall: const TextStyle().copyWith(
      fontSize: 11.0,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryColor,
    ),

    //Body
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryColor,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryColor,
    ),

    bodySmall: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryColor,
    ),

    //Display
    displaySmall: const TextStyle().copyWith(
      fontSize: 11.0,
      fontWeight: FontWeight.w400,
      color: AppColors.darkerGrey,
    ),
  );

//Customizable Dark Text Theme

  static TextTheme darkTextTheme = TextTheme(
    //-----Headline-----

    headlineLarge: const TextStyle().copyWith(
      fontSize: 30.0,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),

    //Title
    titleLarge: const TextStyle().copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),

    titleMedium: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),

    titleSmall: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),

    //Label
    labelLarge: const TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),

    labelSmall: const TextStyle().copyWith(
      fontSize: 11.0,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),

    //Body
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),

    bodySmall: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),

    //Display
    displaySmall: const TextStyle().copyWith(
      fontSize: 11.0,
      fontWeight: FontWeight.w400,
      color: AppColors.darkGrey,
    ),
  );
}
