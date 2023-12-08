import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensor_info_intern_test/core/services/services.dart';
import 'package:sensor_info_intern_test/src/presentation/bloc/app_bloc.dart';
import 'package:sensor_info_intern_test/src/presentation/pages/all_sensor_events_page.dart';
import 'package:sensor_info_intern_test/src/presentation/pages/concrete_sensor_event_page.dart';
import 'package:sensor_info_intern_test/src/presentation/pages/menu_page.dart';
import 'package:sensor_info_intern_test/src/presentation/pages/not_found_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = services<AppBloc>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sensor info',
      theme: ThemeData.light(useMaterial3: true),
      home: BlocBuilder<AppBloc, AppState>(
        bloc: bloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case InitialAppState:
              return const MenuPage();
            case AllSensorAppState:
              return const AllSensorEventsPage();
            case ConcreteSensorAppState:
              return ConcreteSensorEventPage(sensorEvent: (state as ConcreteSensorAppState).sensorEvent);
            case NotFoundAppState:
              return const NotFoundPage();
            default:
              return const NotFoundPage();
          }
        },
      ),
    );
  }
}
