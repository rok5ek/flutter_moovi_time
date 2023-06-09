import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moovi_time/data/models/genreresponse/genre_response.dart';

part 'genre_response_wrapper.freezed.dart';
part 'genre_response_wrapper.g.dart';

@freezed
class GenreResponseWrapper with _$GenreResponseWrapper {
  const factory GenreResponseWrapper({
    @JsonKey(name: "genres") required List<GenreResponse> results
  }) = _GenreResponseWrapper;

  factory GenreResponseWrapper.fromJson(Map<String, Object?> json) => _$GenreResponseWrapperFromJson(json);
}
