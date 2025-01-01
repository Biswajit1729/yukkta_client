import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../color/colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primaryBackground,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryBackground,
    brightness: Brightness.light,
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightOnSurface,
    primary: AppColors.primaryBackground,
    onPrimary: AppColors.primaryText,
    secondary: AppColors.secondaryBackground,
    onSecondary: AppColors.primaryText,
  ),
  useMaterial3: true,
  textTheme: GoogleFonts.nunitoTextTheme(
    const TextTheme(
      headlineMedium: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: AppColors.lightOnSurface),
      bodyMedium: TextStyle(fontSize: 16, color: AppColors.lightOnSurface),
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryBackground,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryBackground,
    brightness: Brightness.dark,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkOnSurface,
    primary: AppColors.primaryBackground,
    onPrimary: AppColors.primaryText,
    secondary: AppColors.secondaryBackground,
    onSecondary: AppColors.primaryText,
  ),
  useMaterial3: true,
  textTheme: GoogleFonts.nunitoTextTheme(
    const TextTheme(
      headlineMedium: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: AppColors.darkOnSurface),
      bodyMedium: TextStyle(fontSize: 16, color: AppColors.darkOnSurface),
    ),
  ),
);
