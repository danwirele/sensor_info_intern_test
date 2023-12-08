import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sensor_info_intern_test/core/services/services.dart';
import 'package:sensor_info_intern_test/src/data/models/sensor_event_model.dart';

@Singleton()
class SensorEventDatasource {
  /// [getAllSensorEventsFromJson] returns [Unit] if there is no errors.
  /// [getAllSensorEventsFromJson] Reads the contents of the JSON file as a string according to the specified directory and writes it to [data].
  /// Parse the [data] and write it to [jsonSource].
  /// Сhecks each [jsonSource] element for the presence of a name, temperature & humidity values, if it is missing, then assigns the specified values.
  /// Writes [SensorEventModel] to [DataClass]
  Future<Unit> getAllSensorEventsFromJson() async {
    //load data from json file
    final String data = await rootBundle.loadString('artefacts/data.json');
    final jsonSource = json.decode(data);

    //convert json data to model
    for (var map in jsonSource) {
      if (map['name'] == "" || map['name'] == "N/A") {
        map['name'] = 'No name contact the administrator';
      }
      if (map['temperature'] == null && map['humidity'] == null) {
        map['status'] = 0;
      }
      services<DataClass>().sensorEventsMap[map['sensor_id']] = SensorEventModel.fromMap(map);
    }

    return unit;
  }

  /// [getSensorEventById] returns [SensorEventModel] if there is no errors.
  /// [getSensorEventById] takes [id] to get [SensorEventModel].
  Future<SensorEventModel> getSensorEventById(int id) async {
    return services<DataClass>().sensorEventsMap[id]!;
  }

  /// [changeSensorEventName] returns [SensorEventModel] if there is no errors.
  /// [changeSensorEventName] takes [id] & [newName] to change name of sensor into [SensorEventModel].
  Future<SensorEventModel> changeSensorEventName(String newName, int id) async {
    services<DataClass>().sensorEventsMap[id] = services<DataClass>().sensorEventsMap[id]!.copyWith(name: newName);

    return services<DataClass>().sensorEventsMap[id]!;
  }
}
