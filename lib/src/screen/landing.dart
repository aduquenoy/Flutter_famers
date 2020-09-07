import 'dart:io';
import 'package:farmers_market/src/theme/base.dart';
import 'package:farmers_market/src/theme/color.dart';
import 'package:farmers_market/src/theme/text.dart';
import 'package:farmers_market/widget/list_tile.dart';
import 'package:farmers_market/widget/sliver_scafold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return AppSliverScaffold.cupertinoSliverScaffold(
          navTitle: "Upcoming markets",
          pageBody: Scaffold(body: pageBody(context)));
    } else {
      return AppSliverScaffold.materialSliverScaffold(
          navTitle: "Upcoming markets", pageBody: pageBody(context));
    }
  }
}

Widget pageBody(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Flexible(
        child: Stack(
          children: [
            Positioned(
              child: Image.asset("assets/images/vegetable.jpg"),
              top: -10.0,
            ),
            Positioned(
              bottom: 10.0,
              right: 10.0,
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.lightblue,
                      borderRadius:
                          BorderRadius.circular(BaseStyles.borderRadius)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Text("Vendor page", style: TextStyles.buttonTextLight),
                  ),
                ),
                onTap: () => Navigator.of(context).pushNamed("/vendor"),
              ),
            )
          ],
        ),
        flex: 2,
      ),
      Flexible(
        child: ListView(
          children: <Widget>[
            AppListTile(
              date: "4",
              title: "Anytown Farmer",
              location: "1 main street",
              month: "Oct",
              acceptingOrders: true,
            ),
            AppListTile(
                date: "4",
                title: "Anytown Farmer",
                location: "1 main street",
                month: "Oct"),
            AppListTile(
                date: "4",
                title: "Anytown Farmer",
                location: "1 main street",
                month: "Oct"),
            AppListTile(
                date: "4",
                title: "Anytown Farmer",
                location: "1 main street",
                month: "Oct"),
          ],
        ),
        flex: 3,
      )
    ],
  );
}
