class CarData {
  final String modelId;
  final String modelName;
  final String modelYear;
  final String modelBody;
  final String modelEngineCC;
  final String modelEngineCyl;
  final String modelEngineType;
  final String modelEnginePowerPS;
  final String modelEnginePowerRpm;
  final String modelEngineTorqueNm;
  final String modelEngineTorqueRpm;
  final String modelEnginefuel;
  final String modelTopSpeedKph;
  final String model0To100Kph;
  final String modelTransmissionType;
  final String modelWeightKg;
  final String modelLengthMm;
  final String modelWidthMm;
  final String modelHeightMm;
  final String modelWheelbaseMm;
  final String modellKmMixed;
  final String modelEngineL;
  final String makeDisplay;
  final String makeCountry;
  final String modelTrim;
  final String modelDoors;

  CarData({
    this.modelId,
    this.modelName,
    this.modelYear,
    this.modelBody,
    this.modelEngineCC,
    this.modelEngineCyl,
    this.modelEngineType,
    this.modelEnginePowerPS,
    this.modelEnginePowerRpm,
    this.modelEngineTorqueNm,
    this.modelEngineTorqueRpm,
    this.modelEnginefuel,
    this.modelTopSpeedKph,
    this.model0To100Kph,
    this.modelTransmissionType,
    this.modelWeightKg,
    this.modelLengthMm,
    this.modelWidthMm,
    this.modelHeightMm,
    this.modelWheelbaseMm,
    this.modellKmMixed,
    this.modelEngineL,
    this.makeDisplay,
    this.makeCountry,
    this.modelTrim,
    this.modelDoors,
  });

  CarData.fromJson(Map<String, dynamic> json)
      : modelId = json["modelId"],
        modelName = json["modelName"],
        modelYear = json["modelYear"],
        modelBody = json["modelBody"],
        modelEngineCC = json["modelEngineCC"],
        modelEngineCyl = json["modelEngineCyl"],
        modelEngineType = json["modelEngineType"],
        modelEnginePowerPS = json["modelEnginePowerPS"],
        modelEnginePowerRpm = json["modelEnginePowerRpm"],
        modelEngineTorqueNm = json["modelEngineTorqueNm"],
        modelEngineTorqueRpm = json["modelEngineTorqueRpm"],
        modelEnginefuel = json["modelEnginefuel"],
        modelTopSpeedKph = json["modelTopSpeedKph"],
        model0To100Kph = json["model0To100Kph"],
        modelTransmissionType = json["modelTransmissionType"],
        modelWeightKg = json["modelWeightKg"],
        modelLengthMm = json["modelLengthMm"],
        modelWidthMm = json["modelWidthMm"],
        modelHeightMm = json["modelHeightMm"],
        modelWheelbaseMm = json["modelWheelbaseMm"],
        modellKmMixed = json["modellKmMixed"],
        modelEngineL = json["modelEngineL"],
        makeDisplay = json["makeDisplay"],
        makeCountry = json["makeCountry"],
        modelTrim = json["modelTrim"],
        modelDoors = json["modelDoors"];

  Map<String, dynamic> toJson() => {
        "modelId": modelId,
        "modelName": modelName,
        "modelYear": modelYear,
        "modelBody": modelBody,
        "modelEngineCC": modelEngineCC,
        "modelEngineCyl": modelEngineCyl,
        "modelEngineType": modelEngineType,
        "modelEnginePowerPS": modelEnginePowerPS,
        "modelEnginePowerRpm": modelEnginePowerRpm,
        "modelEngineTorqueNm": modelEngineTorqueNm,
        "modelEngineTorqueRpm": modelEngineTorqueRpm,
        "modelEnginefuel": modelEnginefuel,
        "modelTopSpeedKph": modelTopSpeedKph,
        "model0To100Kph": model0To100Kph,
        "modelTransmissionType": modelTransmissionType,
        "modelWeightKg": modelWeightKg,
        "modelLengthMm": modelLengthMm,
        "modelWidthMm": modelWidthMm,
        "modelHeightMm": modelHeightMm,
        "modelWheelbaseMm": modelWheelbaseMm,
        "modellKmMixed": modellKmMixed,
        "modelEngineL": modelEngineL,
        "makeDisplay": makeDisplay,
        "makeCountry": makeCountry,
        "modelTrim": modelTrim,
        "modelDoors": modelDoors,
      };
}
