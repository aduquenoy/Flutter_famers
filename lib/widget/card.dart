import 'package:farmers_market/src/theme/base.dart';
import 'package:farmers_market/src/theme/color.dart';
import 'package:farmers_market/src/theme/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppCard extends StatelessWidget {
  final String productName;
  final String unitType;
  final int availableUnits;
  final double price;
  final String note;

  final formatCurrency = NumberFormat.simpleCurrency(locale: "fr");

  AppCard({
    @required this.productName,
    @required this.unitType,
    @required this.availableUnits,
    @required this.price,
    this.note = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: BaseStyles.listPadding,
      padding: BaseStyles.listPadding,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.bordertextfield, width: BaseStyles.borderWidth),
        borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
        boxShadow: BaseStyles.boxShadow,
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Image.asset(
                "assets/images/vegetables.png",
                height: 60.0,
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(productName, style: TextStyles.subtitle),
                  Text("${formatCurrency.format(price)}/$unitType",
                      style: TextStyles.body),
                  (availableUnits > 0)
                      ? Text("In stock", style: TextStyles.bodyGreen)
                      : Text("Currently unavailable",
                          style: TextStyles.bodyRed),
                ])
          ]),
          Text(note, style: TextStyles.body),
        ],
      ),
    );
  }
}
