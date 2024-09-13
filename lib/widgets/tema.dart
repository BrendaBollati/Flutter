import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: Colors.blue,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(color: Colors.blueAccent),
  );

  static final darkTheme = ThemeData(
    primaryColor: Colors.grey,
    brightness: Brightness.dark,
  );
}
