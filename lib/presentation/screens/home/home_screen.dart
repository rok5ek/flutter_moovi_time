import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:moovi_time/domain/models/movie_entity.dart';
import 'package:moovi_time/presentation/core/resources/app_paddings.dart';
import 'package:moovi_time/presentation/core/resources/app_text_styles.dart';
import 'package:moovi_time/presentation/core/widgets/movie_view.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.film),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.user),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        onTap: (int e) {},
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ListView(
          children: [
            ..._buildMovieSectionView(title: "Now playing", movies: state.nowPlayingMovies),
            ..._buildMovieSectionView(title: "Popular", movies: state.popularMovies),
            ..._buildMovieSectionView(title: "Coming Soon", movies: state.comingSoonMovies),
            ..._buildMovieSectionView(title: "Top Rated", movies: state.topRatedMovies),
          ],
        );
      },
    );
  }

  List<Widget> _buildMovieSectionView({required String title, required List<MovieEntity> movies}) {
    return [
      Padding(
        padding: const EdgeInsets.all(AppPaddings.p16),
        child: Text(
          title,
          style: AppTextStyles.sectionViewTitle,
        ),
      ),
      SizedBox(
        height: 300,
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            MovieEntity movie = movies[index];
            return MovieView(movie: movie);
          },
        ),
      )
    ];
  }
}

class MoviesSectionView extends StatelessWidget {
  const MoviesSectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
