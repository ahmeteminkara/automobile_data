import 'package:automobile_data/models/Model.dart';
import 'package:automobile_data/services/WebService.dart';
import 'package:automobile_data/utils/log_print.dart';
import 'package:flutter/material.dart';

class ModelVM extends ChangeNotifier {
  List<Model> modelList = [];

  Model selectedModel;

  setSelectedModel(Model model) {
    selectedModel = model;
    notifyListeners();
  }

  loadBrandsFromService(String brandId) async {
    LogPrint.modelsLoading;
    modelList.clear();
    notifyListeners();
    final List<Model> result = await WebService.getModels(brandId);
    modelList = result;
    notifyListeners();

    LogPrint.modelsComplate;
  }
}
