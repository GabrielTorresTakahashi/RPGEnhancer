import 'package:flutter/material.dart';
//primaria Color(0xFF74121D)
//fundo Color(0xFF303030)
const Brightness brightness = Brightness.light;
const Color primary = Color(0xFF99121D);
const Color onPrimary = Colors.white;
const Color error = Colors.lightGreen;
const Color background = Color(0xFF303030);


ThemeData colorSettings = ThemeData().copyWith(
  colorScheme: const ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      secondary: primary,
      onSecondary: onPrimary,
      error: error,
      onError: onPrimary,
      background: background,
      onBackground: onPrimary,
      surface: primary,
      onSurface: onPrimary),
  appBarTheme: const AppBarTheme(
    backgroundColor: primary,
  ),
);

ButtonStyle menuNavigationButton = ElevatedButton.styleFrom(backgroundColor: primary);
