import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moovi_time/presentation/core/models/large_item.dart';

part 'tvshow_entity.freezed.dart';

@freezed
class TvShowEntity with _$TvShowEntity {
  const factory TvShowEntity({
    required int id,
    required String title,
    required String image,
    required String overview,
    required String firstAirDate,
  }) = _TvShowEntity;
}

extension TvShowEntityMapper on TvShowEntity {
  LargeItem toItem() {
    return LargeItem(
      id: id,
      title: title,
      subtitle: overview,
      imageUrl: image,
    );
  }
}
