import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_ease/utilities/widget_themes/elevated_button_theme.dart';
import 'package:social_ease/utilities/widget_themes/outlined_button_theme.dart';
import 'package:social_ease/utilities/widget_themes/text_field_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
          titleMedium: GoogleFonts.montserrat(
              color: const Color(0xFFF9A826), fontWeight: FontWeight.bold),
          titleLarge: GoogleFonts.montserrat(
              color: const Color(0xFFF9A826), fontWeight: FontWeight.bold),
          bodyMedium: GoogleFonts.montserrat(color: Colors.black),
          bodyLarge: GoogleFonts.poppins(color: Colors.black),
          bodySmall: GoogleFonts.montserrat(color: Colors.black)),
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme);

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: TextTheme(
          titleMedium: GoogleFonts.montserrat(color: Colors.white70),
          bodyMedium: GoogleFonts.montserrat(color: Colors.white60)),
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme);
}
