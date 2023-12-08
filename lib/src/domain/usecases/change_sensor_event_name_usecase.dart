import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sensor_info_intern_test/core/failure/failure.dart';
import 'package:sensor_info_intern_test/core/usecase/usecase.dart';
import 'package:sensor_info_intern_test/src/domain/entities/sensor_event.dart';
import 'package:sensor_info_intern_test/src/domain/repositories/sensor_event_repository.dart';

@Singleton()
final class ChangeSensorEventNameUsecase extends UseCase<SensorEvent, ChangeSensorEventNameUsecaseParams> {
  final SensorEventRepository sensorEventRepository;
  ChangeSensorEventNameUsecase({required this.sensorEventRepository});

  @override
  FutureOr<Either<Failure, SensorEvent>> call(ChangeSensorEventNameUsecaseParams params) async {
    return await sensorEventRepository.changeSensorEventName(
      newName: params.newName,
      id: params.id,
    );
  }
}

class ChangeSensorEventNameUsecaseParams {
  final String newName;
  final int id;

  ChangeSensorEventNameUsecaseParams({
    required this.newName,
    required this.id,
  });
}
