import 'package:flutter/material.dart';

import '../../../../common/constant/colors.dart';



class AppElevatedButton {
//Customizable Light Elevated Button Theme

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      foregroundColor: AppColors.light,
      backgroundColor: AppColors.buttonPrimary,
      disabledForegroundColor: AppColors.buttonDisabled,
      disabledBackgroundColor: AppColors.buttonDisabled,
      side: const BorderSide(
        color: AppColors.buttonPrimary,
      ),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
          fontSize: 16, color: AppColors.light, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

//Customizable dark Elevated Button Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      foregroundColor: AppColors.light,
      backgroundColor: AppColors.buttonPrimary,
      disabledForegroundColor: AppColors.buttonDisabled,
      disabledBackgroundColor: AppColors.buttonDisabled,
      side: const BorderSide(
        color: AppColors.buttonPrimary,
      ),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
          fontSize: 16, color: AppColors.light, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
