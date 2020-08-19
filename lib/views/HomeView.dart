import 'package:automobile_data/models/CarData.dart';
import 'package:automobile_data/utils/enums.dart';
import 'package:automobile_data/viewmodels/BrandVM.dart';
import 'package:automobile_data/viewmodels/CarDataVM.dart';
import 'package:automobile_data/viewmodels/FilterOptionsVM.dart';
import 'package:automobile_data/viewmodels/ModelVM.dart';
import 'package:automobile_data/viewmodels/YearVM.dart';
import 'package:automobile_data/views/CarDataList.dart';
import 'package:automobile_data/views/FavoriteCarsView.dart';
import 'package:automobile_data/widgets/AppBarThemeButton.dart';
import 'package:automobile_data/views/BrandView.dart';
import 'package:automobile_data/views/FilterOptionsView.dart';
import 'package:automobile_data/views/ModelView.dart';
import 'package:automobile_data/views/YearView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
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

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    YearVM yearVM = Provider.of<YearVM>(context);
    BrandVM brandVM = Provider.of<BrandVM>(context);
    ModelVM modelVM = Provider.of<ModelVM>(context);
    FilterOptionsVM filterOptionsVM = Provider.of<FilterOptionsVM>(context);
    CarDataVM carDataVM = Provider.of<CarDataVM>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => FavoriteCarsView()));
            }),
        title: Text("Automobile Data"),
        actions: <Widget>[AppBarThemeButton()],
      ),
      body: _body,
      floatingActionButton: searchFab(
          context, carDataVM, filterOptionsVM, yearVM, brandVM, modelVM),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  searchFab(context, carDataVM, filterOptionsVM, yearVM, brandVM, modelVM) {
    if (yearVM.selectYear == yearVM.nullNumber) return SizedBox();

    return FloatingActionButton(
      child: Icon(carDataVM.action == ACTION.Loading
          ? Icons.cloud_download
          : Icons.search),
      onPressed: () async {
        String body = filterOptionsVM.bodyString;
        String traction = filterOptionsVM.tractionString;
        String fuel = filterOptionsVM.fuelString;

        carDataVM.setAction(ACTION.Loading);

        List<CarData> res = await carDataVM.loadCarDataFromService(
            yearVM.selectYear,
            brandVM.selectedBrand,
            modelVM.selectedModel,
            body,
            traction,
            fuel);

        if (res.length == 0) {
          final snackBar = SnackBar(content: Text('There were no results!'));
          _scaffoldKey.currentState.showSnackBar(snackBar);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CarDataList(res)),
          );
          carDataVM.setAction(ACTION.None);
        }
      },
    );
  }
}
