import 'package:farmers_market/src/screen/landing.dart';
import 'package:farmers_market/src/screen/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:farmers_market/src/screen/login.dart';

abstract class Routes {
  static MaterialPageRoute materialRoutes(RouteSettings settings){
    switch(settings.name){
      case "/landing":
      return MaterialPageRoute(builder: (context) => Landing());
      case "/signup":
      return MaterialPageRoute(builder: (context) => Signup());
      case "/login":
      return MaterialPageRoute(builder: (context) => Login());
      default:
      return MaterialPageRoute(builder: (context) => Login());
    }
  }

  static CupertinoPageRoute cupertinoRoutes(RouteSettings settings){
    switch(settings.name){
      case "/landing":
      return CupertinoPageRoute(builder: (context) => Landing());
      case "/signup":
      return CupertinoPageRoute(builder: (context) => Signup());
      case "/login":
      return CupertinoPageRoute(builder: (context) => Login());
      default:
      return CupertinoPageRoute(builder: (context) => Login());
    }
  }
}