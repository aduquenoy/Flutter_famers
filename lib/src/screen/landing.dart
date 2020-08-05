import 'dart:io';
import 'package:farmers_market/widget/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(child: pageBody(context));
    } else {
      return Scaffold(body: pageBody(context));
    }
  }
}

Widget pageBody(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      AppButton(
        buttonText: "Vendor page",
        buttonType: ButtonType.BorderTextfield,
        onPressed: ()=>Navigator.pushNamed(context, "/vendor"),
      ),
    ],
  );
}
