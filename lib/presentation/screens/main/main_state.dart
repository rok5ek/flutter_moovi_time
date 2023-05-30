import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moovi_time/domain/models/movie_entity.dart';
import 'package:moovi_time/presentation/navigation/navbar_item.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    required NavbarItem navbarItem,
  }) = _MainState;
}
