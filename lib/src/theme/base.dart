import 'package:flutter/material.dart';
import 'color.dart';

abstract class BaseStyles {
  static double get borderRadius => 30.0;
  static double get borderWidth => 4.0;
  static double get listFieldHorizontal => 25.0;
  static double get listFieldVertical => 10.0;
  static double get animationOffset => 2.0;

  static EdgeInsets get listPadding {
    return EdgeInsets.symmetric(
        horizontal: listFieldHorizontal, vertical: listFieldVertical);
  }

  static List<BoxShadow> get boxShadow {
    return [
      BoxShadow(
        color: AppColors.lightgray,
        offset: Offset(3.0, 3.0),
        blurRadius: 4.0,
        spreadRadius: 4.0,
        
      )
    ];
  }

  static Widget iconPrefix(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Icon(
        icon,
        size: 20.0,
        color: AppColors.bordertextfield,
      ),
    );
  }
}
