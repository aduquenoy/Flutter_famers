import 'package:flutter/foundation.dart';

import 'location.dart';

class Market {
  final String title;
  final String dateBegin;
  final String dateEnd;
  final Location location;
  final bool acceptingOrders;
  final String marketId;

  Market(
      {@required this.title,
      @required this.dateBegin,
      @required this.dateEnd,
      @required this.location,
      this.acceptingOrders = false,
      @required this.marketId});

  Market.fromFirestore(Map<String, dynamic> firestore)
      : dateBegin = firestore["dateBegin"],
        dateEnd = firestore["dateEnd"],
        title = firestore["title"],
        location = Location.fromFirestore(firestore["location"]),
        acceptingOrders = firestore["acceptingOrders"],
        marketId = firestore["marketId"];
}
