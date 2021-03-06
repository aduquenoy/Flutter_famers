import 'package:farmers_market/src/theme/color.dart';
import 'package:farmers_market/src/theme/tabbar.dart';
import 'package:farmers_market/widget/order.dart';
import 'package:farmers_market/widget/product.dart';
import 'package:farmers_market/widget/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class VendorScaffold{

  static CupertinoTabScaffold get cupertinoTabScaffold{
    return CupertinoTabScaffold(tabBar: _cupertinoTabBar, tabBuilder: (context, index){
      return _pageSelection(index);
    });
  }

  static get _cupertinoTabBar{
    return CupertinoTabBar(backgroundColor: AppColors.darkblue, items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.create), label: "Products"),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart), label: "Orders"),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: "Profile")
    ],);
  }

  static TabBar get vendorTabBar{
    return TabBar(
      unselectedLabelColor: TabBarStyles.unselectedLabelColor,
      labelColor: TabBarStyles.labelColor,
      indicatorColor: TabBarStyles.indicatorColor,
      tabs: <Widget> [
      Tab(icon: Icon(Icons.list),),
      Tab(icon: Icon(Icons.shopping_cart),),
      Tab(icon: Icon(Icons.person),),
    ]);
  }

  static Widget _pageSelection(int index){
    if(index == 0){
      return Products();
    }
    if(index == 1){
      return Orders();
    }
    return Profiles();
  }
}