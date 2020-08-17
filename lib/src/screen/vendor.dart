import 'dart:io';
import 'package:farmers_market/widget/navbar.dart';
import 'package:farmers_market/widget/order.dart';
import 'package:farmers_market/widget/product.dart';
import 'package:farmers_market/widget/profile.dart';
import 'package:farmers_market/widget/vendor_scafold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return CupertinoPageScaffold(child: NestedScrollView(headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
        return <Widget> [
          AppNavbar.cupertinoNavBar(title: "Vendor name", context: context)
        ];
      }, body: Center(child: VendorScaffold.cupertinoTabScaffold)));
    }else{
      return DefaultTabController(length: 3, child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget> [
              AppNavbar.materialNavBar(title: "Vendor name", tabBar: VendorScaffold.vendorTabBar)
            ];
          },
          body: TabBarView(children: <Widget> [
            Products(),
            Orders(),
            Profiles(),
          ]),
        )
      ));
    }
  }
}