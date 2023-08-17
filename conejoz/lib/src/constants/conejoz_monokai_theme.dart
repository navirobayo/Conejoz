import 'package:flutter/material.dart';

class ConejozMonokaiTheme {
  ConejozMonokaiTheme._();

  // * Light Theme Colors.

  static const Color _lightPrimaryColor = Color.fromARGB(255, 235, 18, 18);
  static const Color _lightSecondaryColor = Color(0xFF607D8B);
  static const Color _lightAccentColor = Color(0xFF607D8B);
  static const Color _lightErrorColor = Color(0xFF607D8B);
  static const Color _lightBackgroundColor = Color.fromARGB(255, 49, 218, 7);
  static const Color _lightSurfaceColor = Color(0xFF607D8B);
  static const Color _lightOnPrimaryColor = Color(0xFF607D8B);
  static const Color _lightOnSecondaryColor = Color(0xFF607D8B);
  static const Color _lightOnAccentColor = Color(0xFF607D8B);
  static const Color _lightOnErrorColor = Color(0xFF607D8B);
  static const Color _lightOnBackgroundColor = Color(0xFF607D8B);
  static const Color _lightOnSurfaceColor = Color(0xFF607D8B);
  static const Color _lightPrimaryVariantColor = Color(0xFF607D8B);
  static const Color _lightSecondaryVariantColor = Color(0xFF607D8B);

  // * Dark Theme Colors.

  static const Color _darkPrimaryColor = Color(0xFF354157); //* Do not modify.
  static const Color _darkPrimaryInverseColor =
      Color(0xFF4E432F); //* Do not modify.
  static const Color _darkOnSurfaceColor = Color(0xFFA5E179); //* Do not modify.
  static const Color _darkOnSurfaceVariant =
      Color(0xFFFF6578); //* Do not modify.
  static const Color _darkOnPrimaryColor = Color(0xFF72CCE8); //* Do not modify.
  static const Color _darkSurfaceColor = Color(0xFFEACB64); //* Do not modify.
  static const Color _darkBackgroundColor =
      Color(0xFF373C4B); //* Do not modify.
  static const Color _darkOnSecondaryColor =
      Color(0xFFE1E3E4); //* Do not modify.

  static const Color _darkSecondaryColor = Color(0xFF4E432F);
  static const Color _darkSecondaryInverseColor = Color(0xFF55393D);
  static const Color _darkAccentColor = Color(0xFF3F51B5);
  static const Color _darkErrorColor = Color(0xFF3F51B5);
  static const Color _darkPrimaryContainer = Color(0xFF3F51B5);
  static const Color _darkOnAccentColor = Color(0xFF3F51B5);
  static const Color _darkOnErrorColor = Color(0xFF3F51B5);
  static const Color _darkOnBackgroundColor = Color(0xFF828A9A);
  static const Color _darkPrimaryVariantColor = Color(0xFF3F51B5);
  static const Color _darkSecondaryVariantColor = Color(0xFF3F51B5);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        seedColor: ConejozMonokaiTheme._lightPrimaryColor,
        brightness: Brightness.light),
    primaryColor: _lightPrimaryColor,
    scaffoldBackgroundColor: _lightBackgroundColor,
  );

  static final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: ConejozMonokaiTheme._darkPrimaryColor, //*
        background: ConejozMonokaiTheme._darkBackgroundColor, //*
        primary: ConejozMonokaiTheme._darkPrimaryColor, //*
        secondary: ConejozMonokaiTheme._darkSecondaryColor, //*
        inversePrimary: ConejozMonokaiTheme._darkPrimaryInverseColor, //*
        onSurface: ConejozMonokaiTheme._darkOnSurfaceColor, //*
        surface: ConejozMonokaiTheme._darkSurfaceColor, //*
        onSurfaceVariant: ConejozMonokaiTheme._darkOnSurfaceVariant, //*
        onPrimary: ConejozMonokaiTheme._darkOnPrimaryColor, //*
        onSecondary: ConejozMonokaiTheme._darkOnSecondaryColor, //*
        onBackground: ConejozMonokaiTheme._darkOnBackgroundColor, //*

        primaryContainer: ConejozMonokaiTheme._darkPrimaryContainer,
        error: ConejozMonokaiTheme._darkErrorColor,
        onError: ConejozMonokaiTheme._darkOnErrorColor,
      ),
      cardColor: _darkSurfaceColor);
}
