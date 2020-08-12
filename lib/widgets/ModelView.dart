import 'package:automobile_data/viewmodels/ModelVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModelView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ModelVM modelVM = Provider.of<ModelVM>(context);

    return ListTile(
      title: Text("Models"),
      trailing: Text(modelVM.modelList.length.toString()),
      onTap: () {
        //MyBottomSheet.show(context, generatorItem(context, brandVM));
      },
    );
  }
}
