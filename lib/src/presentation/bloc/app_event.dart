part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class InitialAppEvent extends AppEvent {}

class GetAllSensorAppEvent extends AppEvent {}

class GetConcreteSensorAppEvent extends AppEvent {
  final int id;

  const GetConcreteSensorAppEvent({required this.id});
}

class GoBackAppEvent extends AppEvent {}

class ChangeNameSensorAppEvent extends AppEvent {
  final ChangeSensorEventNameUsecaseParams usecaseParams;

  const ChangeNameSensorAppEvent({required this.usecaseParams});
}
