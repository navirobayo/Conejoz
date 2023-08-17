import 'package:flutter/material.dart';

class ConejozMonokaiTheme {
  ConejozMonokaiTheme._();

  static const Color _primaryColor = Color(0xFF354157); //* Do not modify.
  static const Color _primaryInverseColor =
      Color(0xFF4E432F); //* Do not modify.
  static const Color _onSurfaceColor = Color(0xFFA5E179); //* Do not modify.
  static const Color _onSurfaceVariant = Color(0xFFFF6578); //* Do not modify.
  static const Color _onPrimaryColor = Color(0xFF72CCE8); //* Do not modify.
  static const Color _surfaceColor = Color(0xFFEACB64); //* Do not modify.
  static const Color _backgroundColor = Color(0xFF373C4B); //* Do not modify.
  static const Color _onSecondaryColor = Color(0xFFE1E3E4); //* Do not modify.

  static const Color _secondaryColor = Color(0xFF4E432F);
  static const Color _errorColor = Color(0xFF3F51B5);
  static const Color _primaryContainer = Color(0xFF3F51B5);
  static const Color _onErrorColor = Color(0xFF3F51B5);
  static const Color _onBackgroundColor = Color(0xFF828A9A);

  static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: ConejozMonokaiTheme._primaryColor, //*
        background: ConejozMonokaiTheme._backgroundColor, //*
        primary: ConejozMonokaiTheme._primaryColor, //*
        secondary: ConejozMonokaiTheme._secondaryColor, //*
        inversePrimary: ConejozMonokaiTheme._primaryInverseColor, //*
        onSurface: ConejozMonokaiTheme._onSurfaceColor, //*
        surface: ConejozMonokaiTheme._surfaceColor, //*
        onSurfaceVariant: ConejozMonokaiTheme._onSurfaceVariant, //*
        onPrimary: ConejozMonokaiTheme._onPrimaryColor, //*
        onSecondary: ConejozMonokaiTheme._onSecondaryColor, //*
        onBackground: ConejozMonokaiTheme._onBackgroundColor, //*

        primaryContainer: ConejozMonokaiTheme._primaryContainer,
        error: ConejozMonokaiTheme._errorColor,
        onError: ConejozMonokaiTheme._onErrorColor,
      ),
      cardColor: _surfaceColor);

  static final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: ConejozMonokaiTheme._primaryColor, //*
        background: ConejozMonokaiTheme._backgroundColor, //*
        primary: ConejozMonokaiTheme._primaryColor, //*
        secondary: ConejozMonokaiTheme._secondaryColor, //*
        inversePrimary: ConejozMonokaiTheme._primaryInverseColor, //*
        onSurface: ConejozMonokaiTheme._onSurfaceColor, //*
        surface: ConejozMonokaiTheme._surfaceColor, //*
        onSurfaceVariant: ConejozMonokaiTheme._onSurfaceVariant, //*
        onPrimary: ConejozMonokaiTheme._onPrimaryColor, //*
        onSecondary: ConejozMonokaiTheme._onSecondaryColor, //*
        onBackground: ConejozMonokaiTheme._onBackgroundColor, //*

        primaryContainer: ConejozMonokaiTheme._primaryContainer,
        error: ConejozMonokaiTheme._errorColor,
        onError: ConejozMonokaiTheme._onErrorColor,
      ),
      cardColor: _surfaceColor);
}
