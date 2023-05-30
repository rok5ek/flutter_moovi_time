import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_event.freezed.dart';

@freezed
class MainEvent with _$MainEvent {
  const factory MainEvent.init() = _Init;
  const factory MainEvent.navbarItemClick({required int index}) = _NavbarItemClick;
}
