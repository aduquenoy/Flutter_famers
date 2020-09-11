import 'dart:async';
import 'dart:io';
import 'package:farmers_market/src/bloc/auth_bloc.dart';
import 'package:farmers_market/widget/navbar.dart';
import 'package:farmers_market/widget/product_customer.dart';
import 'package:farmers_market/widget/customer_scafold.dart';
import 'package:farmers_market/widget/profile_customer.dart';
import 'package:farmers_market/widget/shopping_bag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Customer extends StatefulWidget {

  final String marketId;

  Customer({@required this.marketId});

  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {

  StreamSubscription _userSubscription;
  
  @override
  void initState() {
    Future.delayed(Duration.zero, (){
      var authBloc = Provider.of<AuthBloc>(context, listen: false);
      
      _userSubscription = authBloc.user.listen((user) {
        if(user==null) Navigator.of(context).pushNamedAndRemoveUntil("/login", (route) => false);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _userSubscription.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return CupertinoPageScaffold(child: NestedScrollView(headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
        return <Widget> [
          AppNavbar.cupertinoNavBar(title: "Customer name", context: context)
        ];
      }, body: Center(child: CustomerScaffold.cupertinoTabScaffold)));
    }else{
      return DefaultTabController(length: 3, child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget> [
              AppNavbar.materialNavBar(title: "Customer name", tabBar: CustomerScaffold.customerTabBar)
            ];
          },
          body: TabBarView(children: <Widget> [
            ProductsCustomer(),
            ShoppingBag(),
            ProfileCustomer(),
          ]),
        )
      ));
    }
  }
}