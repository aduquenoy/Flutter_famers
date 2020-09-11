import 'package:farmers_market/src/theme/color.dart';
import 'package:farmers_market/src/theme/tabbar.dart';
import 'package:farmers_market/widget/product_customer.dart';
import 'package:farmers_market/widget/profile_customer.dart';
import 'package:farmers_market/widget/shopping_bag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

abstract class CustomerScaffold{

  static CupertinoTabScaffold get cupertinoTabScaffold{
    return CupertinoTabScaffold(tabBar: _cupertinoTabBar, tabBuilder: (context, index){
      return _pageSelection(index);
    });
  }

  static get _cupertinoTabBar{
    return CupertinoTabBar(backgroundColor: AppColors.darkblue, items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.create), title: Text("Products")),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart), title: Text("Orders")),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), title: Text("Profile"))
    ],);
  }

  static TabBar get customerTabBar{
    return TabBar(
      unselectedLabelColor: TabBarStyles.unselectedLabelColor,
      labelColor: TabBarStyles.labelColor,
      indicatorColor: TabBarStyles.indicatorColor,
      tabs: <Widget> [
      Tab(icon: Icon(Icons.list),),
      Tab(icon: Icon(FontAwesomeIcons.shoppingBag),),
      Tab(icon: Icon(Icons.person),),
    ]);
  }

  static Widget _pageSelection(int index){
    if(index == 0){
      return ProductsCustomer();
    }
    if(index == 1){
      return ShoppingBag();
    }
    return ProfileCustomer();
  }
}