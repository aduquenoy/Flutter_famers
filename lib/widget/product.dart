import 'dart:io';
//import 'package:cupertino_toolbar/cupertino_toolbar.dart';
import 'package:farmers_market/src/bloc/auth_bloc.dart';
import 'package:farmers_market/src/bloc/product_bloc.dart';
import 'package:farmers_market/src/model/product.dart';
import 'package:farmers_market/src/theme/color.dart';
import 'package:farmers_market/widget/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productBloc = Provider.of<ProductBloc>(context);
    var authBloc = Provider.of<AuthBloc>(context);

    return pageBody(productBloc, context, authBloc.userId);
  }
}

Widget pageBody(
    ProductBloc productBloc, BuildContext context, String vendorId) {
  return StreamBuilder<List<Product>>(
      stream: productBloc.productByVendorId(vendorId),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return (Platform.isIOS)
              ? CupertinoActivityIndicator()
              : CircularProgressIndicator();

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var product = snapshot.data[index];

                  return GestureDetector(
                    child: AppCard(
                      availableUnits: product.availableUnits,
                      price: product.unitPrice,
                      productName: product.productName,
                      unitType: product.unitType,
                    ),
                    onTap: () => Navigator.of(context)
                        .pushNamed("/editproduct/${product.productId}"),
                  );
                },
              ),
            ),
            GestureDetector(
              child: Container(
                height: 50.0,
                width: double.infinity,
                color: AppColors.bordertextfield,
                child: (Platform.isIOS)
                    ? Icon(CupertinoIcons.add, color: Colors.white, size: 35.0)
                    : Icon(Icons.add, color: Colors.white, size: 35.0),
              ),
              onTap: () => Navigator.of(context).pushNamed("/editproduct"),
            )
          ],
        );
      });
}
