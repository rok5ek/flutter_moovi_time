import 'package:moovi_time/domain/models/movie_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moovi_time/domain/models/tvshow_entity.dart';

part 'tvshows_model_result.freezed.dart';

@freezed
class TvShowsModelResult with _$TvShowsModelResult {
  const factory TvShowsModelResult({
    required List<TvShowEntity> airingTodayShows,
    required List<TvShowEntity> onTheAirShows,
    required List<TvShowEntity> popularShows,
    required List<TvShowEntity> topRatedShows,
  }) = _TvShowsModelResult;
}
