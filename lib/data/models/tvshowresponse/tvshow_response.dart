import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moovi_time/data/config.dart';
import 'package:moovi_time/domain/models/tvshow_entity.dart';

part 'tvshow_response.freezed.dart';
part 'tvshow_response.g.dart';

@freezed
class TvShowResponse with _$TvShowResponse {
  const factory TvShowResponse({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String title,
    @JsonKey(name: "poster_path") required String posterPath,
    @JsonKey(name: "overview") required String overview,
    @JsonKey(name: "first_air_date") required String firstAirDate,
  }) = _TvShowResponse;

  factory TvShowResponse.fromJson(Map<String, Object?> json) => _$TvShowResponseFromJson(json);
}

extension TvShowResponseMapper on TvShowResponse {
  TvShowEntity toModel() {
    return TvShowEntity(
      id: id,
      title: title,
      image: "${Config.baseUrlImage}$posterPath",
      overview: overview,
      firstAirDate: firstAirDate,
    );
  }
}
