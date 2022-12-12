import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData myAppTheme = ThemeData(
  primaryColor: Colors.pink[50],
  colorScheme: const ColorScheme.light(
    primary: Color.fromRGBO(181, 93, 140, 1),
    secondary: Color.fromARGB(255, 135, 13, 78),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 135, 13, 78),
    ),
    headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 18.0),
  ),
  fontFamily: GoogleFonts.getFont('Fira Sans').fontFamily,
);
