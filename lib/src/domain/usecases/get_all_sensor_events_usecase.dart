import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sensor_info_intern_test/core/failure/failure.dart';
import 'package:sensor_info_intern_test/core/usecase/usecase.dart';
import 'package:sensor_info_intern_test/src/domain/repositories/sensor_event_repository.dart';

@Singleton()
final class GetAllSensorEventsUseCase extends UseCase<Unit, Unit> {
  final SensorEventRepository sensorEventRepository;
  GetAllSensorEventsUseCase({required this.sensorEventRepository});

  @override
  FutureOr<Either<Failure, Unit>> call(Unit params) async {
    return await sensorEventRepository.getAllSensorEvents();
  }
}
