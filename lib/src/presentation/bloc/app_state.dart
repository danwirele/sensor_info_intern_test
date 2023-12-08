part of 'app_bloc.dart';

sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

final class InitialAppState extends AppState {}

final class AllSensorAppState extends AppState {}

final class ConcreteSensorAppState extends AppState {
  final SensorEvent sensorEvent;

  const ConcreteSensorAppState({required this.sensorEvent});

  @override
  List<Object> get props => [sensorEvent];
}

final class NotFoundAppState extends AppState {}
