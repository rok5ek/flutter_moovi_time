import 'package:moovi_time/domain/models/movie_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_model_result.freezed.dart';

@freezed
class HomeModelResult with _$HomeModelResult {
  const factory HomeModelResult({
    required List<MovieEntity> nowPlayingMovies,
    required List<MovieEntity> popularMovies,
    required List<MovieEntity> comingSoonMovies,
    required List<MovieEntity> topRatedMovies,
  }) = _HomeModelResult;
}
