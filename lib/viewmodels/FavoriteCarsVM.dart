import 'package:automobile_data/models/CarData.dart';
import 'package:automobile_data/services/LocalSharedPref.dart';
import 'package:flutter/material.dart';

class FavoriteCarsVM extends ChangeNotifier {
  Map<String, CarData> favoriteList = Map<String, CarData>();

  FavoriteCarsVM() {
    loadData();
  }
  loadData() async {
    List<CarData> list = await LocalSharedPref.getFavoriteList();

    list.forEach((CarData item) {
      addItemFavoriteList(item.modelId, item);
    });
  }

  addItemFavoriteList(String modelId, CarData carData) {
    try {
      favoriteList[modelId] = carData;
      LocalSharedPref.setFavoriteList(favoriteList);
      notifyListeners();
    } catch (e) {}
  }

  removeItemFavoriteList(String modelId, CarData carData) {
    if (favoriteList.containsKey(modelId)) {
      favoriteList.remove(modelId);
    }
    LocalSharedPref.setFavoriteList(favoriteList);
    notifyListeners();
  }
}
