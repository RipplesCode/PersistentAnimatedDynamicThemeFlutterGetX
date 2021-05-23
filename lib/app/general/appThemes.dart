import 'package:flutter/material.dart';

class AppThemes {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        color: colorScheme.primary,
        elevation: 0,
        brightness: colorScheme.brightness,
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFF6200EE),
    primaryVariant: Color(0xFF640AFF),
    secondary: Color(0xFF03DAC5),
    secondaryVariant: Color(0xFF0AE1C5),
    background: Color(0xFFE6EBEB),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static final ColorScheme darkColorScheme = ColorScheme(
    primary: Colors.lightBlue,
    primaryVariant: Colors.lightBlue.shade900,
    secondary: Colors.yellow,
    secondaryVariant: Colors.yellow.shade900,
    background: Color(0xff141A31),
    surface: Color(0xff1E2746),
    onBackground: Color(0x0DFFFFFF),
    // White with 0.05 opacity
    error: Colors.red,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    brightness: Brightness.dark,
  );
}
