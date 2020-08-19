/*
 */
import 'dart:convert';

import 'package:automobile_data/models/CarData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSharedPref {
  static String get _favoriteListKey => "local_key_favorite_list";

  static Future<bool> setFavoriteList(Map<String, CarData> list) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> value = [];
      list.forEach((String modelId, CarData carData) {
        value.add(jsonEncode(carData.toJson()));
      });
      prefs.setStringList(_favoriteListKey, value);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<List<CarData>> getFavoriteList() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      List<CarData> list = [];

      List<String> prefStrList = prefs.getStringList(_favoriteListKey);

      prefStrList.forEach((String strData) {
        list.add(CarData.fromJson(jsonDecode(strData)));
      });

      return list;
    } catch (e) {
      return [];
    }
  }
}
