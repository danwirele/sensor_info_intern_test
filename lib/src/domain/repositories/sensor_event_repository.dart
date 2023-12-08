import 'package:dartz/dartz.dart';
import 'package:sensor_info_intern_test/core/failure/failure.dart';
import 'package:sensor_info_intern_test/src/domain/entities/sensor_event.dart';

abstract interface class SensorEventRepository {
  /// [getAllSensorEvents] returns Either [Failure] if there is some errors or [Unit] if there is no errors
  /// [getAllSensorEvents] load all sensor events.
  Future<Either<Failure, Unit>> getAllSensorEvents();

  /// [getSensorEvent] returns Either [Failure] if there is some errors or [SensorEvent] if there is no errors
  /// [getSensorEvent] takes [id] to get [SensorEvent].
  Future<Either<Failure, SensorEvent>> getSensorEvent({required int id});

  /// [changeSensorEventName] returns Either [Failure] if there is some errors or [SensorEvent] if there is no errors
  /// [changeSensorEventName] takes [id] & [newName] to change name of sensor into [SensorEvent].
  Future<Either<Failure, SensorEvent>> changeSensorEventName({
    required int id,
    required String newName,
  });
}
