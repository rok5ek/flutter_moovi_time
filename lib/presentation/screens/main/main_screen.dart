import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:moovi_time/di/dependency_injector.dart';
import 'package:moovi_time/presentation/screens/home/home_bloc.dart';
import 'package:moovi_time/presentation/screens/home/home_event.dart';
import 'package:moovi_time/presentation/screens/home/home_screen.dart';
import 'package:moovi_time/presentation/screens/main/main_bloc.dart';
import 'package:moovi_time/presentation/screens/main/main_event.dart';
import 'package:moovi_time/presentation/screens/main/main_state.dart';
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
  final _homeScreen = const HomeScreen();
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
                BlocProvider<HomeBloc>(
                  create: (context) => getIt<HomeBloc>()..add(const HomeEvent.init()),
                  child: _homeScreen,
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
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(FeatherIcons.film),
                label: 'Movies',
              ),
              BottomNavigationBarItem(
                icon: Icon(FeatherIcons.youtube),
                label: 'Tv Shows',
              ),
              BottomNavigationBarItem(
                icon: Icon(FeatherIcons.user),
                label: 'Profile',
              ),
            ],
            currentIndex: state.navbarItem.index,
            selectedItemColor: Colors.amber[800],
            onTap: (int index) {
              context.read<MainBloc>().add(MainEvent.navbarItemClick(index: index));
            },
          ),
        );
      },
    );
  }
}
