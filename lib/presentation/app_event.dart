import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_event.freezed.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.init() = _Init;
  const factory AppEvent.themeMode({required ThemeMode themeMode}) = _ThemeMode;
}
