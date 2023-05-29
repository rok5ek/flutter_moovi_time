import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovi_time/di/dependency_injector.dart';
import 'package:moovi_time/presentation/navigation/app_screens.dart';
import 'package:moovi_time/presentation/screens/home/home_bloc.dart';
import 'package:moovi_time/presentation/screens/home/home_event.dart';
import 'package:moovi_time/presentation/screens/home/home_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppScreens.home:
        return MaterialPageRoute(
          settings: const RouteSettings(name: AppScreens.home),
          builder: (BuildContext context) {
            return BlocProvider<HomeBloc>(
              create: (context) => getIt<HomeBloc>()..add(const HomeEvent.init()),
              child: const HomeScreen(),
            );
          },
        );
      default:
        return null;
    }
  }
}
