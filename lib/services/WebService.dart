import 'dart:convert';

import 'package:automobile_data/models/Brands.dart';
import 'package:automobile_data/models/CarData.dart';
import 'package:automobile_data/models/Model.dart';
import 'package:http/http.dart' as http;

import 'package:automobile_data/models/Year.dart';

class WebService {
  static Future<Year> getMinMaxYear() async {
    final url = "https://www.carqueryapi.com/api/0.3/?cmd=getYears";

    print(url);

    final response = await http.get(url);

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
    final url = "https://www.carqueryapi.com/api/0.3/?cmd=getMakes&year=$year";

    print(url);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final brandsJson = body["Makes"];

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

  static Future<List<Model>> getModels(int year, String brandId) async {
    final url =
        "https://www.carqueryapi.com/api/0.3/?cmd=getModels&make=$brandId&year=$year";

    print(url);

    final response = await http.get(url);

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

  static Future<List<CarData>> getFilters(int year, Brand brand, Model model,
      String body, String traction, String fuel) async {
    List<String> url = [];

    url.add("https://www.carqueryapi.com/api/0.3/?cmd=getTrims");
    url.add("year=$year");
    url.add("make=${brand.id}");
    url.add("model=${model.modelName}");

    if (body != "All") url.add("body=$body");
    if (traction != "All") url.add("drive=$traction");
    if (fuel != "All") url.add("fuel_type=$fuel");

    final String cleanURL = Uri.encodeFull(url.join("&"));

    print("cleanURL : $cleanURL");

    final response = await http.get(cleanURL);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["Trims"];

      List<CarData> list = [];

      json.forEach((modelItem) {
        list.add(CarData(
          modelId: modelItem["model_id"],
          modelName: modelItem["model_name"],
          modelYear: modelItem["model_year"],
          modelBody: modelItem["model_body"],
          modelEngineCC: modelItem["model_engine_cc"],
          modelEngineCyl: modelItem["model_engine_cyl"],
          modelEngineType: modelItem["model_engine_type"],
          modelEnginePowerPS: modelItem["model_engine_power_ps"],
          modelEnginePowerRpm: modelItem["model_engine_power_rpm"],
          modelEngineTorqueNm: modelItem["model_engine_torque_nm"],
          modelEngineTorqueRpm: modelItem["model_engine_torque_rpm"],
          modelEnginefuel: modelItem["model_engine_fuel"],
          modelTopSpeedKph: modelItem["model_top_speed_kph"],
          model0To100Kph: modelItem["model_0_to_100_kph"],
          modelTransmissionType: modelItem["model_transmission_type"],
          modelWeightKg: modelItem["model_weight_kg"],
          modelLengthMm: modelItem["model_length_mm"],
          modelWidthMm: modelItem["model_width_mm"],
          modelHeightMm: modelItem["model_height_mm"],
          modelWheelbaseMm: modelItem["model_wheelbase_mm"],
          modellKmMixed: modelItem["model_lkm_mixed"],
          modelEngineL: modelItem["model_engine_l"],
          makeDisplay: modelItem["make_display"],
          makeCountry: modelItem["make_country"],
          modelTrim: modelItem["model_trim"],
          modelDoors: modelItem["model_doors"],
        ));
      });

      return list;
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
