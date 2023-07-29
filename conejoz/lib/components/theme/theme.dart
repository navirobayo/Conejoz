import 'package:flutter/material.dart';

class ConejozTheme {
  ConejozTheme._();

  static const Color _lightPrimaryColor = Colors.blueGrey;

  static const Color _darkPrimaryColor = Colors.indigo;

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
