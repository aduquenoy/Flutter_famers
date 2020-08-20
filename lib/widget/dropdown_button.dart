import 'dart:io';
import 'package:farmers_market/src/theme/base.dart';
import 'package:farmers_market/src/theme/button.dart';
import 'package:farmers_market/src/theme/color.dart';
import 'package:farmers_market/src/theme/text.dart';
import 'package:flutter/material.dart';

class AppDropdownButton extends StatelessWidget {
  
  final List<String> items;
  final String hintText;
  final IconData materialIcon;
  final IconData cupertinoIcon;

  AppDropdownButton({
    @required this.items,
    @required this.hintText,
    this.materialIcon,
    this.cupertinoIcon,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return Container();
    } else {
      return Padding(
        padding: BaseStyles.listPadding,
        child: Container(
          height: ButtonStyles.buttonHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.bordertextfield,
              width: BaseStyles.borderWidth,
            ),
            borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
          ),
          child: Row(
            children: <Widget>[
              Container(
                  width: 35.0, child: BaseStyles.iconPrefix(materialIcon)),
              Expanded(
                child: Center(
                  child: DropdownButton<String>(
                    items: buildMaterialItems(items),
                    value: null,
                    hint: Text(
                      hintText,
                      style: TextStyles.suggestion,
                    ),
                    style: TextStyles.body,
                    underline: Container(),
                    iconEnabledColor: AppColors.bordertextfield,
                    onChanged: (value) {},
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  List<DropdownMenuItem<String>> buildMaterialItems(List<String> items) {
    return items
        .map(
          (item) => DropdownMenuItem<String>(
            child: Text(item, textAlign: TextAlign.center),
            value: item,
          ),
        )
        .toList();
  }
}