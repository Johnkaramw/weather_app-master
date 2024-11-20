



import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blueGrey[900]
  ),
  switchTheme: SwitchThemeData(
    trackColor: WidgetStatePropertyAll(Colors.grey),
    thumbColor: WidgetStatePropertyAll(Colors.white)
  ),
  // drawerTheme: DrawerThemeData(
  //  backgroundColor: Colors.black
  // )
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: Colors.grey.withOpacity(0.1),
  ),
);