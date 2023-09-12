import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moovi_time/presentation/core/models/large_item.dart';

part 'discover_state.freezed.dart';

@freezed
class DiscoverState with _$DiscoverState {
  const factory DiscoverState({
    required bool isLoading,
    required List<LargeItem> items,
  }) = _DiscoverState;
}
