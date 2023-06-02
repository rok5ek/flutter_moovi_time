import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovi_time/presentation/screens/profile/profile_event.dart';
import 'package:moovi_time/presentation/screens/profile/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc()
      : super(ProfileState(
          isDarkMode: WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark,
        )) {
    on<ProfileEvent>((event, emit) async {
      await event.when(
        init: () async {},
        darkMode: (bool isDarkMode) {
          emit(state.copyWith(isDarkMode: isDarkMode));
        },
      );
    });
  }

  @override
  Future<void> close() async {
    super.close();
  }
}
