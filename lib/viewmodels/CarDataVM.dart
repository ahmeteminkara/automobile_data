import 'package:automobile_data/models/Brands.dart';
import 'package:automobile_data/models/CarData.dart';
import 'package:automobile_data/models/Model.dart';
import 'package:automobile_data/services/WebService.dart';
import 'package:automobile_data/utils/enums.dart';
import 'package:flutter/material.dart';

class CarDataVM extends ChangeNotifier {
  ACTION action = ACTION.None;

  setAction(ACTION _action) {
    action = _action;
    notifyListeners();
  }

  List<CarData> listCarData = [];

  loadCarDataFromService(
    int year,
    Brand brand,
    Model model,
    String body,
    String traction,
    String fuel,
  ) async {
    listCarData.clear();
    setAction(ACTION.None);
    notifyListeners();
    setAction(ACTION.Loading);
    final List<CarData> result =
        await WebService.getFilters(year, brand, model, body, traction, fuel);
    listCarData = result;

    setAction(ACTION.Success);
    notifyListeners();
  }
}
