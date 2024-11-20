import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue
  ),
  ///
  ///
  brightness: Brightness.light,
  primaryColor: Colors.deepOrangeAccent,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.red,
  ),
  ///
  ///
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      ),
      shape: WidgetStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      backgroundColor: const WidgetStatePropertyAll<Color>(Colors.red),
      foregroundColor: const WidgetStatePropertyAll(Colors.blue),
      overlayColor: const WidgetStatePropertyAll(Colors.lightGreen)
    ),
  ),
  ///
  ///
  textTheme: const TextTheme(
    headlineSmall: TextStyle(color: Colors.black),
  ),
  ///
  /// 
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: Colors.grey.withOpacity(0.1),
  ),
  ///
  ///
  navigationBarTheme: const NavigationBarThemeData(
    backgroundColor: Colors.amber
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.blueGrey[50],
  )
);
