import 'package:freezed_annotation/freezed_annotation.dart';

part 'details_event.freezed.dart';

@freezed
class DetailsEvent with _$DetailsEvent {
  const factory DetailsEvent.init() = _Init;
}
