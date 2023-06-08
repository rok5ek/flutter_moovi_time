import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:moovi_time/domain/models/movie_entity.dart';
import 'package:moovi_time/presentation/core/models/large_item.dart';
import 'package:moovi_time/presentation/core/models/text_item.dart';
import 'package:moovi_time/presentation/core/resources/app_paddings.dart';
import 'package:moovi_time/presentation/core/resources/app_text_styles.dart';
import 'package:moovi_time/presentation/core/widgets/circle_section_view.dart';
import 'package:moovi_time/presentation/core/widgets/large_section_view.dart';
import 'package:moovi_time/presentation/core/widgets/text_section_view.dart';
import 'package:moovi_time/presentation/navigation/app_navigator.dart';
import 'package:moovi_time/presentation/screens/details/details_payload.dart';
import 'package:moovi_time/presentation/screens/details/details_type.dart';
import 'package:moovi_time/presentation/screens/discover/discover_payload.dart';
import 'package:moovi_time/presentation/screens/discover/discover_type.dart';
import 'package:moovi_time/presentation/screens/movies/movies_bloc.dart';
import 'package:moovi_time/presentation/screens/movies/movies_state.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // disables keyboard overflow issue
      resizeToAvoidBottomInset: false,
      // backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          "Movies",
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
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        return ListView(
          key: const PageStorageKey("sections_key"),
          children: [
            CircleSectionView(
                title: "Now playing",
                items: state.nowPlayingMovies.map((e) {
                  return e.toItem();
                }).toList()),
            LargeSectionView(
              title: "Popular",
              items: state.popularMovies.map((e) {
                return e.toItem();
              }).toList(),
              onItemTap: (LargeItem item) {
                AppNavigator.openDetailsScreen(
                  context: context,
                  payload: DetailsPayload(id: item.id, type: DetailsType.movie),
                );
              },
            ),
            TextSectionView(
              title: "Genres",
              items: state.genres.map((e) {
                return TextItem(id: e.id, text: e.name);
              }).toList(),
              onItemTap: (TextItem item) {
                AppNavigator.openDiscoverScreen(
                  context: context,
                  payload: DiscoverPayload(title: item.text, type: DiscoverType.movie, genreId: item.id),
                );
              },
            ),
            LargeSectionView(
              title: "Coming Soon",
              items: state.comingSoonMovies.map((e) {
                return e.toItem();
              }).toList(),
              onItemTap: (LargeItem item) {
                AppNavigator.openDetailsScreen(
                  context: context,
                  payload: DetailsPayload(id: item.id, type: DetailsType.movie),
                );
              },
            ),
            LargeSectionView(
              title: "Top Rated",
              bottomPadding: AppPaddings.p36,
              items: state.topRatedMovies.map((e) {
                return e.toItem();
              }).toList(),
              onItemTap: (LargeItem item) {
                AppNavigator.openDetailsScreen(
                  context: context,
                  payload: DetailsPayload(id: item.id, type: DetailsType.movie),
                );
              },
            )
          ],
        );
      },
    );
  }
}
