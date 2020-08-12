import 'package:automobile_data/viewmodels/BrandVM.dart';
import 'package:automobile_data/viewmodels/YearVM.dart';
import 'package:automobile_data/widgets/MyBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YearView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    YearVM yearVM = Provider.of<YearVM>(context);

    if (yearVM.yearList.isEmpty) {
      return ListTile(
        title: Text("Years"),
        trailing: CircularProgressIndicator(),
      );
    }

    return generatorView(context, yearVM);
  }

  generatorView(BuildContext context, YearVM yearVM) {
    return ListTile(
      title: Text("Years"),
      trailing: pleaseText(yearVM, yearVM.selectYear),
      onTap: () {
        MyBottomSheet.show(context, generatorItem(context, yearVM));
      },
    );
  }

  pleaseText(yearVM, number) => Text(
      number == yearVM.nullNumber ? "Plase selected year" : number.toString());

  List<Widget> generatorItem(BuildContext context, YearVM yearVM) {
    BrandVM brandVM = Provider.of<BrandVM>(context);

    List<int> temp = [];

    temp.addAll(yearVM.yearList);
    temp.insert(0, yearVM.nullNumber);

    return temp.map((year) {
      return ListTile(
        title: pleaseText(yearVM, year),
        onTap: () {
          yearVM.setSelectedYear(year);
          if (yearVM.nullNumber != year) brandVM.loadBrandsFromService(year);
          Navigator.pop(context);
        },
      );
    }).toList();
  }
}
