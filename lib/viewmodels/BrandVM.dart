import 'package:automobile_data/models/Brands.dart';
import 'package:automobile_data/services/WebService.dart';
import 'package:automobile_data/utils/log_print.dart';
import 'package:flutter/material.dart';

class BrandVM extends ChangeNotifier {
  BrandVM() {
    selectedBrand = nullBrand;
  }

  Brand get nullBrand => Brand(id: "---", displayName: "---", country: "---");

  List<Brand> brandsList = [];

  Brand selectedBrand;

  setSelectedBrand(Brand brand) {
    selectedBrand = brand;
    notifyListeners();
  }

  loadBrandsFromService(int year) async {
    LogPrint.brandsLoading;
    brandsList.clear();
    notifyListeners();
    final List<Brand> result = await WebService.getBrands(year);
    brandsList = result;
    notifyListeners();

    LogPrint.brandsComplate;
  }
}
