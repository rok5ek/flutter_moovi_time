import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_entity.freezed.dart';

@freezed
class MovieEntity with _$MovieEntity {
  const factory MovieEntity({
    required String title,
    required String image,
    required bool adult,
    required String overview,
    required String releaseDate,
  }) = _MovieEntity;
}
