import 'package:farmers_market/src/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static TextStyle get body => GoogleFonts.roboto(
      textStyle: TextStyle(color: AppColors.darkgray, fontSize: 16.0),
    );

  static TextStyle get suggestion => GoogleFonts.roboto(
      textStyle: TextStyle(color: AppColors.lightgray, fontSize: 14.0),
    );
}
