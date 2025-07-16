import 'package:ecommerce/core/theme/colors_manger.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: ColorsManger.primary,
    onPrimary: ColorsManger.onPrimary,
    secondary: ColorsManger.secondary,
    onSecondary: ColorsManger.onSecondary,
    surface: ColorsManger.surface,
    onSurface: ColorsManger.onSurface,
    error: ColorsManger.error,
    onError: ColorsManger.onError,
  );

  static final darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: ColorsManger.primary,
    onPrimary: ColorsManger.onPrimary,
    secondary: ColorsManger.secondary,
    onSecondary: ColorsManger.onSecondary,
    surface: Color(0xFF27272A),
    onSurface: Color(0xFFF8FAFC),
    error: ColorsManger.error,
    onError: ColorsManger.onError,
  );

  ThemeData get lightTheme => ThemeData(
    colorScheme: AppTheme.lightScheme,
    scaffoldBackgroundColor: ColorsManger.background,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManger.primary,
      foregroundColor: ColorsManger.onPrimary,
      elevation: 0,
      iconTheme: const IconThemeData(color: ColorsManger.onPrimary),
      titleTextStyle: const TextStyle(
        color: ColorsManger.onPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManger.primary,
        foregroundColor: ColorsManger.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: ColorsManger.secondary.withOpacity(0.1),
      labelStyle: const TextStyle(color: ColorsManger.onSecondary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorsManger.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );

  ThemeData get darkTheme => ThemeData(
    colorScheme: AppTheme.darkScheme,
    scaffoldBackgroundColor: Color(0xFF1F2937),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF111827),
      foregroundColor: ColorsManger.onPrimary,
      elevation: 0,
      iconTheme: const IconThemeData(color: ColorsManger.onPrimary),
      titleTextStyle: const TextStyle(
        color: ColorsManger.onPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManger.primary,
        foregroundColor: ColorsManger.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: ColorsManger.secondary.withOpacity(0.1),
      labelStyle: const TextStyle(color: ColorsManger.onSecondary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF374151),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
