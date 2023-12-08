import 'package:flutter/material.dart';
import 'package:sensor_info_intern_test/core/services/services.dart';
import 'package:sensor_info_intern_test/src/presentation/bloc/app_bloc.dart';
import 'package:sensor_info_intern_test/src/presentation/widgets/my_animated_list.dart';

class AllSensorEventsPage extends StatelessWidget {
  const AllSensorEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => services<AppBloc>().add(GoBackAppEvent()),
        ),
        title: const Text('Sensor list'),
        centerTitle: true,
      ),
      body: const MyAnimatedList(),
    );
  }
}
