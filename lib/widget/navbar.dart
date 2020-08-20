import 'package:farmers_market/src/theme/color.dart';
import 'package:farmers_market/src/theme/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppNavbar {
  static CupertinoSliverNavigationBar cupertinoNavBar(
      {@required String title}) {
    return CupertinoSliverNavigationBar(
      largeTitle: Text(
        title,
        style: TextStyles.navTitle,
      ),
      backgroundColor: Colors.transparent,
      border: null,
    );
  }

  static SliverAppBar materialNavBar(
      {@required String title, TabBar tabBar, bool pinned,}) {
    return SliverAppBar(
      title: Text(
        title,
        style: TextStyles.navTitleMaterial,
      ),
      backgroundColor: AppColors.darkblue,
      bottom: tabBar,
      floating: true,
      pinned: (pinned == null) ? true : pinned,
      snap: true,
    );
  }
}
