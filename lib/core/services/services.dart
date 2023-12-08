import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sensor_info_intern_test/src/data/models/sensor_event_model.dart';

import 'services.config.dart';

GetIt services = GetIt.instance;

@InjectableInit()
FutureOr<void> initServices() async {
  services.init();
}

@Singleton()
class DataClass {
  final Map<int, SensorEventModel> sensorEventsMap = {};
}
