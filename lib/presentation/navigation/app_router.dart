import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovi_time/di/dependency_injector.dart';
import 'package:moovi_time/presentation/navigation/app_screens.dart';
import 'package:moovi_time/presentation/screens/main/main_bloc.dart';
import 'package:moovi_time/presentation/screens/main/main_event.dart';
import 'package:moovi_time/presentation/screens/main/main_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppScreens.main:
        return MaterialPageRoute(
          settings: const RouteSettings(name: AppScreens.main),
          builder: (BuildContext context) {
            return BlocProvider<MainBloc>(
              create: (context) => getIt<MainBloc>()..add(const MainEvent.init()),
              child: const MainScreen(),
            );
          },
        );
      default:
        return null;
    }
  }
}
