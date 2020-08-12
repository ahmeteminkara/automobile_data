import 'dart:convert';

import 'package:automobile_data/models/Brands.dart';
import 'package:automobile_data/models/Model.dart';
import 'package:http/http.dart' as http;

import 'package:automobile_data/models/Year.dart';
import 'package:automobile_data/utils/constants.dart';

class WebService {
  static Future<Year> getMinMaxYear() async {
    final response = await http.get(Constants.apiYearUrl);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final yearsJson = body["Years"];

      int minYear = int.parse(yearsJson["min_year"]);
      int maxYear = int.parse(yearsJson["max_year"]);

      return Year(minYear, maxYear);
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  static Future<List<Brand>> getBrands(int year) async {
    final response = await http
        .get("https://www.carqueryapi.com/api/0.3/?cmd=getMakes&year=$year");

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable brandsJson = body["Makes"];

      List<Brand> list = [];

      brandsJson.forEach((brands) {
        list.add(Brand(
          id: brands["make_id"],
          displayName: brands["make_display"],
          country: brands["make_country"],
        ));
      });

      return list;
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  static Future<List<Model>> getModels(String brandId) async {
    final response = await http.get(
        "https://www.carqueryapi.com/api/0.3/?cmd=getModels&make=$brandId");

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["Models"];

      List<Model> list = [];

      json.forEach((modelItem) {
        list.add(Model(
          modelItem["model_name"],
          modelItem["model_make_id"],
        ));
      });

      return list;
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
