import 'package:flutter/material.dart';
import 'package:sensor_info_intern_test/core/services/services.dart';
import 'package:sensor_info_intern_test/core/utils/validate.dart';
import 'package:sensor_info_intern_test/src/domain/entities/sensor_event.dart';
import 'package:sensor_info_intern_test/src/domain/usecases/change_sensor_event_name_usecase.dart';
import 'package:sensor_info_intern_test/src/presentation/bloc/app_bloc.dart';

class ChangeNameDialog extends StatelessWidget {
  const ChangeNameDialog({
    super.key,
    required this.sensorEvent,
    required this.textEditingController,
  });

  final SensorEvent sensorEvent;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 120),
      child: AlertDialog(
        title: const Text("Change name"),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 20,
        ),
        actionsOverflowButtonSpacing: 20,
        actions: [
          ElevatedButton(
              onPressed: () {
                final bool valid = validate(
                  textEditingController.text,
                  r'^[a-zA-Zа-яА-ЯёЁ][a-zA-Zа-яА-ЯёЁ0-9-_\.]{1,20}$',
                );
                if (valid) {
                  services<AppBloc>().add(
                    ChangeNameSensorAppEvent(
                      usecaseParams: ChangeSensorEventNameUsecaseParams(
                        id: sensorEvent.sensorId,
                        newName: textEditingController.text,
                      ),
                    ),
                  );
                  Navigator.of(context, rootNavigator: true).pop();
                }
              },
              child: const Text("Accept")),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("Cancel"),
          ),
        ],
        content: TextField(
          controller: textEditingController,
        ),
      ),
    );
  }
}
