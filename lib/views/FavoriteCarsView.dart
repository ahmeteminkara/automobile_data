import 'package:automobile_data/models/CarData.dart';
import 'package:automobile_data/viewmodels/FavoriteCarsVM.dart';
import 'package:automobile_data/widgets/CarDataListGenerator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteCarsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FavoriteCarsVM favoriteCarsVM = Provider.of<FavoriteCarsVM>(context);

    List<CarData> list = [];

    favoriteCarsVM.favoriteList.forEach((String modelId, CarData carData) {
      list.add(carData);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Favoriler"),
      ),
      body: CarDataListGenerator(list: list),
    );
  }
}
