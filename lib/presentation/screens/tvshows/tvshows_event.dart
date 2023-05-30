import 'package:freezed_annotation/freezed_annotation.dart';

part 'tvshows_event.freezed.dart';

@freezed
class TvShowsEvent with _$TvShowsEvent {
  const factory TvShowsEvent.init() = _Init;
}
