import 'package:moovi_time/domain/usecases/base/app_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_result.freezed.dart';

@freezed
class AppResult<T, E> with _$AppResult<T, E> {
  const factory AppResult.success(T result) = Success;

  const factory AppResult.error(E error) = Error;

  const factory AppResult.failure(AppException exception) = Failure;
}
