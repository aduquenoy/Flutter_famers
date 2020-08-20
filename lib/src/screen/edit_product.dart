import 'dart:io';
import 'package:farmers_market/src/theme/base.dart';
import 'package:farmers_market/src/theme/color.dart';
import 'package:farmers_market/src/theme/text.dart';
import 'package:farmers_market/widget/button.dart';
import 'package:farmers_market/widget/dropdown_button.dart';
import 'package:farmers_market/widget/sliver_scafold.dart';
import 'package:farmers_market/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProduct extends StatefulWidget {
  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return AppSliverScaffold.cupertinoSliverScaffold(
          navTitle: "", pageBody: pageBody(true));
    } else {
      return AppSliverScaffold.materialSliverScaffold(
          navTitle: "", pageBody: pageBody(false), context: context);
    }
  }
}

Widget pageBody(bool isIOS) {

  List<String> items = List<String>();
  items.add("Pounds");
  items.add("Single");

  return ListView(
    children: <Widget>[
      Text(
        "Add product",
        style: TextStyles.subtitle,
        textAlign: TextAlign.center,
      ),
      Padding(
        padding: BaseStyles.listPadding,
        child: Divider(
          color: AppColors.darkblue,
        ),
      ),
      AppTextField(
        cupertinoIcon: FontAwesomeIcons.shoppingBasket,
        materialIcon: FontAwesomeIcons.shoppingBasket,
        hintText: "Product name",
        isIOS: isIOS,
      ),
      AppDropdownButton(
        hintText: "Unit type",
        items: items,
        materialIcon: FontAwesomeIcons.balanceScale,
        cupertinoIcon: FontAwesomeIcons.balanceScale,
      ),
      AppTextField(
        cupertinoIcon: FontAwesomeIcons.tag,
        materialIcon: FontAwesomeIcons.tag,
        hintText: "Unit price",
        isIOS: isIOS,
      ),
      AppTextField(
        cupertinoIcon: FontAwesomeIcons.hashtag,
        materialIcon: FontAwesomeIcons.hashtag,
        hintText: "Available units",
        isIOS: isIOS,
      ),
      AppButton(
        buttonText: "Add image",
        buttonType: ButtonType.BorderTextfield,
      ),
      AppButton(
        buttonText: "Save product",
        buttonType: ButtonType.DarkBlue,
      ),
    ],
  );
}
