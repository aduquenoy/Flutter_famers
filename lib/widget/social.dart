import 'package:farmers_market/src/theme/base.dart';
import 'package:farmers_market/src/theme/button.dart';
import 'package:farmers_market/src/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppSocialButton extends StatelessWidget {

  final SocialType socialType;

  AppSocialButton({@required this.socialType});

  @override
  Widget build(BuildContext context) {

    Color buttonColor;
    Color iconColor;
    IconData icon;

    switch(socialType){
      case SocialType.Facebook:
      iconColor = Colors.white;
      buttonColor = AppColors.facebook;
      icon = FontAwesomeIcons.facebookF;
      break;
      default:
      iconColor = Colors.white;
      buttonColor = AppColors.google;
      icon = FontAwesomeIcons.google;
      break;
    }

    return Container(
      height: ButtonStyles.buttonHeight,
      width: ButtonStyles.buttonHeight,
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(BaseStyles.borderRadius)),
      child: Icon(icon, color: iconColor)
    );
  }
}

enum SocialType{
  Facebook,
  Google
}