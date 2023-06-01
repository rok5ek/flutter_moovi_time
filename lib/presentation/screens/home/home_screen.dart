import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:moovi_time/presentation/core/models/large_item.dart';
import 'package:moovi_time/presentation/core/resources/app_paddings.dart';
import 'package:moovi_time/presentation/core/resources/app_text_styles.dart';
import 'package:moovi_time/presentation/core/widgets/circle_section_view.dart';
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
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ListView(
          key: const PageStorageKey("sections_key"),
          children: [
            CircleSectionView(
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
                bottomPadding: AppPaddings.p36,
                items: state.topRatedMovies.map((e) {
                  return LargeItem(title: e.title, subtitle: e.overview, imageUrl: e.image);
                }).toList())
          ],
        );
      },
    );
  }
}
