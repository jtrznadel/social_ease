import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
          titleMedium: GoogleFonts.montserrat(color: Colors.black87),
          bodyMedium: GoogleFonts.montserrat(color: Colors.black87)),
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: ElevatedButton.styleFrom()));
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: TextTheme(
          titleMedium: GoogleFonts.montserrat(color: Colors.white70),
          bodyMedium: GoogleFonts.montserrat(color: Colors.white60)));
}
