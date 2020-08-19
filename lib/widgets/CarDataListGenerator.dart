import 'package:automobile_data/models/CarData.dart';
import 'package:automobile_data/views/MyBottomSheet.dart';
import 'package:automobile_data/widgets/CarFavoriteButton.dart';
import 'package:flutter/material.dart';

class CarDataListGenerator extends StatelessWidget {
  final List list;

  const CarDataListGenerator({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (list.length == 0) {
      return emptyListMessage(context);
    }

    Widget listView = ListView.builder(
      itemCount: list.length,
      itemBuilder: (ctx, index) {
        CarData carData = list.elementAt(index);

        final List<String> title = [
          carData.makeDisplay,
          carData.modelName,
          carData.modelTrim,
        ];

        final List<String> subtitle = [
          carData.modelYear,
          carData.modelBody,
          carData.modelTransmissionType,
          "${carData.modelEnginePowerPS} PS",
          carData.modelEnginefuel,
          "${carData.modelDoors} Doors",
        ];

        return Card(
          margin: EdgeInsets.all(12),
          child: ListTile(
            title: Text(title.join(" ")),
            subtitle: Text(subtitle.join(" ")),
            trailing: CarFavoriteButton(carData),
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

    return listView;
  }

  toListItem(String title, String value) {
    return ListTile(
      title: Text(title),
      subtitle: Text(value == null ? "Unknown" : value),
    );
  }

  emptyListMessage(BuildContext context) => Card(
      margin: EdgeInsets.all(12),
      child: ListTile(
          title: Text("Favorite list is empty"),
          subtitle: Text("Select favorite after automobile query."),
          trailing: IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              Navigator.pop(context);
            },
          )));
}
