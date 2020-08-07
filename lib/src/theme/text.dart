import 'package:farmers_market/src/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static TextStyle get body => GoogleFonts.roboto(
        textStyle: TextStyle(
          color: AppColors.darkgray,
          fontSize: 16.0,
        ),
      );

  static TextStyle get title => GoogleFonts.poppins(
        textStyle: TextStyle(
          color: AppColors.darkblue,
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
      );

  static TextStyle get navTitle => GoogleFonts.poppins(
        textStyle: TextStyle(
          color: AppColors.darkblue,
          fontWeight: FontWeight.bold,
        ),
      );

  static TextStyle get link => GoogleFonts.roboto(
        textStyle: TextStyle(
          color: AppColors.bordertextfield,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      );

  static TextStyle get suggestion => GoogleFonts.roboto(
        textStyle: TextStyle(
          color: AppColors.lightgray,
          fontSize: 14.0,
        ),
      );

  static TextStyle get error => GoogleFonts.roboto(
        textStyle: TextStyle(
          color: AppColors.titre,
          fontSize: 12.0,
        ),
      );

  static TextStyle get buttonTextLight {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle get buttonTextDark {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: AppColors.darkgray,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
