import 'package:automobile_data/models/Brands.dart';
import 'package:automobile_data/viewmodels/BrandVM.dart';
import 'package:automobile_data/viewmodels/ModelVM.dart';
import 'package:automobile_data/viewmodels/YearVM.dart';
import 'package:automobile_data/widgets/MyBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrandsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    YearVM yearVM = Provider.of<YearVM>(context);
    BrandVM brandVM = Provider.of<BrandVM>(context);
    ModelVM modelVM = Provider.of<ModelVM>(context);

    if (yearVM.yearList.isEmpty || yearVM.selectYear == yearVM.nullNumber) {
      return ListTile(
        title: Text("Brands"),
      );
    }

    if (brandVM.brandsList.isEmpty) {
      return ListTile(
        title: Text("Brands"),
        trailing: CircularProgressIndicator(),
      );
    }

    return ListTile(
      title: Text("Brands"),
      trailing: Text(brandVM.selectedBrand.id == brandVM.nullBrand.id
          ? "Plase selected brand"
          : brandVM.selectedBrand.displayName),
      onTap: () {
        MyBottomSheet.show(
            context, generatorItem(context, yearVM, brandVM, modelVM));
      },
    );
  }

  List<Widget> generatorItem(
      BuildContext context, YearVM yearVM, BrandVM brandVM, ModelVM modelVM) {
    List<Brand> tempList = [];

    tempList.addAll(brandVM.brandsList);
    tempList.insert(0, brandVM.nullBrand);

    return tempList.map((brand) {
      return ListTile(
        title: Text(brand.id == brandVM.nullBrand.id
            ? "Plase selected brand"
            : brand.displayName),
        onTap: () {
          if (brand.id != brandVM.nullBrand.id) {
          brandVM.setSelectedBrand(brand);
            modelVM.loadModelsFromService(
                yearVM.selectYear, brandVM.selectedBrand.id);
          }
          Navigator.pop(context);
        },
      );
    }).toList();
  }
}
