import 'package:automobile_data/utils/constants.dart';
import 'package:automobile_data/widgets/AppBarThemeButton.dart';
import 'package:automobile_data/widgets/BrandView.dart';
import 'package:automobile_data/widgets/DrawerFilterOptions.dart';
import 'package:automobile_data/widgets/ModelView.dart';
import 'package:automobile_data/widgets/YearView.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  get _appBar => AppBar(
        centerTitle: true,
        title: Text(Constants.appBarText),
        leading: AppBarThemeButton(),
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
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      endDrawer: DrawerFilterOptions(),
      body: _body,
    );
  }
}
