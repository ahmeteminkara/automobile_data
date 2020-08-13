import 'package:automobile_data/models/FilterOptions.dart';
import 'package:automobile_data/utils/enums.dart';
import 'package:flutter/material.dart';

class FilterOptionsVM extends ChangeNotifier {
  FilterOptions _filterOptions = FilterOptions(
    carBody: BODY.Sedan,
    carTraction: TRACTION.Front,
    carFuelType: FUEL.Diesel,
  );

  BODY get body => _filterOptions.carBody;
  String get bodyString => enumToString(body);
  TRACTION get traction => _filterOptions.carTraction;
  String get tractionString => enumToString(traction);
  FUEL get fuel => _filterOptions.carFuelType;
  String get fuelString => enumToString(fuel);

  setFilterBody(BODY body) {
    _filterOptions.carBody = body;
    notifyListeners();
  }

  setFilterTraction(TRACTION traction) {
    _filterOptions.carTraction = traction;
    notifyListeners();
  }

  setFilterFuel(FUEL fuel) {
    _filterOptions.carFuelType = fuel;
    notifyListeners();
  }

   enumToString(item) =>
      item.toString().substring(item.toString().indexOf('.') + 1);
}
