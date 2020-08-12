import 'package:automobile_data/models/Year.dart';
import 'package:automobile_data/services/WebService.dart';
import 'package:automobile_data/utils/log_print.dart';
import 'package:flutter/material.dart';

class YearVM extends ChangeNotifier {
  YearVM() {
    this.loadYearsFromService();
    selectYear = nullNumber;
  }

  int get nullNumber => -1;

  List<int> yearList = [];

  int selectYear;

  setSelectedYear(int y) {
    selectYear = y;
    notifyListeners();
  }

  loadYearsFromService() async {
    LogPrint.yearLoading;

    final Year result = await WebService.getMinMaxYear();

    for (var i = result.maxYear; i >= result.minYear; i--) {
      yearList.add(i);
    }

    notifyListeners();
    LogPrint.yearComplate;
  }
}
