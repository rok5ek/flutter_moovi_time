import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moovi_time/domain/models/genre_entity.dart';
import 'package:moovi_time/domain/models/movie_entity.dart';
import 'package:moovi_time/presentation/core/models/large_item.dart';

part 'details_state.freezed.dart';

@freezed
class DetailsState with _$DetailsState {
  const factory DetailsState({
    required bool isLoading,
    required List<LargeItem> items
  }) = _DetailsState;
}
