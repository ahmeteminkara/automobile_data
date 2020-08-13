import 'package:automobile_data/models/Model.dart';
import 'package:automobile_data/services/WebService.dart';
import 'package:automobile_data/utils/log_print.dart';
import 'package:flutter/material.dart';

class ModelVM extends ChangeNotifier {
  ModelVM() {
    selectedModel = null;
    notifyListeners();
  }

  List<Model> modelList = [];

  Model selectedModel;

  setSelectedModel(Model model) {
    selectedModel = model;
    notifyListeners();
  }

  loadModelsFromService(int year, String brandId) async {
    LogPrint.modelsLoading;
    selectedModel = null;
    notifyListeners();
    modelList.clear();
    notifyListeners();
    final List<Model> result = await WebService.getModels(year, brandId);
    setSelectedModel(result.first);
    modelList = result;
    notifyListeners();

    LogPrint.modelsComplate;
  }
}
