import 'package:automobile_data/models/CarData.dart';
import 'package:automobile_data/viewmodels/FavoriteCarsVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarFavoriteButton extends StatelessWidget {
  final CarData carData;

  CarFavoriteButton(this.carData);

  @override
  Widget build(BuildContext context) {
    FavoriteCarsVM favoriteCarsVM = Provider.of<FavoriteCarsVM>(context);

    if (favoriteCarsVM.favoriteList.containsKey(carData.modelId)) {
      return IconButton(
        icon: Icon(Icons.star, color: Colors.yellow),
        onPressed: () =>
            favoriteCarsVM.removeItemFavoriteList(carData.modelId, carData),
      );
    } else {
      return IconButton(
        icon: Icon(Icons.star_border),
        onPressed: () =>
            favoriteCarsVM.addItemFavoriteList(carData.modelId, carData),
      );
    }
  }
}
