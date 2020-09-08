import 'package:farmers_market/src/model/market.dart';
import 'package:farmers_market/src/service/firestore_service.dart';

class CustomerBloc{
  final db = FirestoreService();

  //Get
  Stream<List<Market>> get fetchUpcomingMarkets => db.fetchUpcomingMarkets();

  dispose(){}
}