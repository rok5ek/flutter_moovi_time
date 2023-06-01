import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moovi_time/domain/models/genre_entity.dart';

part 'genre_response.freezed.dart';

part 'genre_response.g.dart';

@freezed
class GenreResponse with _$GenreResponse {
  const factory GenreResponse({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
  }) = _GenreResponse;

  factory GenreResponse.fromJson(Map<String, Object?> json) => _$GenreResponseFromJson(json);
}

extension GenreResponseMapper on GenreResponse {
  GenreEntity toModel() {
    return GenreEntity(
      id: id,
      name: name,
    );
  }
}
