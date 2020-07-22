import 'package:farmers_market/src/theme/base.dart';
import 'package:farmers_market/src/theme/button.dart';
import 'package:farmers_market/src/theme/color.dart';
import 'package:farmers_market/src/theme/text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {

  final String buttonText;
  final ButtonType buttonType;

  AppButton({@required this.buttonText, this.buttonType});

  @override
  Widget build(BuildContext context) {

    TextStyle fontStyle;
    Color buttonColor;

    switch(buttonType){
      case ButtonType.BorderTextfield:
      fontStyle = TextStyles.buttonTextLight;
      buttonColor = AppColors.bordertextfield;
      break;
      case ButtonType.LightBlue:
      fontStyle = TextStyles.buttonTextLight;
      buttonColor = AppColors.lightblue;
      break;
      case ButtonType.DarkBlue:
      fontStyle = TextStyles.buttonTextLight;
      buttonColor = AppColors.darkblue;
      break;
      case ButtonType.DarkGray:
      fontStyle = TextStyles.buttonTextLight;
      buttonColor = AppColors.darkgray;
      break;
      case ButtonType.LightGray:
      fontStyle = TextStyles.buttonTextDark;
      buttonColor = AppColors.lightgray;
      break;
      default:
      fontStyle = TextStyles.buttonTextLight;
      buttonColor = AppColors.lightblue;
      break;
    }

    return Padding(
      padding: BaseStyles.listPadding,
      child: Container(
        height: ButtonStyles.buttonHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(BaseStyles.borderRadius)),
        child: Center(
          child: Text(
            buttonText,
            style: fontStyle,
          ),
        ),
      ),
    );
  }
}

enum ButtonType{
  LightBlue,
  BorderTextfield,
  LightGray,
  DarkGray,
  DarkBlue
}