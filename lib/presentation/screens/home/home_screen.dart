import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovi_time/presentation/core/models/large_item.dart';
import 'package:moovi_time/presentation/core/widgets/large_section_view.dart';
import 'package:moovi_time/presentation/screens/home/home_bloc.dart';
import 'package:moovi_time/presentation/screens/home/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // disables keyboard overflow issue
      resizeToAvoidBottomInset: false,
      // backgroundColor: AppColors.background,
      // appBar: AppToolbar(),
      body: SafeArea(
        bottom: false,
        child: Container(
          child: buildBody(context),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ListView(
          key: const PageStorageKey("sections_key"),
          children: [
            LargeSectionView(
                title: "Now playing",
                items: state.nowPlayingMovies.map((e) {
                  return LargeItem(title: e.title, subtitle: e.overview, imageUrl: e.image);
                }).toList()),
            LargeSectionView(
                title: "Popular",
                items: state.popularMovies.map((e) {
                  return LargeItem(title: e.title, subtitle: e.overview, imageUrl: e.image);
                }).toList()),
            LargeSectionView(
                title: "Coming Soon",
                items: state.comingSoonMovies.map((e) {
                  return LargeItem(title: e.title, subtitle: e.overview, imageUrl: e.image);
                }).toList()),
            LargeSectionView(
                title: "Top Rated",
                items: state.topRatedMovies.map((e) {
                  return LargeItem(title: e.title, subtitle: e.overview, imageUrl: e.image);
                }).toList())
          ],
        );
      },
    );
  }
}
