import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:moovi_time/domain/models/tvshow_entity.dart';
import 'package:moovi_time/presentation/core/resources/app_paddings.dart';
import 'package:moovi_time/presentation/core/resources/app_text_styles.dart';
import 'package:moovi_time/presentation/core/widgets/circle_section_view.dart';
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
      appBar: AppBar(
        title: const Text(
          "Tv Shows",
          style: AppTextStyles.toolbarTitle,
        ),
        actions: [
          IconButton(
            icon: const Icon(FeatherIcons.search),
            onPressed: () {},
          )
        ],
      ),
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
            CircleSectionView(
                title: "Airing Today",
                items: state.airingTodayShows.map((e) {
                  return e.toItem();
                }).toList()),
            LargeSectionView(
                title: "On The Air",
                items: state.onTheAirShows.map((e) {
                  return e.toItem();
                }).toList()),
            LargeSectionView(
                title: "Popular",
                items: state.popularShows.map((e) {
                  return e.toItem();
                }).toList()),
            LargeSectionView(
                title: "Top Rated",
                bottomPadding: AppPaddings.p36,
                items: state.topRatedShows.map((e) {
                  return e.toItem();
                }).toList())
          ],
        );
      },
    );
  }
}
