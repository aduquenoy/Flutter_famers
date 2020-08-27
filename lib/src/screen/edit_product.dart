import 'dart:io';
import 'package:farmers_market/src/app.dart';
import 'package:farmers_market/src/bloc/auth_bloc.dart';
import 'package:farmers_market/src/bloc/product_bloc.dart';
import 'package:farmers_market/src/model/product.dart';
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
  final String productId;

  EditProduct({this.productId});

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  void initState() {
    var productBloc = Provider.of<ProductBloc>(context, listen: false);
    productBloc.productSaved.listen((saved) {
      if (saved != null && saved == true) Navigator.of(context).pop();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productBloc = Provider.of<ProductBloc>(context);
    var authBloc = Provider.of<AuthBloc>(context);

    return FutureBuilder<Product>(
      future: productBloc.fetchProduct(widget.productId),
      builder: (context, snapshot) {
        if (!snapshot.hasData && widget.productId != null) {
          return Center(
              child: (Platform.isIOS)
                  ? CupertinoActivityIndicator()
                  : CircularProgressIndicator());
        }

        //TODO load bloc values

        return (Platform.isIOS)
            ? AppSliverScaffold.cupertinoSliverScaffold(
                navTitle: "",
                pageBody: pageBody(true, productBloc, context),
                context: context)
            : AppSliverScaffold.materialSliverScaffold(
                navTitle: "",
                pageBody: pageBody(false, productBloc, context),
                context: context);
      },
    );
  }
}

Widget pageBody(bool isIOS, ProductBloc productBloc, BuildContext context) {
  var items = Provider.of<List<String>>(context);

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
          }),
      StreamBuilder<String>(
          stream: productBloc.unitType,
          builder: (context, snapshot) {
            return AppDropdownButton(
              hintText: "Unit type",
              items: items,
              value: snapshot.data,
              materialIcon: FontAwesomeIcons.balanceScale,
              cupertinoIcon: FontAwesomeIcons.balanceScale,
              onChanged: productBloc.changeUnitType,
            );
          }),
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
          }),
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
          }),
      AppButton(
        buttonText: "Add image",
        buttonType: ButtonType.BorderTextfield,
      ),
      StreamBuilder<bool>(
          stream: productBloc.isValid,
          builder: (context, snapshot) {
            return AppButton(
              buttonText: "Save product",
              buttonType: (snapshot.data == true)
                  ? ButtonType.DarkBlue
                  : ButtonType.Disabled,
              onPressed: productBloc.saveProduct,
            );
          }),
    ],
  );
}
