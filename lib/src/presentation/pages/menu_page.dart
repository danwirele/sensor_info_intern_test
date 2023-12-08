import 'package:flutter/material.dart';
import 'package:sensor_info_intern_test/core/services/services.dart';
import 'package:sensor_info_intern_test/src/presentation/bloc/app_bloc.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            services<AppBloc>().add(GetAllSensorAppEvent());
          },
          child: const Text('Sensor events list'),
        ),
      ),
    );
  }
}
