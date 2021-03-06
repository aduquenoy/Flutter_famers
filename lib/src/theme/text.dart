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

  static TextStyle get bodyRed => GoogleFonts.roboto(
        textStyle: TextStyle(
          color: AppColors.titre,
          fontSize: 16.0,
        ),
      );

  static TextStyle get bodyGreen => GoogleFonts.roboto(
        textStyle: TextStyle(
          color: AppColors.green,
          fontSize: 16.0,
        ),
      );
  
  static TextStyle get picker => GoogleFonts.roboto(
        textStyle: TextStyle(
          color: AppColors.darkgray,
          fontSize: 35.0,
        ),
      );

  static TextStyle get title => GoogleFonts.poppins(
        textStyle: TextStyle(
          color: AppColors.darkblue,
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
      );

  static TextStyle get subtitle => GoogleFonts.economica(
        textStyle: TextStyle(
          color: AppColors.bordertextfield,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      );

  static TextStyle get listTitle => GoogleFonts.economica(
        textStyle: TextStyle(
          color: AppColors.bordertextfield,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      );

  static TextStyle get navTitle => GoogleFonts.poppins(
        textStyle: TextStyle(
          color: AppColors.darkblue,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      );

  static TextStyle get navTitleMaterial => GoogleFonts.poppins(
        textStyle: TextStyle(
          color: Colors.white,
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
