// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:sensor_info_intern_test/src/domain/entities/sensor_event.dart';

class SensorEventModel extends SensorEvent {
  const SensorEventModel({
    required super.sensorId,
    required super.name,
    required super.status,
    required super.temperature,
    required super.humidity,
  });

  SensorEventModel copyWith({
    int? sensorId,
    String? name,
    int? status,
    int? temperature,
    int? humidity,
  }) {
    return SensorEventModel(
      sensorId: sensorId ?? this.sensorId,
      name: name ?? this.name,
      status: status ?? this.status,
      temperature: temperature ?? this.temperature,
      humidity: humidity ?? this.humidity,
    );
  }

  factory SensorEventModel.fromMap(Map<String, dynamic> map) {
    return SensorEventModel(
      sensorId: map['sensor_id'] as int,
      name: map['name'] as String,
      status: map['status'] as int,
      temperature: map['temperature'] != null ? map['temperature'] as int : null,
      humidity: map['humidity'] != null ? map['humidity'] as int : null,
    );
  }

  @override
  String toString() {
    return 'SensorEventModel(sensorId: $sensorId, name: $name, status: $status, temperature: $temperature, humidity: $humidity)';
  }

  @override
  bool operator ==(covariant SensorEventModel other) {
    if (identical(this, other)) return true;

    return other.sensorId == sensorId &&
        other.name == name &&
        other.status == status &&
        other.temperature == temperature &&
        other.humidity == humidity;
  }

  @override
  int get hashCode {
    return sensorId.hashCode ^ name.hashCode ^ status.hashCode ^ temperature.hashCode ^ humidity.hashCode;
  }
}
