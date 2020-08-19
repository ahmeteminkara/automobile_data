import 'package:automobile_data/viewmodels/BrandVM.dart';
import 'package:automobile_data/viewmodels/ModelVM.dart';
import 'package:automobile_data/views/MyBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModelView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BrandVM brandVM = Provider.of<BrandVM>(context);
    ModelVM modelVM = Provider.of<ModelVM>(context);

    if (brandVM.brandsList.isEmpty &&
        brandVM.selectedBrand.id == brandVM.nullBrand.id) {
      return ListTile(
        title: Text("Models"),
      );
    }

    if (modelVM.modelList.isEmpty &&
        brandVM.selectedBrand.id == brandVM.nullBrand.id) {
      return ListTile(
        title: Text("Models"),
      );
    }

    if (modelVM.modelList.isEmpty) {
      return ListTile(
        title: Text("Models"),
        trailing: CircularProgressIndicator(),
      );
    }

    return ListTile(
      title: Text("Models"),
      trailing: Text(modelVM.selectedModel.modelName),
      onTap: () {
        MyBottomSheet.show(context, generatorItem(context, modelVM));
      },
    );
  }

  List<Widget> generatorItem(BuildContext context, ModelVM modelVM) {
    return modelVM.modelList.map((model) {
      return ListTile(
        title: Text(model.modelName),
        onTap: () {
          modelVM.setSelectedModel(model);
          Navigator.pop(context);
        },
      );
    }).toList();
  }
}
