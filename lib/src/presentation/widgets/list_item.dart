import 'package:flutter/material.dart';
import 'package:sensor_info_intern_test/core/services/services.dart';
import 'package:sensor_info_intern_test/src/domain/entities/sensor_event.dart';
import 'package:sensor_info_intern_test/src/presentation/bloc/app_bloc.dart';

class ListItem extends StatelessWidget {
  final SensorEvent sensorEvent;
  final Color color;
  const ListItem({
    super.key,
    required this.sensorEvent,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        services<AppBloc>().add(GetConcreteSensorAppEvent(id: sensorEvent.sensorId));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Text(
                sensorEvent.sensorId.toString(),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  sensorEvent.name.toString(),
                  maxLines: 2,
                ),
              ),
              const Spacer(),
              sensorEvent.temperature != null ? const Icon(Icons.thermostat) : const SizedBox.shrink(),
              sensorEvent.humidity != null ? const Icon(Icons.water_drop_rounded) : const SizedBox.shrink(),
              const SizedBox(
                width: 8,
              ),
              CircleAvatar(
                backgroundColor: color,
                radius: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
