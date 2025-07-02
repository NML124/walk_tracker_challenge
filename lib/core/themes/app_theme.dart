import 'package:flutter/material.dart';
import 'package:walk_tracker_challenge/core/themes/app_diemens.dart';
import 'package:walk_tracker_challenge/core/themes/app_fonts.dart';
import '/core/themes/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: AppFonts.fontFamily,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.lightNavActive,
    cardColor: AppColors.lightCardBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.lightPrimaryText,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: AppDimens.FONT_SIZE_48,
        fontWeight: FontWeight.bold,
        color: AppColors.lightPrimaryText,
      ),
      bodyLarge: TextStyle(
        fontSize: AppDimens.FONT_SIZE_16,
        color: AppColors.lightSecondaryText,
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.lightNavInactive),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.lightNavActive,
      unselectedItemColor: AppColors.lightNavInactive,
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightNavActive,
      secondary: AppColors.lightAccent,
    ),
    cardTheme: CardThemeData(elevation: 0),
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: AppFonts.fontFamily,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.darkNavActive,
    cardColor: AppColors.darkCardBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkPrimaryText,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: AppColors.darkPrimaryText,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: AppColors.darkSecondaryText),
    ),
    iconTheme: const IconThemeData(color: AppColors.darkNavInactive),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBackground,
      selectedItemColor: AppColors.darkNavActive,
      unselectedItemColor: AppColors.darkNavInactive,
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkNavActive,
      secondary: AppColors.darkAccent,
    ),
    cardTheme: CardThemeData(elevation: 0),
    useMaterial3: true,
  );
}
