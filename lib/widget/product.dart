import 'dart:io';
import 'package:cupertino_toolbar/cupertino_toolbar.dart';
import 'package:farmers_market/src/theme/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: CupertinoToolbar(
          items: <CupertinoToolbarItem>[
            CupertinoToolbarItem(
              icon: CupertinoIcons.add_circled,
              onPressed: () => Navigator.of(context).pushNamed("/editproduct"),
            ),
          ],
          body: pageBody(),
        ),
      );
    } else {
      return Scaffold(
        body: pageBody(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.bordertextfield,
          child: Icon(Icons.add),
          onPressed: () => Navigator.of(context).pushNamed("/editproduct"),
        ),
      );
    }
  }
}

Widget pageBody() {
  return Center(child: Text("Products"));
}
