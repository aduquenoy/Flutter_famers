import 'dart:io';
//import 'package:farmers_market/src/bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class Profiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(child: pageBody(context));
    } else {
      return pageBody(context);
    }
  }

  Widget pageBody(BuildContext context) {
    //var authBloc = Provider.of<AuthBloc>(context);
    /*return Center(
      child: (Platform.isIOS)
          ? CupertinoButton(
              child: Text("Logout"),
              onPressed: () => authBloc.logout(),
            )
          : FlatButton(
              onPressed: () => authBloc.logout(),
              child: Text("Logout"),
            ),
    );*/

    return Center(
      child: (Platform.isIOS)
          ? CupertinoButton(
              child: Text("Add"),
              onPressed: () => Navigator.of(context).pushNamed("/editvendor"),
            )
          : FlatButton(
              onPressed: () => Navigator.of(context).pushNamed("/editvendor"),
              child: Text("Add"),
            ),
    );
  }
}
