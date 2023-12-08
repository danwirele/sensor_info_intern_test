import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sensor_info_intern_test/core/failure/failure.dart';
import 'package:sensor_info_intern_test/core/usecase/usecase.dart';
import 'package:sensor_info_intern_test/src/domain/entities/sensor_event.dart';
import 'package:sensor_info_intern_test/src/domain/repositories/sensor_event_repository.dart';

@Singleton()
final class GetSensorEventUseCase extends UseCase<SensorEvent, int> {
  final SensorEventRepository sensorEventRepository;
  GetSensorEventUseCase({required this.sensorEventRepository});

  @override
  FutureOr<Either<Failure, SensorEvent>> call(int params) async {
    return await sensorEventRepository.getSensorEvent(id: params);
  }
}
