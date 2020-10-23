import 'dart:io';
//import 'package:farmers_market/src/app.dart';
import 'package:farmers_market/src/bloc/auth_bloc.dart';
import 'package:farmers_market/src/bloc/vendor_bloc.dart';
import 'package:farmers_market/src/model/vendor.dart';
import 'package:farmers_market/src/theme/base.dart';
import 'package:farmers_market/src/theme/color.dart';
import 'package:farmers_market/src/theme/text.dart';
import 'package:farmers_market/widget/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    var authBloc = Provider.of<AuthBloc>(context);
    final vendorBloc = Provider.of<VendorBloc>(context);

    return StreamBuilder<Vendor>(
        stream: vendorBloc.vendor,
        builder: (context, snapshot) {
          return Column(
            children: [
              Expanded(
                child: (snapshot.data != null)
                    ? ListView(
                        children: [
                          Padding(
                            padding: BaseStyles.listPadding,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: ClipRRect(
                                    child:
                                        Image.network(snapshot.data.imageUrl),
                                    borderRadius: BorderRadius.circular(
                                      BaseStyles.borderRadius,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(snapshot.data.name,
                                          style: TextStyles.listTitle),
                                      Text(snapshot.data.description,
                                          style: TextStyles.body),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AppButton(
                            buttonText: "Edit vendor profile",
                            buttonType: ButtonType.LightBlue,
                            onPressed: () => Navigator.of(context)
                                .pushNamed("/editvendor/${authBloc.userId}"),
                          ),
                        ],
                      )
                    : Center(
                        child: AppButton(
                          buttonText: "Create a vendor profile",
                          buttonType: ButtonType.LightBlue,
                          onPressed: () =>
                              Navigator.of(context).pushNamed("/editvendor"),
                        ),
                      ),
              ),
              Container(
                height: 50.0,
                child: (Platform.isIOS)
                    ? CupertinoButton(
                        child: Text(
                          "Logout",
                          style: TextStyle(color: AppColors.bordertextfield),
                        ),
                        onPressed: () => authBloc.logout(),
                      )
                    : FlatButton(
                        onPressed: () => authBloc.logout(),
                        child: Text(
                          "Logout",
                          style: TextStyle(color: AppColors.bordertextfield),
                        ),
                      ),
              ),
            ],
          );
        });
  }
}
