import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovi_time/di/dependency_injector.dart';
import 'package:moovi_time/presentation/navigation/app_screens.dart';
import 'package:moovi_time/presentation/screens/details/details_bloc.dart';
import 'package:moovi_time/presentation/screens/details/details_event.dart';
import 'package:moovi_time/presentation/screens/details/details_payload.dart';
import 'package:moovi_time/presentation/screens/details/details_screen.dart';
import 'package:moovi_time/presentation/screens/discover/discover_bloc.dart';
import 'package:moovi_time/presentation/screens/discover/discover_event.dart';
import 'package:moovi_time/presentation/screens/discover/discover_payload.dart';
import 'package:moovi_time/presentation/screens/discover/discover_screen.dart';
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
      case AppScreens.discover:
        final payload = settings.arguments as DiscoverPayload;
        return MaterialPageRoute(
          settings: const RouteSettings(name: AppScreens.discover),
          builder: (BuildContext context) {
            return BlocProvider<DiscoverBloc>(
              create: (context) => getIt<DiscoverBloc>(
                param1: payload,
              )..add(const DiscoverEvent.init()),
              child: DiscoverScreen(
                payload: payload,
              ),
            );
          },
        );
      case AppScreens.details:
        final payload = settings.arguments as DetailsPayload;
        return MaterialPageRoute(
          settings: const RouteSettings(name: AppScreens.details),
          builder: (BuildContext context) {
            return BlocProvider<DetailsBloc>(
              create: (context) => getIt<DetailsBloc>(
                param1: payload,
              )..add(const DetailsEvent.init()),
              child: DetailsScreen(
                payload: payload,
              ),
            );
          },
        );
    }
  }
}
