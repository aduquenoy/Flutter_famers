import 'dart:io';
import 'package:date_format/date_format.dart';
import 'package:farmers_market/src/bloc/customer_bloc.dart';
import 'package:farmers_market/src/model/market.dart';
import 'package:farmers_market/src/theme/base.dart';
import 'package:farmers_market/src/theme/color.dart';
import 'package:farmers_market/src/theme/text.dart';
import 'package:farmers_market/widget/list_tile.dart';
import 'package:farmers_market/widget/sliver_scafold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var customerBloc = Provider.of<CustomerBloc>(context);

    if (Platform.isIOS) {
      return AppSliverScaffold.cupertinoSliverScaffold(
          navTitle: "Upcoming markets",
          pageBody: Scaffold(body: pageBody(context, customerBloc)));
    } else {
      return AppSliverScaffold.materialSliverScaffold(
          navTitle: "Upcoming markets",
          pageBody: pageBody(context, customerBloc));
    }
  }
}

Widget pageBody(BuildContext context, CustomerBloc customerBloc) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Flexible(
        child: Stack(
          children: [
            Positioned(
              child: Image.asset("assets/images/vegetable.jpg"),
              top: -10.0,
            ),
            Positioned(
              bottom: 10.0,
              right: 10.0,
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.lightblue,
                      borderRadius:
                          BorderRadius.circular(BaseStyles.borderRadius)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Text("Vendor page", style: TextStyles.buttonTextLight),
                  ),
                ),
                onTap: () => Navigator.of(context).pushNamed("/vendor"),
              ),
            )
          ],
        ),
        flex: 2,
      ),
      Flexible(
        child: StreamBuilder<List<Market>>(
            stream: customerBloc.fetchUpcomingMarkets,
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: (Platform.isIOS)
                      ? CupertinoActivityIndicator()
                      : CircularProgressIndicator(),
                );

              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  var market = snapshot.data[index];
                  var dateEnd = DateTime.parse(market.dateEnd);

                  return AppListTile(
                    month: formatDate(dateEnd, ["M"]),
                    date: formatDate(dateEnd, ["d"]),
                    title: market.title,
                    location: "${market.location.name}, ${market.location.address}, ${market.location.city}, ${market.location.state}",
                    acceptingOrders: market.acceptingOrders,
                    marketId: market.marketId,
                  );
                },
              );
            }),
        flex: 3,
      )
    ],
  );
}
