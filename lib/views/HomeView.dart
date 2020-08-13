import 'package:automobile_data/utils/enums.dart';
import 'package:automobile_data/viewmodels/BrandVM.dart';
import 'package:automobile_data/viewmodels/CarDataVM.dart';
import 'package:automobile_data/viewmodels/FilterOptionsVM.dart';
import 'package:automobile_data/viewmodels/ModelVM.dart';
import 'package:automobile_data/viewmodels/YearVM.dart';
import 'package:automobile_data/views/CarDataList.dart';
import 'package:automobile_data/widgets/AppBarThemeButton.dart';
import 'package:automobile_data/widgets/BrandView.dart';
import 'package:automobile_data/widgets/FilterOptionsView.dart';
import 'package:automobile_data/widgets/ModelView.dart';
import 'package:automobile_data/widgets/YearView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  get _appBar => AppBar(
        centerTitle: true,
        title: Text("Automobile Data"),
        actions: <Widget>[AppBarThemeButton()],
      );

  get _body => ListView.separated(
        itemCount: _listChlid.length,
        itemBuilder: (ctx, index) => _listChlid.elementAt(index),
        separatorBuilder: (ctx, index) => Divider(),
      );

  List<Widget> get _listChlid => [
        YearView(),
        BrandsView(),
        ModelView(),
        FilterOptionsView(),
      ];

  @override
  Widget build(BuildContext context) {
    YearVM yearVM = Provider.of<YearVM>(context);
    BrandVM brandVM = Provider.of<BrandVM>(context);
    ModelVM modelVM = Provider.of<ModelVM>(context);
    FilterOptionsVM filterOptionsVM = Provider.of<FilterOptionsVM>(context);
    CarDataVM carDataVM = Provider.of<CarDataVM>(context);

    return Scaffold(
      appBar: _appBar,
      body: _body,
      floatingActionButton: yearVM.selectYear != yearVM.nullNumber
          ? FloatingActionButton(
              child: Icon(Icons.search),
              onPressed: () {
                String body = filterOptionsVM.bodyString;
                String traction = filterOptionsVM.tractionString;
                String fuel = filterOptionsVM.fuelString;

                carDataVM.setAction(ACTION.None);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CarDataList(
                        yearVM.selectYear,
                        brandVM.selectedBrand,
                        modelVM.selectedModel,
                        body,
                        traction,
                        fuel,
                      ),
                    ));
              },
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
