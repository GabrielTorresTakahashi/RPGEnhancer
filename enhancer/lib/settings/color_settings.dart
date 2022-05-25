import 'package:flutter/material.dart';

const Brightness brightness = Brightness.light;
const Color primary = Color(0xFF74121D);
const Color onPrimary = Colors.white;
const Color secondary = Color(0xFF8A282D);
const Color onSecondary = Colors.white;
const Color error = Colors.lightGreen;
const Color onError = Colors.white;
const Color background = Color(0xFF303030);
const Color onBackground = Colors.white;
const Color surface = Colors.white;
const Color onSurface = Colors.white;

ThemeData colorSettings = ThemeData().copyWith(
  colorScheme: const ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
      error: error,
      onError: onError,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface),
  appBarTheme: const AppBarTheme(
    backgroundColor: primary,
  ),
);

ButtonStyle menuNavigationButton = ElevatedButton.styleFrom(primary: primary);
