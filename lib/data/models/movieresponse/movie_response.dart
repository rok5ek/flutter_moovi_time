import 'package:moovi_time/data/config.dart';
import 'package:moovi_time/domain/models/movie_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_response.freezed.dart';
part 'movie_response.g.dart';

@freezed
class MovieResponse with _$MovieResponse {
  const factory MovieResponse({
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "poster_path") required String posterPath,
    required bool adult,
    required String overview,
    @JsonKey(name: "release_date") required String releaseDate,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, Object?> json) => _$MovieResponseFromJson(json);
}

extension MovieResponseMapper on MovieResponse {
  MovieEntity toModel() {
    return MovieEntity(
      title: title,
      image: "${Config.baseUrlImage}$posterPath",
      adult: adult,
      overview: overview,
      releaseDate: releaseDate,
    );
  }
}
