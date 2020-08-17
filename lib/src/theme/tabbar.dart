import 'package:flutter/material.dart';
import 'color.dart';

abstract class TabBarStyles{

  static Color get unselectedLabelColor => AppColors.lightgray;
  static Color get labelColor => AppColors.bordertextfield;
  static Color get indicatorColor => AppColors.bordertextfield;
}