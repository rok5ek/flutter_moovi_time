import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moovi_time/domain/models/tvshow_entity.dart';

part 'tvshows_state.freezed.dart';

@freezed
class TvShowsState with _$TvShowsState {
  const factory TvShowsState({
    required bool isLoading,
    required List<TvShowEntity> airingTodayShows,
    required List<TvShowEntity> onTheAirShows,
    required List<TvShowEntity> popularShows,
    required List<TvShowEntity> topRatedShows,
  }) = _TvShowsState;
}
