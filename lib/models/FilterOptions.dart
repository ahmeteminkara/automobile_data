import 'package:automobile_data/utils/enums.dart';

class FilterOptions {
  BODY carBody;
  TRACTION carTraction;
  FUEL carFuelType;

  FilterOptions({
    this.carBody,
    this.carTraction,
    this.carFuelType,
  });
}
