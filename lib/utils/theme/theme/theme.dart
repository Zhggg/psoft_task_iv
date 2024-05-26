import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import 'custom_themes/app_bar_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/icon_theme.dart';
import 'custom_themes/text_button.dart';
import 'custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Urbanist',
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.primaryBackground,
      textTheme: AppTextTheme.lightTextTheme,
      appBarTheme: AAppBarTheme.lightAppBarTheme,
      elevatedButtonTheme: AppElevatedButton.lightElevatedButtonTheme,
      textButtonTheme: AppTextButton.lightTextButtonTheme,
      iconTheme: AppIconTheme.lightIconTheme);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.secondaryBackground,
      textTheme: AppTextTheme.darkTextTheme,
      fontFamily: 'Urbanist',
      appBarTheme: AAppBarTheme.darkAppBarTheme,
      elevatedButtonTheme: AppElevatedButton.darkElevatedButtonTheme,
      textButtonTheme: AppTextButton.darkTextButtonTheme,
      iconTheme: AppIconTheme.darkIconTheme);
}
