import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  ThemeChanger(this._appTheme);

  ThemeData _appTheme;

  get appTheme => _appTheme;

  setAppTheme(ThemeData th) {
    _appTheme = th;
    notifyListeners();
  }
}
