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

import 'package:moovi_time/data/models/movieresponse/movie_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_response_wrapper.freezed.dart';
part 'movie_response_wrapper.g.dart';

@freezed
class MovieResponseWrapper with _$MovieResponseWrapper {
  const factory MovieResponseWrapper({
    @JsonKey(name: "results") required List<MovieResponse> results,
    @JsonKey(name: "page") required int page,
    @JsonKey(name: "total_pages") required int totalPages,
    @JsonKey(name: "total_results") required int totalResults,
  }) = _MovieResponseWrapper;

  factory MovieResponseWrapper.fromJson(Map<String, Object?> json) => _$MovieResponseWrapperFromJson(json);
}
