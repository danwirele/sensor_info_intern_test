// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sensor_info_intern_test/core/services/services.dart' as _i4;
import 'package:sensor_info_intern_test/src/data/datasources/sensor_event_datasource.dart'
    as _i5;
import 'package:sensor_info_intern_test/src/data/repositories_impl/sensor_event_repository_impl.dart'
    as _i7;
import 'package:sensor_info_intern_test/src/domain/repositories/sensor_event_repository.dart'
    as _i6;
import 'package:sensor_info_intern_test/src/domain/usecases/change_sensor_event_name_usecase.dart'
    as _i8;
import 'package:sensor_info_intern_test/src/domain/usecases/get_all_sensor_events_usecase.dart'
    as _i9;
import 'package:sensor_info_intern_test/src/domain/usecases/get_sensor_event_usecase.dart'
    as _i10;
import 'package:sensor_info_intern_test/src/presentation/bloc/app_bloc.dart'
    as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AppBloc>(_i3.AppBloc());
    gh.singleton<_i4.DataClass>(_i4.DataClass());
    gh.singleton<_i5.SensorEventDatasource>(_i5.SensorEventDatasource());
    gh.singleton<_i6.SensorEventRepository>(_i7.SensorEventRepositoryImpl(
        datasource: gh<_i5.SensorEventDatasource>()));
    gh.singleton<_i8.ChangeSensorEventNameUsecase>(
        _i8.ChangeSensorEventNameUsecase(
            sensorEventRepository: gh<_i6.SensorEventRepository>()));
    gh.singleton<_i9.GetAllSensorEventsUseCase>(_i9.GetAllSensorEventsUseCase(
        sensorEventRepository: gh<_i6.SensorEventRepository>()));
    gh.singleton<_i10.GetSensorEventUseCase>(_i10.GetSensorEventUseCase(
        sensorEventRepository: gh<_i6.SensorEventRepository>()));
    return this;
  }
}
