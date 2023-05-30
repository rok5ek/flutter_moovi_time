import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moovi_time/data/models/tvshowresponse/tvshow_response.dart';

part 'tvshow_response_wrapper.freezed.dart';
part 'tvshow_response_wrapper.g.dart';

@freezed
class TvShowResponseWrapper with _$TvShowResponseWrapper {
  const factory TvShowResponseWrapper({
    @JsonKey(name: "results") required List<TvShowResponse> results,
    @JsonKey(name: "page") required int page,
    @JsonKey(name: "total_pages") required int totalPages,
    @JsonKey(name: "total_results") required int totalResults,
  }) = _TvShowResponseWrapper;

  factory TvShowResponseWrapper.fromJson(Map<String, Object?> json) => _$TvShowResponseWrapperFromJson(json);
}
