import 'package:flutter/material.dart';

class DefaultAppTheme {
  DefaultAppTheme._();

  // If you want to modify both themes at once, modify the colors below.

  static const Color _primaryColor = Color(0xFFEACB64);
  static const Color _primaryInverseColor = Color(0xFF4E432F);
  static const Color _onSurfaceColor = Color(0xFF72CCE8);
  static const Color _onSurfaceVariant = Color(0xFFFF6578);
  static const Color _onPrimaryColor = Color(0xFFA5E179);
  static const Color _surfaceColor = Color(0xFF4E432F);
  static const Color _backgroundColor = Color(0xFF373C4B);
  static const Color _onSecondaryColor = Color(0xFFE1E3E4);
  static const Color _onBackgroundColor = Color(0xFF828A9A);
  static const Color _secondaryColor = Color(0xFF55393D);
  static const Color _primaryContainer = Color(0xFF394634);
  static const Color _errorColor = Color(0xFFF69C5E);
  static const Color _onErrorColor = Color(0xFF354157);

  // If you want to modify the light theme only, modify the colors below.

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: DefaultAppTheme._primaryColor,
      background: DefaultAppTheme._backgroundColor,
      primary: DefaultAppTheme._primaryColor,
      secondary: DefaultAppTheme._secondaryColor,
      inversePrimary: DefaultAppTheme._primaryInverseColor,
      onSurface: DefaultAppTheme._onSurfaceColor,
      surface: DefaultAppTheme._surfaceColor,
      onSurfaceVariant: DefaultAppTheme._onSurfaceVariant,
      onPrimary: DefaultAppTheme._onPrimaryColor,
      onSecondary: DefaultAppTheme._onSecondaryColor,
      onBackground: DefaultAppTheme._onBackgroundColor,
      primaryContainer: DefaultAppTheme._primaryContainer,
      error: DefaultAppTheme._errorColor,
      onError: DefaultAppTheme._onErrorColor,
    ),
  );

  // If you want to modify the dark theme only, modify the colors below.

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: DefaultAppTheme._primaryColor,
      background: DefaultAppTheme._backgroundColor,
      primary: DefaultAppTheme._primaryColor,
      secondary: DefaultAppTheme._secondaryColor,
      inversePrimary: DefaultAppTheme._primaryInverseColor,
      onSurface: DefaultAppTheme._onSurfaceColor,
      surface: DefaultAppTheme._surfaceColor,
      onSurfaceVariant: DefaultAppTheme._onSurfaceVariant,
      onPrimary: DefaultAppTheme._onPrimaryColor,
      onSecondary: DefaultAppTheme._onSecondaryColor,
      onBackground: DefaultAppTheme._onBackgroundColor,
      primaryContainer: DefaultAppTheme._primaryContainer,
      error: DefaultAppTheme._errorColor,
      onError: DefaultAppTheme._onErrorColor,
    ),
  );
}

// The default theme for the Conejoz app by @navirobayo
// Check out FlutterCustomThemesVol1 for more. 
