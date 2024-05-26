import 'package:flutter/material.dart';

import '../../../../common/constant/colors.dart';


class AppTextButton {
//Customizable Light Elevated Button Theme

  static final lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.buttonPrimary,
      textStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
    ),
  );

//Customizable dark Elevated Button Theme
  static final darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.buttonPrimary,
      textStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
    ),
  );
}
