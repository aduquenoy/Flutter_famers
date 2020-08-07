import 'dart:io';
import 'package:farmers_market/widget/navbar.dart';
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
      return Center(child: Scaffold(body:Text("Material")));
    }
  }
}