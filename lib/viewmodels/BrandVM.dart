import 'package:automobile_data/models/Brands.dart';
import 'package:automobile_data/services/WebService.dart';
import 'package:automobile_data/utils/log_print.dart';
import 'package:flutter/material.dart';

class BrandVM extends ChangeNotifier {
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
    selectedBrand = result.first;
    brandsList = result;
    notifyListeners();

    LogPrint.brandsComplate;
  }
}
