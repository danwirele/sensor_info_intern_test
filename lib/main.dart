import 'package:flutter/material.dart';
import 'package:sensor_info_intern_test/core/services/services.config.dart';
import 'package:sensor_info_intern_test/core/services/services.dart';
import 'package:sensor_info_intern_test/src/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  services.init();
  runApp(const App());
}
