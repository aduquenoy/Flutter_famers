import 'dart:async';
import 'dart:io';
import 'package:farmers_market/src/bloc/auth_bloc.dart';
import 'package:farmers_market/src/bloc/vendor_bloc.dart';
import 'package:farmers_market/src/model/vendor.dart';
import 'package:farmers_market/src/theme/base.dart';
import 'package:farmers_market/src/theme/color.dart';
import 'package:farmers_market/src/theme/text.dart';
import 'package:farmers_market/widget/button.dart';
import 'package:farmers_market/widget/sliver_scafold.dart';
import 'package:farmers_market/widget/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EditVendor extends StatefulWidget {
  final String vendorId;

  const EditVendor({this.vendorId});

  @override
  _EditVendorState createState() => _EditVendorState();
}

class _EditVendorState extends State<EditVendor> {
  StreamSubscription _savedSubscription;

  @override
  void initState() {
    var vendorBloc = Provider.of<VendorBloc>(context, listen: false);

    _savedSubscription = vendorBloc.vendorSaved.listen((saved) {
      if (saved != null && saved == true && context != null) {
        Fluttertoast.showToast(
            msg: "Vendor saved",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: AppColors.lightblue,
            textColor: Colors.white,
            fontSize: 16.0);

        Navigator.of(context).pop();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _savedSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var vendorBloc = Provider.of<VendorBloc>(context);
    var authBloc = Provider.of<AuthBloc>(context);

    return StreamBuilder<Vendor>(
      stream: vendorBloc.vendor,
      builder: (context, snapshot) {
        if (!snapshot.hasData && widget.vendorId != null) {
          return Scaffold(
            body: Center(
                child: (Platform.isIOS)
                    ? CupertinoActivityIndicator()
                    : CircularProgressIndicator()),
          );
        }

        Vendor vendor = snapshot.data;

        if (vendor != null) {
          loadValues(vendorBloc, vendor, authBloc.userId);
        } else {
          loadValues(vendorBloc, null, authBloc.userId);
        }

        return (Platform.isIOS)
            ? AppSliverScaffold.cupertinoSliverScaffold(
                navTitle: "",
                pageBody: pageBody(true, vendorBloc, context, vendor),
                context: context)
            : AppSliverScaffold.materialSliverScaffold(
                navTitle: "",
                pageBody: pageBody(false, vendorBloc, context, vendor),
                context: context);
      },
    );
  }

  Widget pageBody(bool isIOS, VendorBloc vendorBloc, BuildContext context,
      Vendor existingVendor) {
    var pageLabel = (existingVendor != null) ? "Edit profile" : "Add profile";

    return ListView(
      children: <Widget>[
        Text(
          pageLabel,
          style: TextStyles.subtitle,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: BaseStyles.listPadding,
          child: Divider(
            color: AppColors.darkblue,
          ),
        ),
        StreamBuilder<String>(
            stream: vendorBloc.name,
            builder: (context, snapshot) {
              return AppTextField(
                hintText: "Vendor name",
                cupertinoIcon: FontAwesomeIcons.shoppingBasket,
                materialIcon: FontAwesomeIcons.shoppingBasket,
                isIOS: isIOS,
                errorText: snapshot.error,
                initialText:
                    (existingVendor != null) ? existingVendor.name : null,
                onChanged: vendorBloc.changeName,
              );
            }),
        StreamBuilder<String>(
            stream: vendorBloc.description,
            builder: (context, snapshot) {
              return AppTextField(
                hintText: "Vendor description",
                cupertinoIcon: FontAwesomeIcons.shoppingBasket,
                materialIcon: FontAwesomeIcons.shoppingBasket,
                isIOS: isIOS,
                errorText: snapshot.error,
                initialText: (existingVendor != null)
                    ? existingVendor.description
                    : null,
                onChanged: vendorBloc.changeDescription,
              );
            }),
        StreamBuilder<bool>(
          stream: vendorBloc.isUploading,
          builder: (context, snapshot) {
            return (!snapshot.hasData || snapshot.data == false)
                ? Container()
                : Center(
                    child: (Platform.isIOS)
                        ? CupertinoActivityIndicator()
                        : CircularProgressIndicator());
          },
        ),
        StreamBuilder<String>(
            stream: vendorBloc.imageUrl,
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data == "")
                return AppButton(
                  buttonText: "Add image",
                  buttonType: ButtonType.BorderTextfield,
                  onPressed: vendorBloc.pickImage,
                );

              return Column(children: <Widget>[
                Padding(
                  padding: BaseStyles.listPadding,
                  child: Image.network(snapshot.data),
                ),
                AppButton(
                  buttonText: "Change image",
                  buttonType: ButtonType.BorderTextfield,
                  onPressed: vendorBloc.pickImage,
                ),
              ]);
            }),
        StreamBuilder<bool>(
            stream: vendorBloc.isValid,
            builder: (context, snapshot) {
              return AppButton(
                buttonText: "Save profile",
                buttonType: (snapshot.data == true)
                    ? ButtonType.DarkBlue
                    : ButtonType.Disabled,
                onPressed: vendorBloc.saveVendor,
              );
            }),
      ],
    );
  }
}

void loadValues(VendorBloc vendorBloc, Vendor vendor, String vendorId) {
  vendorBloc.changeVendorId(vendorId);

  if (vendor != null) {
    // Edit
    vendorBloc.changeName(vendor.name);
    vendorBloc.changeDescription(vendor.description);
    vendorBloc.changeImageUrl(vendor.imageUrl ?? "");
  } else {
    // Acdd
    vendorBloc.changeName(null);
    vendorBloc.changeDescription(null);
    vendorBloc.changeImageUrl("");
  }
}
