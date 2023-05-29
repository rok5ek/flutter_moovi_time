// "poster_path": "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg",
// "adult": false,
// "overview": "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
// "release_date": "2016-08-03",
// "genre_ids": [
// 14,
// 28,
// 80
// ],
// "id": 297761,
// "original_title": "Suicide Squad",
// "original_language": "en",
// "title": "Suicide Squad",
// "backdrop_path": "/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg",
// "popularity": 48.261451,
// "vote_count": 1466,
// "video": false,
// "vote_average": 5.91

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
