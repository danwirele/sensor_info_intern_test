import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sensor_info_intern_test/core/services/services.dart';
import 'package:sensor_info_intern_test/src/domain/entities/sensor_event.dart';
import 'package:sensor_info_intern_test/src/domain/usecases/change_sensor_event_name_usecase.dart';
import 'package:sensor_info_intern_test/src/domain/usecases/get_all_sensor_events_usecase.dart';
import 'package:sensor_info_intern_test/src/domain/usecases/get_sensor_event_usecase.dart';

part 'app_event.dart';
part 'app_state.dart';

@Singleton()
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(InitialAppState()) {
    on<InitialAppEvent>(_onInitialAppEvent);
    on<GetAllSensorAppEvent>(_getAllSensorAppEvent);
    on<GetConcreteSensorAppEvent>(_getConcreteSensorAppEvent);
    on<GoBackAppEvent>(_onGoBackAppEvent);
    on<ChangeNameSensorAppEvent>(_onChangeNameSensorAppEvent);
    add(InitialAppEvent());
  }

  ///Emit [AppState] depending on the result of [GetAllSensorEventsUseCase]
  FutureOr<void> _onInitialAppEvent(
    InitialAppEvent event,
    Emitter<AppState> emit,
  ) async {
    final getAllSensorEventsUseCase = services<GetAllSensorEventsUseCase>();
    final result = await getAllSensorEventsUseCase.call(unit);
    result.fold(
      (l) => emit(NotFoundAppState()),
      (r) => null,
    );
  }

  FutureOr<void> _getAllSensorAppEvent(
    GetAllSensorAppEvent event,
    Emitter<AppState> emit,
  ) {
    emit(AllSensorAppState());
  }

  ///Emit [AppState] depending on the result of [GetSensorEventUseCase]
  FutureOr<void> _getConcreteSensorAppEvent(
    GetConcreteSensorAppEvent event,
    Emitter<AppState> emit,
  ) async {
    final getSensorEventUseCase = services<GetSensorEventUseCase>();
    final result = await getSensorEventUseCase.call(event.id);
    result.fold(
      (l) => emit(NotFoundAppState()),
      (r) => emit(ConcreteSensorAppState(
        sensorEvent: r,
      )),
    );
  }

  ///Emit [AppState] depending on runtimeType of [state]
  FutureOr<void> _onGoBackAppEvent(
    GoBackAppEvent event,
    Emitter<AppState> emit,
  ) {
    switch (state.runtimeType) {
      case AllSensorAppState:
        emit(InitialAppState());
      case ConcreteSensorAppState:
        emit(AllSensorAppState());
    }
  }

  ///Emit [AppState] depending on the result of [ChangeSensorEventNameUsecase]
  FutureOr<void> _onChangeNameSensorAppEvent(
    ChangeNameSensorAppEvent event,
    Emitter<AppState> emit,
  ) async {
    final changeSensorEventNameUsecase = services<ChangeSensorEventNameUsecase>();
    final result = await changeSensorEventNameUsecase.call(event.usecaseParams);
    result.fold(
      (l) => emit(NotFoundAppState()),
      (r) => emit(ConcreteSensorAppState(
        sensorEvent: r,
      )),
    );
  }
}
