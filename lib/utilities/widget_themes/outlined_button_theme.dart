import 'package:flutter/material.dart';
import 'package:social_ease/constants/colors.dart';
import 'package:social_ease/constants/sizes.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          foregroundColor: tPrimaryColor,
          side: const BorderSide(color: tPrimaryColor),
          padding: const EdgeInsets.symmetric(vertical: tButtonHeight)));

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          foregroundColor: tWhiteColor,
          side: const BorderSide(color: tWhiteColor),
          padding: const EdgeInsets.symmetric(vertical: tButtonHeight)));
}
