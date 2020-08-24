import 'dart:io';
import 'package:farmers_market/src/bloc/product_bloc.dart';
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
import 'package:provider/provider.dart';

class EditProduct extends StatefulWidget {
  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  Widget build(BuildContext context) {

    var productBloc = Provider.of<ProductBloc>(context);

    if (Platform.isIOS) {
      return AppSliverScaffold.cupertinoSliverScaffold(
          navTitle: "", pageBody: pageBody(true, productBloc), context: context);
    } else {
      return AppSliverScaffold.materialSliverScaffold(
          navTitle: "", pageBody: pageBody(false, productBloc), context: context);
    }
  }
}

Widget pageBody(bool isIOS, ProductBloc productBloc) {

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
      StreamBuilder<String>(
        stream: productBloc.productName,
        builder: (context, snapshot) {
          return AppTextField(
            hintText: "Product name",
            cupertinoIcon: FontAwesomeIcons.shoppingBasket,
            materialIcon: FontAwesomeIcons.shoppingBasket,
            isIOS: isIOS,
            errorText: snapshot.error,
            onChanged: productBloc.changeProductName,
          );
        }
      ),
      AppDropdownButton(
        hintText: "Unit type",
        items: items,
        materialIcon: FontAwesomeIcons.balanceScale,
        cupertinoIcon: FontAwesomeIcons.balanceScale,
      ),
      StreamBuilder<double>(
        stream: productBloc.unitPrice,
        builder: (context, snapshot) {
          return AppTextField(
            hintText: "Unit price",
            cupertinoIcon: FontAwesomeIcons.tag,
            materialIcon: FontAwesomeIcons.tag,
            textInputType: TextInputType.number,
            isIOS: isIOS,
            errorText: snapshot.error,
            onChanged: productBloc.changeUnitPrice,
          );
        }
      ),
      StreamBuilder<int>(
        stream: productBloc.availableUnits,
        builder: (context, snapshot) {
          return AppTextField(
            hintText: "Available units",
            cupertinoIcon: FontAwesomeIcons.cubes,
            materialIcon: FontAwesomeIcons.cubes,
            textInputType: TextInputType.number,
            isIOS: isIOS,
            errorText: snapshot.error,
            onChanged: productBloc.changeAvailableUnits,
          );
        }
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
