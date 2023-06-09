import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovi_time/presentation/app_event.dart';
import 'package:moovi_time/presentation/app_state.dart';
import 'package:moovi_time/presentation/core/extensions/widgets_binding_extensions.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc()
      : super(AppState(
          themeMode: WidgetsBinding.instance.systemThemeMode,
        )) {
    on<AppEvent>((event, emit) async {
      event.when(
        init: () {
          // do nothing
        },
        themeMode: (ThemeMode themeMode) {
          emit(state.copyWith(themeMode: themeMode));
        },
      );
    });
  }

  @override
  Future<void> close() async {
    super.close();
  }
}
