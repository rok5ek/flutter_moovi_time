import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_error.freezed.dart';

@freezed
class AppError with _$AppError {
  const factory AppError({
    required String? message,
    required int? code,
  }) = _AppError;
}
