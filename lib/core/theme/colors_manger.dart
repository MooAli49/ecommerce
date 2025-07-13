import 'package:flutter/material.dart';

class ColorsManger {
  // Main brand colors
  static const primaryColor = Color(0xFF4F46E5); // Indigo 600
  static const secondaryColor = Color(0xFF06B6D4); // Cyan 500
  static const backgroundColor = Color(0xFFF8FAFC); // Gray 50
  static const surfaceColor = Color(0xFFFFFFFF); // White
  static const errorColor = Color(0xFFEF4444); // Red 500

  // Text and icon colors
  static const onPrimary = Color(0xFFFFFFFF);
  static const onSecondary = Color(0xFF1E293B); // Gray 800
  static const onBackground = Color(0xFF1E293B); // Gray 800
  static const onSurface = Color(0xFF334155); // Gray 700
  static const onError = Color(0xFFFFFFFF);

  // Light color scheme
  static final lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primaryColor,
    onPrimary: onPrimary,
    secondary: secondaryColor,
    onSecondary: onSecondary,
    surface: surfaceColor,
    onSurface: onSurface,
    error: errorColor,
    onError: onError,
  );

  // Dark color scheme (optional, for future use)
  static final darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primaryColor,
    onPrimary: onPrimary,
    secondary: secondaryColor,
    onSecondary: onSecondary,
    surface: Color(0xFF27272A),
    onSurface: Color(0xFFF8FAFC),
    error: errorColor,
    onError: onError,
  );

  // Add more colors as needed
}
