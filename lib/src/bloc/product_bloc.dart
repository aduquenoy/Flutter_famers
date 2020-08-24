import 'dart:async';

import 'package:rxdart/subjects.dart';

class ProductBloc {
  final _productName = BehaviorSubject<String>();
  final _unitType = BehaviorSubject<String>();
  final _unitPrice = BehaviorSubject<String>();
  final _availableUnits = BehaviorSubject<String>();

  //Get
  Stream<String> get productName => _productName.stream.transform(validateProductName);
  Stream<String> get unitType => _unitType.stream;
  Stream<double> get unitPrice => _unitPrice.stream.transform(validateUnitPrice);
  Stream<int> get availableUnits => _availableUnits.stream.transform(validateAvailableUnit);

  //Set
  Function(String) get changeProductName => _productName.sink.add;
  Function(String) get changeUnitType => _unitType.sink.add;
  Function(String) get changeUnitPrice => _unitPrice.sink.add;
  Function(String) get changeAvailableUnits => _availableUnits.sink.add;

  dispose() {
    _productName.close();
    _unitType.close();
    _unitPrice.close();
    _availableUnits.close();
  }

  //Validator
  final validateUnitPrice = StreamTransformer<String, double>.fromHandlers(
      handleData: (unitPrice, sink) {
    try {
      sink.add(double.parse(unitPrice));
    } catch (error) {
      sink.addError("Must be a number");
    }
  });

  final validateAvailableUnit = StreamTransformer<String, int>.fromHandlers(
      handleData: (availableUnit, sink) {
    try {
      sink.add(int.parse(availableUnit));
    } catch (error) {
      sink.addError("Must be a whole number");
    }
  });

  final validateProductName = StreamTransformer<String, String>.fromHandlers(
      handleData: (productName, sink) {
    if(productName.length >= 3 && productName.length <= 20){
      sink.add(productName.trim());
    }else{
      if(productName.length < 3){
        sink.addError("3 characters minimum");
      }else{
        sink.addError("20 characters maximum");
      }
    }
  });
}
