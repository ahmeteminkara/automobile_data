import 'package:automobile_data/models/Brands.dart';
import 'package:automobile_data/models/CarData.dart';
import 'package:automobile_data/models/Model.dart';
import 'package:automobile_data/utils/enums.dart';
import 'package:automobile_data/viewmodels/CarDataVM.dart';
import 'package:automobile_data/widgets/MyBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarDataList extends StatelessWidget {
  final int selectYear;
  final Brand selectedBrand;
  final Model selectedModel;
  final String body;
  final String traction;
  final String fuel;

  CarDataList(
    this.selectYear,
    this.selectedBrand,
    this.selectedModel,
    this.body,
    this.traction,
    this.fuel,
  );

  @override
  Widget build(BuildContext context) {
    CarDataVM carDataVM = Provider.of<CarDataVM>(context);

    if (carDataVM.action == ACTION.None) {
      carDataVM.loadCarDataFromService(
          selectYear, selectedBrand, selectedModel, body, traction, fuel);
    }

    return Scaffold(
      appBar: AppBar(
        title: _title(context, carDataVM),
      ),
      body: _body(context, carDataVM),
    );
  }

  _title(BuildContext context, CarDataVM carDataVM) {
    if (carDataVM.action == ACTION.Success &&
        carDataVM.listCarData.isNotEmpty) {
      return Text(carDataVM.listCarData.length.toString() + " results found");
    } else {
      return Text("");
    }
  }

  _body(BuildContext context, CarDataVM carDataVM) {
    if (carDataVM.action == ACTION.Loading) {
      return Card(
          margin: EdgeInsets.all(12),
          child: ListTile(
            title: Text("Loading please"),
            trailing: CircularProgressIndicator(),
          ));
    }

    if (carDataVM.action == ACTION.Success && carDataVM.listCarData.isEmpty) {
      return Card(
          margin: EdgeInsets.all(12),
          child: ListTile(
            title: Text("There were no results. please try again."),
            trailing: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK")),
          ));
    }

    return ListView.builder(
      itemCount: carDataVM.listCarData.length,
      itemBuilder: (ctx, index) {
        CarData carData = carDataVM.listCarData.elementAt(index);

        final List<String> title = [
          carData.makeDisplay,
          carData.modelName,
          carData.modelTrim,
        ];

        final List<String> subtitle = [
          carData.modelYear,
          carData.modelBody,
          carData.modelTransmissionType,
          carData.modelEnginePowerPS + " PS",
          carData.modelEnginefuel,
          carData.modelDoors + " Doors",
        ];

        return Card(
          margin: EdgeInsets.all(12),
          child: ListTile(
            title: Text(title.join(" ")),
            subtitle: Text(subtitle.join(" ")),
            onTap: () {
              MyBottomSheet.show(ctx, [
                toListItem("Country", carData.makeCountry),
                toListItem("Brand", carData.makeDisplay),
                toListItem("Model", carData.modelName),
                toListItem("Year", carData.modelYear),
                toListItem("Body", carData.modelBody),
                toListItem("Title", carData.modelTrim),
                Divider(
                    color: Theme.of(context).indicatorColor.withOpacity(0.6)),
                toListItem("Fuel Type", carData.modelEnginefuel),
                toListItem("Engine CC", carData.modelEngineCC),
                toListItem("Engine Power", carData.modelEnginePowerPS),
                toListItem("Engine Power Rpm", carData.modelEnginePowerRpm),
                toListItem("Engine Torque", carData.modelEngineTorqueNm),
                toListItem("Engine Torque Rpm", carData.modelEngineTorqueRpm),
                toListItem("Top Speed Kph", carData.modelTopSpeedKph),
                toListItem("Avg fuel consumption", carData.modellKmMixed),
                Divider(
                    color: Theme.of(context).indicatorColor.withOpacity(0.6)),
                toListItem("Height", carData.modelHeightMm),
                toListItem("Width", carData.modelWidthMm),
                toListItem("Length", carData.modelLengthMm),
              ]);
            },
          ),
        );
      },
    );
  }

  toListItem(String title, String value) =>
      ListTile(title: Text(title), subtitle: Text(value));
}
