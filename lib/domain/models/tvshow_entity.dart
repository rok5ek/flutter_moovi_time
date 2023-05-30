import 'package:freezed_annotation/freezed_annotation.dart';

part 'tvshow_entity.freezed.dart';

@freezed
class TvShowEntity with _$TvShowEntity {
  const factory TvShowEntity({
    required String title,
    required String image,
    required String overview,
    required String firstAirDate,
  }) = _TvShowEntity;
}
