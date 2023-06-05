import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moovi_time/presentation/core/models/large_item.dart';

part 'movie_entity.freezed.dart';

@freezed
class MovieEntity with _$MovieEntity {
  const factory MovieEntity({
    required int id,
    required String title,
    required String image,
    required bool adult,
    required String overview,
    required String releaseDate,
  }) = _MovieEntity;
}

extension MovieEntityMapper on MovieEntity {
  LargeItem toItem() {
    return LargeItem(
      id: id,
      title: title,
      subtitle: overview,
      imageUrl: image,
    );
  }
}
