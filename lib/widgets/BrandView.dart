import 'package:automobile_data/viewmodels/BrandVM.dart';
import 'package:automobile_data/viewmodels/YearVM.dart';
import 'package:automobile_data/widgets/MyBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrandsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    YearVM yearVM = Provider.of<YearVM>(context);
    BrandVM brandVM = Provider.of<BrandVM>(context);

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
      trailing: Text(brandVM.selectedBrand.displayName),
      onTap: () {
        MyBottomSheet.show(context, generatorItem(context, brandVM));
      },
    );
  }

  List<Widget> generatorItem(BuildContext context, BrandVM brandVM) {
    return brandVM.brandsList.map((brand) {
      return ListTile(
        title: Text(brand.displayName),
        onTap: () {
          brandVM.setSelectedBrand(brand);
          Navigator.pop(context);
        },
      );
    }).toList();
  }
}
