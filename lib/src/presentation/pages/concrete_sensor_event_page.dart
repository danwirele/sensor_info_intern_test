import 'package:flutter/material.dart';
import 'package:sensor_info_intern_test/core/services/services.dart';
import 'package:sensor_info_intern_test/src/domain/entities/sensor_event.dart';
import 'package:sensor_info_intern_test/src/presentation/bloc/app_bloc.dart';
import 'package:sensor_info_intern_test/src/presentation/dialogs/change_name_dialog.dart';

class ConcreteSensorEventPage extends StatelessWidget {
  final SensorEvent sensorEvent;
  late final Color color;
  ConcreteSensorEventPage({
    super.key,
    required this.sensorEvent,
  }) {
    switch (sensorEvent.status) {
      case 1 || 5:
        color = Colors.green;
      case 2 || 3:
        color = Colors.red;
      case 4 || 7 || 8 || 9:
        color = Colors.yellow;
      default:
        color = Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => services<AppBloc>().add(GoBackAppEvent()),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CircleAvatar(
              backgroundColor: color,
              radius: 16,
            ),
          ),
        ],
        title: const Text('Info page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('id: ${sensorEvent.sensorId}'),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) => ChangeNameDialog(
                        sensorEvent: sensorEvent,
                        textEditingController: textEditingController,
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
            Text('name:${sensorEvent.name}'),
            Text('status: ${sensorEvent.status}'),
            Text('temperature: ${sensorEvent.temperature ?? 'no data'}'),
            Text('humidity: ${sensorEvent.humidity ?? 'no data'}'),
          ],
        ),
      ),
    );
  }
}
