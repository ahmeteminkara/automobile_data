import 'package:automobile_data/models/AppTheme.dart';
import 'package:automobile_data/viewmodels/BrandVM.dart';
import 'package:automobile_data/viewmodels/ModelVM.dart';
import 'package:automobile_data/viewmodels/ThemeChanger.dart';
import 'package:automobile_data/viewmodels/YearVM.dart';
import 'package:automobile_data/views/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      //class Foo extends ChangeNotifier
      //ChangeNotifierProvider(builder: (_) => Foo()),
      ChangeNotifierProvider(builder: (_) => ThemeChanger(AppTheme.light)),
      ChangeNotifierProvider(builder: (_) => YearVM()),
      ChangeNotifierProvider(builder: (_) => BrandVM()),
      ChangeNotifierProvider(builder: (_) => ModelVM()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'Automobile Data',
      theme: _themeChanger.appTheme,
      home: HomeView(),
    );
  }
}