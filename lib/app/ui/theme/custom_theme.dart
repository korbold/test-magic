import 'package:flutter/material.dart';
import 'package:test_r/app/ui/theme/app_colors.dart';

class CustomTheme {
  static ThemeData light({
    Color color = AppColors.primaryColor,
    final fontSize = 14.0,
  }) =>
      ThemeData(
        primaryColor: color,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Color(AppColors.lightColor.value),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.secondaryColor),
        canvasColor: AppColors.secondaryColor,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: fontSize, color: AppColors.lightColorFont, fontWeight: FontWeight.w500),
          bodyMedium: TextStyle(fontSize: fontSize, color: AppColors.lightColorFont, fontWeight: FontWeight.w500),
          bodySmall: TextStyle(fontSize: fontSize, color: AppColors.lightColorFont, fontWeight: FontWeight.w500),
          labelSmall: const TextStyle(fontSize: 15.0, color: AppColors.lightColorFont, fontWeight: FontWeight.w500),
          labelLarge: const TextStyle(fontSize: 18.0, color: AppColors.lightColorFont, fontWeight: FontWeight.w700),
        ),
        appBarTheme: const AppBarTheme(color: AppColors.secondaryColor),
      );
}
