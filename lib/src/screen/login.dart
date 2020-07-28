import 'dart:io';
import 'package:farmers_market/src/bloc/auth_bloc.dart';
import 'package:farmers_market/src/theme/base.dart';
import 'package:farmers_market/src/theme/text.dart';
import 'package:farmers_market/widget/button.dart';
import 'package:farmers_market/widget/social.dart';
import 'package:farmers_market/widget/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final authBloc = Provider.of<AuthBloc>(context);

    if (Platform.isIOS) {
      return CupertinoPageScaffold(child: pageBody(context,authBloc));
    } else {
      return Scaffold(body: pageBody(context,authBloc));
    }
  }

  Widget pageBody(BuildContext context, AuthBloc authBloc) {
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
        StreamBuilder<String>(
          stream: authBloc.email,
          builder: (context, snapshot) {
            return AppTextField(
              isIOS: Platform.isIOS,
              hintText: "Email",
              materialIcon: Icons.email,
              cupertinoIcon: CupertinoIcons.mail_solid,
              textInputType: TextInputType.emailAddress,
              errorText: snapshot.error,
              onChanged: authBloc.changeEmail,
            );
          }
        ),
        StreamBuilder<String>(
          stream: authBloc.password,
          builder: (context, snapshot) {
            return AppTextField(
              isIOS: Platform.isIOS,
              hintText: "Password",
              materialIcon: Icons.lock,
              cupertinoIcon: IconData(0xf4c9,
                  fontFamily: CupertinoIcons.iconFont,
                  fontPackage: CupertinoIcons.iconFontPackage),
              obscureText: true,
              errorText: snapshot.error,
              onChanged: authBloc.changePassword,
            );
          }
        ),
        AppButton(
          buttonText: "Login",
          buttonType: ButtonType.BorderTextfield,
        ),
        SizedBox(height: 6.0,),
        Center(
          child: Text(
            "or",
            style: TextStyles.suggestion,
          ),
        ),
        SizedBox(height: 6.0,),
        Padding(
          padding: BaseStyles.listPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppSocialButton(
                socialType: SocialType.Facebook,
              ),
              SizedBox(width: 15.0),
              AppSocialButton(
                socialType: SocialType.Google,
              ),
            ],
          ),
        ),
        Padding(
          padding: BaseStyles.listPadding,
          child: RichText(
            text: TextSpan(
              text: "New here? ",
              style: TextStyles.body,
              children: [
                TextSpan(
                  text: "Signup",
                  style: TextStyles.link,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Navigator.pushNamed(context, "/signup")
                )
              ]
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}