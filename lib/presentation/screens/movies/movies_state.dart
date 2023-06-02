import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moovi_time/domain/models/genre_entity.dart';
import 'package:moovi_time/domain/models/movie_entity.dart';

part 'movies_state.freezed.dart';

@freezed
class MoviesState with _$MoviesState {
  const factory MoviesState({
    required bool isLoading,
    required List<MovieEntity> nowPlayingMovies,
    required List<MovieEntity> popularMovies,
    required List<MovieEntity> comingSoonMovies,
    required List<MovieEntity> topRatedMovies,
    required List<GenreEntity> genres,
  }) = _MoviesState;
}
