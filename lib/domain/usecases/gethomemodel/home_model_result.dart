import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moovi_time/domain/models/genre_entity.dart';
import 'package:moovi_time/domain/models/movie_entity.dart';

part 'home_model_result.freezed.dart';

@freezed
class HomeModelResult with _$HomeModelResult {
  const factory HomeModelResult({
    required List<MovieEntity> nowPlayingMovies,
    required List<MovieEntity> popularMovies,
    required List<MovieEntity> comingSoonMovies,
    required List<MovieEntity> topRatedMovies,
    required List<GenreEntity> genres,
  }) = _HomeModelResult;
}
