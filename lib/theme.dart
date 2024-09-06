import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    primaryColor: Colors.black,
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade100,
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF333333),
    ),
    primaryColor: Colors.white,
    primaryColorLight: Colors.black,
    colorScheme: ColorScheme.dark(
      background: Color.fromRGBO(42, 42, 42, 100),
    ));


