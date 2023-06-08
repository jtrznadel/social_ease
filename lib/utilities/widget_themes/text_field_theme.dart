import 'package:flutter/material.dart';
import 'package:social_ease/constants/colors.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      prefixIconColor: tSecondaryColor,
      floatingLabelStyle: const TextStyle(color: Colors.black),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2.0, color: Colors.black),
          borderRadius: BorderRadius.circular(100)));

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      prefixIconColor: tPrimaryColor,
      floatingLabelStyle: const TextStyle(color: Colors.black),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2.0, color: Colors.black),
          borderRadius: BorderRadius.circular(100)));
}
