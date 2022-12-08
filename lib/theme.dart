import 'package:flutter/material.dart';

final ThemeData myAppTheme = ThemeData(
  primaryColor: Colors.blue,
  colorScheme: const ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.red,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
    headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 18.0),
  ),
);