import 'package:flutter/material.dart';

abstract class BaseStyles{
  static double get borderRadius => 30.0;
  static double get borderWidth => 4.0;
  static double get listFieldHorizontal => 25.0;
  static double get listFieldVertical => 10.0;
  static double get animationOffset => 2.0;
  
  static EdgeInsets get listPadding{
    return EdgeInsets.symmetric(horizontal: listFieldHorizontal, vertical: listFieldVertical);
  }
}