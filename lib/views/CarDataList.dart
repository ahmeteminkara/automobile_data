import 'dart:convert';
import 'package:automobile_data/models/CarData.dart';
import 'package:automobile_data/widgets/CarDataListGenerator.dart';
import 'package:automobile_data/widgets/CarPhotoWidget.dart';
import 'package:flutter/material.dart';

class CarDataList extends StatelessWidget {
  final List<CarData> listCarData;

  CarDataList(this.listCarData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Search Results"),
      ),
      body: _body(context, listCarData),
    );
  }

  _body(BuildContext context, List<CarData> listCarData) {
    CarDataListGenerator listView = CarDataListGenerator(list: listCarData);

    CarData simpleCarData = listCarData.first;

    List<String> imageFilter = [
      simpleCarData.makeDisplay,
      simpleCarData.modelName,
      simpleCarData.modelYear,
      simpleCarData.modelBody,
    ];

    return Column(
      children: <Widget>[
        CarPhotoWidget(
            height: 200,
            imgUrl: 'http://www.regcheck.org.uk/image.aspx/@' +
                base64.encode(
                  utf8.encode(imageFilter.join(" ")),
                )),
        Expanded(child: listView),
      ],
    );
  }

  toListItem(String title, String value) {
    return ListTile(
      title: Text(title),
      subtitle: Text(value == null ? "Unknown" : value),
    );
  }
}
