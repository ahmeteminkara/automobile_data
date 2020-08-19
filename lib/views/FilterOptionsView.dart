import 'package:automobile_data/utils/enums.dart';
import 'package:automobile_data/viewmodels/FilterOptionsVM.dart';
import 'package:automobile_data/viewmodels/YearVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterOptionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    YearVM yearVM = Provider.of<YearVM>(context);
    FilterOptionsVM filterOptionsVM = Provider.of<FilterOptionsVM>(context);

    Widget content = Column(children: <Widget>[
      _listTileGenerator("Body", _body(filterOptionsVM)),
      _listTileGenerator("Traction", _traction(filterOptionsVM)),
      _listTileGenerator("Fuel Type", _fuel(filterOptionsVM)),
    ]);

    return AnimatedCrossFade(
        firstChild: Container(),
        secondChild: content,
        crossFadeState: yearVM.selectYear == yearVM.nullNumber
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: Duration(seconds: 2));
  }

  _listTileGenerator(String title, Widget optionMenu) {
    return ListTile(
      title: Text(title),
      trailing: optionMenu,
    );
  }

  _body(FilterOptionsVM filterOptionsVM) {
    return DropdownButton<BODY>(
      value: filterOptionsVM.body,
      items: BODY.values.map((BODY item) {
        return DropdownMenuItem<BODY>(
          value: item,
          child: Text(filterOptionsVM.enumToString(item)),
        );
      }).toList(),
      onChanged: (BODY body) {
        filterOptionsVM.setFilterBody(body);
      },
    );
  }

  _traction(FilterOptionsVM filterOptionsVM) {
    return DropdownButton<TRACTION>(
      value: filterOptionsVM.traction,
      items: TRACTION.values.map((TRACTION item) {
        return DropdownMenuItem<TRACTION>(
          value: item,
          child: Text(filterOptionsVM.enumToString(item)),
        );
      }).toList(),
      onChanged: (TRACTION traction) {
        filterOptionsVM.setFilterTraction(traction);
      },
    );
  }

  _fuel(FilterOptionsVM filterOptionsVM) {
    return DropdownButton<FUEL>(
      value: filterOptionsVM.fuel,
      items: FUEL.values.map((FUEL item) {
        return DropdownMenuItem<FUEL>(
          value: item,
          child: Text(filterOptionsVM.enumToString(item)),
        );
      }).toList(),
      onChanged: (FUEL fuel) {
        filterOptionsVM.setFilterFuel(fuel);
      },
    );
  }

 
}
