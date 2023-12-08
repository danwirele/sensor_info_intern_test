import 'package:equatable/equatable.dart';

class SensorEvent extends Equatable {
  final int sensorId;
  final String name;
  final int status;
  final int? temperature;
  final int? humidity;

  const SensorEvent({
    required this.sensorId,
    required this.name,
    required this.status,
    required this.temperature,
    required this.humidity,
  });

  @override
  List<Object?> get props => [sensorId, name];
}
