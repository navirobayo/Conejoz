import 'package:flutter/material.dart';

class ConejozAtariTheme {
  ConejozAtariTheme._();

  static const Color _lightPrimaryColor = Color.fromARGB(255, 235, 18, 18);

  static const Color _darkPrimaryColor = Color(0xFF3F51B5);

  static const Color _lightSecondaryColor = Color(0xFF607D8B);

  static const Color _darkSecondaryColor = Color(0xFF3F51B5);

  static const Color _lightAccentColor = Color(0xFF607D8B);

  static const Color _darkAccentColor = Color(0xFF3F51B5);

  static const Color _lightErrorColor = Color(0xFF607D8B);

  static const Color _darkErrorColor = Color(0xFF3F51B5);

  static const Color _lightBackgroundColor = Color.fromARGB(255, 49, 218, 7);

  static const Color _darkBackgroundColor = Color(0xFF3F51B5);

  static const Color _lightSurfaceColor = Color(0xFF607D8B);

  static const Color _darkSurfaceColor = Color(0xFF3F51B5);

  static const Color _lightOnPrimaryColor = Color(0xFF607D8B);

  static const Color _darkOnPrimaryColor = Color(0xFF3F51B5);

  static const Color _lightOnSecondaryColor = Color(0xFF607D8B);

  static const Color _darkOnSecondaryColor = Color(0xFF3F51B5);

  static const Color _lightOnAccentColor = Color(0xFF607D8B);

  static const Color _darkOnAccentColor = Color(0xFF3F51B5);

  static const Color _lightOnErrorColor = Color(0xFF607D8B);

  static const Color _darkOnErrorColor = Color(0xFF3F51B5);

  static const Color _lightOnBackgroundColor = Color(0xFF607D8B);

  static const Color _darkOnBackgroundColor = Color(0xFF3F51B5);

  static const Color _lightOnSurfaceColor = Color(0xFF607D8B);

  static const Color _darkOnSurfaceColor = Color(0xFF3F51B5);

  static const Color _lightPrimaryVariantColor = Color(0xFF607D8B);

  static const Color _darkPrimaryVariantColor = Color(0xFF3F51B5);

  static const Color _lightSecondaryVariantColor = Color(0xFF607D8B);

  static const Color _darkSecondaryVariantColor = Color(0xFF3F51B5);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        seedColor: ConejozAtariTheme._lightPrimaryColor,
        brightness: Brightness.light),
    primaryColor: _lightPrimaryColor,
    scaffoldBackgroundColor: _lightBackgroundColor,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        seedColor: ConejozAtariTheme._darkPrimaryColor,
        brightness: Brightness.dark),
  );
}
