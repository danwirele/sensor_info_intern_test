import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sensor_info_intern_test/core/failure/failure.dart';
import 'package:sensor_info_intern_test/src/data/data_failures/data_failures.dart';
import 'package:sensor_info_intern_test/src/data/datasources/sensor_event_datasource.dart';
import 'package:sensor_info_intern_test/src/domain/entities/sensor_event.dart';
import 'package:sensor_info_intern_test/src/domain/repositories/sensor_event_repository.dart';

@Singleton(as: SensorEventRepository)
class SensorEventRepositoryImpl implements SensorEventRepository {
  final SensorEventDatasource datasource;
  SensorEventRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, Unit>> getAllSensorEvents() async {
    try {
      final Unit result = await datasource.getAllSensorEventsFromJson();

      return Right(result);
    } catch (e, stackTrace) {
      return Left(
        ReadFailure(
          message: e.toString(),
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, SensorEvent>> getSensorEvent({required int id}) async {
    try {
      final result = await datasource.getSensorEventById(id);

      return Right(result);
    } catch (e, stackTrace) {
      return Left(
        NotFoundIdFailure(
          message: e.toString(),
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, SensorEvent>> changeSensorEventName({required String newName, required int id}) async {
    try {
      final result = await datasource.changeSensorEventName(newName, id);

      return Right(result);
    } catch (e, stackTrace) {
      return Left(
        NotFoundIdFailure(
          message: e.toString(),
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
