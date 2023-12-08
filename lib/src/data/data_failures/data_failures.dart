import 'package:sensor_info_intern_test/core/failure/failure.dart';

class ReadFailure extends Failure {
  const ReadFailure({
    required super.message,
    required super.stackTrace,
  });
}

class NotFoundIdFailure extends Failure {
  const NotFoundIdFailure({
    required super.message,
    required super.stackTrace,
  });
}
