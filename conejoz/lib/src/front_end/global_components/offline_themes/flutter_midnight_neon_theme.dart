import 'package:flutter/material.dart';

class FluttterMidnightNeonTheme {
  FluttterMidnightNeonTheme._();

  // If you want to modify both themes at once, modify the colors below.

  static const Color _primaryColor = Color.fromARGB(255, 108, 100, 188);
  static const Color _primaryInverseColor = Color.fromARGB(255, 60, 69, 123);
  static const Color _onSurfaceColor = Color.fromARGB(255, 143, 239, 124);
  static const Color _onSurfaceVariant = Color.fromARGB(255, 13, 255, 231);
  static const Color _onPrimaryColor = Color.fromARGB(255, 255, 121, 3);
  static const Color _surfaceColor = Color.fromARGB(255, 73, 10, 107);
  static const Color _backgroundColor = Color(0xFF373C4B);
  static const Color _onSecondaryColor = Color(0xFFE1E3E4);
  static const Color _onBackgroundColor = Color(0xFF828A9A);
  static const Color _secondaryColor = Color.fromARGB(255, 5, 55, 108);
  static const Color _primaryContainer = Color.fromARGB(255, 56, 52, 70);
  static const Color _errorColor = Color.fromARGB(255, 193, 255, 5);
  static const Color _onErrorColor = Color(0xFF354157);

  // If you want to modify the light theme only, modify the colors below.

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: FluttterMidnightNeonTheme._primaryColor,
      background: FluttterMidnightNeonTheme._backgroundColor,
      primary: FluttterMidnightNeonTheme._primaryColor,
      secondary: FluttterMidnightNeonTheme._secondaryColor,
      inversePrimary: FluttterMidnightNeonTheme._primaryInverseColor,
      onSurface: FluttterMidnightNeonTheme._onSurfaceColor,
      surface: FluttterMidnightNeonTheme._surfaceColor,
      onSurfaceVariant: FluttterMidnightNeonTheme._onSurfaceVariant,
      onPrimary: FluttterMidnightNeonTheme._onPrimaryColor,
      onSecondary: FluttterMidnightNeonTheme._onSecondaryColor,
      onBackground: FluttterMidnightNeonTheme._onBackgroundColor,
      primaryContainer: FluttterMidnightNeonTheme._primaryContainer,
      error: FluttterMidnightNeonTheme._errorColor,
      onError: FluttterMidnightNeonTheme._onErrorColor,
    ),
  );

  // If you want to modify the dark theme only, modify the colors below.

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: FluttterMidnightNeonTheme._primaryColor,
      background: FluttterMidnightNeonTheme._backgroundColor,
      primary: FluttterMidnightNeonTheme._primaryColor,
      secondary: FluttterMidnightNeonTheme._secondaryColor,
      inversePrimary: FluttterMidnightNeonTheme._primaryInverseColor,
      onSurface: FluttterMidnightNeonTheme._onSurfaceColor,
      surface: FluttterMidnightNeonTheme._surfaceColor,
      onSurfaceVariant: FluttterMidnightNeonTheme._onSurfaceVariant,
      onPrimary: FluttterMidnightNeonTheme._onPrimaryColor,
      onSecondary: FluttterMidnightNeonTheme._onSecondaryColor,
      onBackground: FluttterMidnightNeonTheme._onBackgroundColor,
      primaryContainer: FluttterMidnightNeonTheme._primaryContainer,
      error: FluttterMidnightNeonTheme._errorColor,
      onError: FluttterMidnightNeonTheme._onErrorColor,
    ),
  );
}

// A custom theme by Ivan Robayo | Check out FlutterCustomThemesVol1 for more.
// GitHub: @navirobayo 
