import 'package:freezed_annotation/freezed_annotation.dart';

part 'discover_event.freezed.dart';

@freezed
class DiscoverEvent with _$DiscoverEvent {
  const factory DiscoverEvent.init() = _Init;
}
