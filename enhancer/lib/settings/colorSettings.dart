import 'package:flutter/material.dart';

const Color primary = Color(0xFF74121D);
const Color background = Color(0xFF303030);

ThemeData colorSettings = ThemeData().copyWith(
  backgroundColor: background,
  appBarTheme: const AppBarTheme(
    backgroundColor: primary,
  ),
);
