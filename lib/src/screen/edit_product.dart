import 'dart:io';
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
import 'package:fluttertoast/fluttertoast.dart';
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
      if (saved != null && saved == true && context != null){
        Fluttertoast.showToast(
            msg: "Product saved",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: AppColors.lightblue,
            textColor: Colors.white,
            fontSize: 16.0);

        Navigator.of(context).pop();
      }
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
          return Scaffold(
            body: Center(
                child: (Platform.isIOS)
                    ? CupertinoActivityIndicator()
                    : CircularProgressIndicator()),
          );
        }

        Product existingProduct;

        if (widget.productId != null) {
          existingProduct = snapshot.data;
          loadValues(productBloc, existingProduct, authBloc.userId);
        } else {
          loadValues(productBloc, null, authBloc.userId);
        }

        return (Platform.isIOS)
            ? AppSliverScaffold.cupertinoSliverScaffold(
                navTitle: "",
                pageBody: pageBody(true, productBloc, context, existingProduct),
                context: context)
            : AppSliverScaffold.materialSliverScaffold(
                navTitle: "",
                pageBody:
                    pageBody(false, productBloc, context, existingProduct),
                context: context);
      },
    );
  }

  Widget pageBody(bool isIOS, ProductBloc productBloc, BuildContext context,
      Product existingProduct) {
    var items = Provider.of<List<String>>(context);
    var pageLabel = (existingProduct != null) ? "Edit product" : "Add product";

    return ListView(
      children: <Widget>[
        Text(
          pageLabel,
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
                initialText: (existingProduct != null)
                    ? existingProduct.productName
                    : null,
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
                initialText: (existingProduct != null)
                    ? existingProduct.unitPrice.toString()
                    : null,
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
                initialText: (existingProduct != null)
                    ? existingProduct.availableUnits.toString()
                    : null,
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
}

void loadValues(ProductBloc productBloc, Product product, String vendorId) {
  productBloc.changeProduct(product);
  productBloc.changeVendorId(vendorId);

  if (product != null) {
    productBloc.changeUnitType(product.unitType);
    productBloc.changeProductName(product.productName);
    productBloc.changeUnitPrice(product.unitPrice.toString());
    productBloc.changeAvailableUnits(product.availableUnits.toString());
  } else {
    productBloc.changeUnitType(null);
    productBloc.changeProductName(null);
    productBloc.changeUnitPrice(null);
    productBloc.changeAvailableUnits(null);
  }
}
