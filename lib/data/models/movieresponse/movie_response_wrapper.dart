import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moovi_time/data/models/movieresponse/movie_response.dart';

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
