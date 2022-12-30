import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData myAppTheme = ThemeData(
  primaryColor: const Color.fromARGB(255, 173, 168, 230),
  primaryColorDark: const Color.fromARGB(255, 68, 66, 91),
  colorScheme: const ColorScheme.light(
    primary: Color.fromARGB(255, 251, 245, 228),
    secondary: Color.fromARGB(255, 233, 207, 192),
    tertiary: Color.fromARGB(255, 174, 124, 115),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 18.0),
  ),
  fontFamily: GoogleFonts.getFont('Fira Sans').fontFamily,
);
