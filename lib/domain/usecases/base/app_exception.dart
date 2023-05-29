import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException {
  const factory AppException.server() = Server;

  const factory AppException.offline() = Offline;

  const factory AppException.timeout() = Timeout;

  const factory AppException.unknown() = Unknown;
}
