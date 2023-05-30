import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovi_time/presentation/core/models/large_item.dart';
import 'package:moovi_time/presentation/core/widgets/large_section_view.dart';
import 'package:moovi_time/presentation/screens/tvshows/tvshows_bloc.dart';
import 'package:moovi_time/presentation/screens/tvshows/tvshows_state.dart';

class TvShowsScreen extends StatefulWidget {
  const TvShowsScreen({Key? key}) : super(key: key);

  @override
  State<TvShowsScreen> createState() => _TvShowsScreenState();
}

class _TvShowsScreenState extends State<TvShowsScreen> {
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
    return BlocBuilder<TvShowsBloc, TvShowsState>(
      builder: (context, state) {
        return ListView(
          key: const PageStorageKey("sections_key"),
          children: [
            LargeSectionView(
                title: "Airing Today",
                items: state.airingTodayShows.map((e) {
                  return LargeItem(title: e.title, subtitle: e.overview, imageUrl: e.image);
                }).toList()),
            LargeSectionView(
                title: "On The Air",
                items: state.onTheAirShows.map((e) {
                  return LargeItem(title: e.title, subtitle: e.overview, imageUrl: e.image);
                }).toList()),
            LargeSectionView(
                title: "Popular",
                items: state.popularShows.map((e) {
                  return LargeItem(title: e.title, subtitle: e.overview, imageUrl: e.image);
                }).toList()),
            LargeSectionView(
                title: "Top Rated",
                items: state.topRatedShows.map((e) {
                  return LargeItem(title: e.title, subtitle: e.overview, imageUrl: e.image);
                }).toList())
          ],
        );
      },
    );
  }
}
