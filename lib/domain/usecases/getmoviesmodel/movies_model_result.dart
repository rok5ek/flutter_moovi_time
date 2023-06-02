import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moovi_time/domain/models/genre_entity.dart';
import 'package:moovi_time/domain/models/movie_entity.dart';

part 'movies_model_result.freezed.dart';

@freezed
class MoviesModelResult with _$MoviesModelResult {
  const factory MoviesModelResult({
    required List<MovieEntity> nowPlayingMovies,
    required List<MovieEntity> popularMovies,
    required List<MovieEntity> comingSoonMovies,
    required List<MovieEntity> topRatedMovies,
    required List<GenreEntity> genres,
  }) = _MoviesModelResult;
}
