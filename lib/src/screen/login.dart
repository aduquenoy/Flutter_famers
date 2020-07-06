import 'dart:io';
import 'package:farmers_market/widget/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(child: pageBody(context));
    } else {
      return Scaffold(body: pageBody(context));
    }
  }

  Widget pageBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0.0), // Pour coller l'image au top de l'ecran
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .2,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/top_bg.png"),
                fit: BoxFit.fill),
          ),
        ),
        Container(
          height: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
            ),
          ),
        ),
        AppTextField(
          isIOS: Platform.isIOS,
          hintText: "Email",
          materialIcon: Icons.email,
          cupertinoIcon: CupertinoIcons.mail_solid,
          textInputType: TextInputType.emailAddress,
        ),
        AppTextField(
          isIOS: Platform.isIOS,
          hintText: "Password",
          materialIcon: Icons.lock,
          cupertinoIcon: IconData(0xf4c9,fontFamily: CupertinoIcons.iconFont,fontPackage: CupertinoIcons.iconFontPackage),
          obscureText: true,
        ),
      ],
    );
  }
}