import 'package:flutter/material.dart';

class ConejozTheme {
  ConejozTheme._();

  static const Color _lightPrimaryColor = Color(0xFF607D8B);

  static const Color _darkPrimaryColor = Color(0xFF3F51B5);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        seedColor: ConejozTheme._lightPrimaryColor,
        brightness: Brightness.light),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        seedColor: ConejozTheme._darkPrimaryColor, brightness: Brightness.dark),
  );
}
