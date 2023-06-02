import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:moovi_time/di/dependency_injector.dart';
import 'package:moovi_time/presentation/screens/main/main_bloc.dart';
import 'package:moovi_time/presentation/screens/main/main_event.dart';
import 'package:moovi_time/presentation/screens/main/main_state.dart';
import 'package:moovi_time/presentation/screens/movies/movies_bloc.dart';
import 'package:moovi_time/presentation/screens/movies/movies_event.dart';
import 'package:moovi_time/presentation/screens/movies/movies_screen.dart';
import 'package:moovi_time/presentation/screens/profile/profile_bloc.dart';
import 'package:moovi_time/presentation/screens/profile/profile_screen.dart';
import 'package:moovi_time/presentation/screens/tvshows/tvshows_bloc.dart';
import 'package:moovi_time/presentation/screens/tvshows/tvshows_event.dart';
import 'package:moovi_time/presentation/screens/tvshows/tvshows_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _moviesScreen = const MoviesScreen();
  final _tvShowsScreen = const TvShowsScreen();
  final _profileScreen = const ProfileScreen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      listener: (BuildContext context, MainState state) {},
      builder: (BuildContext context, MainState state) {
        return Scaffold(
          // disables keyboard overflow issue
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            bottom: false,
            child: IndexedStack(
              index: state.navbarItem.index,
              children: <Widget>[
                BlocProvider<MoviesBloc>(
                  create: (context) => getIt<MoviesBloc>()..add(const MoviesEvent.init()),
                  child: _moviesScreen,
                ),
                BlocProvider<TvShowsBloc>(
                  create: (context) => getIt<TvShowsBloc>()..add(const TvShowsEvent.init()),
                  child: _tvShowsScreen,
                ),
                BlocProvider<ProfileBloc>(
                  create: (context) => getIt<ProfileBloc>(),
                  child: _profileScreen,
                ),
              ],
              // disables page scrolling
              // physics: NeverScrollableScrollPhysics(),
            ),
          ),
          // body extends to the bottom of the Scaffold, instead of only extending
          // to the top of the bottomNavigationBar or the persistentFooterButtons.
          extendBody: true,
          bottomNavigationBar: NavigationBar(
            // elevation: 0,
            selectedIndex: state.navbarItem.index,
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(FeatherIcons.film),
                label: 'Movies',
              ),
              NavigationDestination(
                icon: Icon(FeatherIcons.youtube),
                label: 'Tv Shows',
              ),
              NavigationDestination(
                icon: Icon(FeatherIcons.user),
                label: 'Profile',
              ),
            ],
            onDestinationSelected: (int index) {
              context.read<MainBloc>().add(MainEvent.navbarItemClick(index: index));
            },
          ),
        );
      },
    );
  }
}
