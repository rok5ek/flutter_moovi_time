import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovi_time/domain/usecases/base/app_error.dart';
import 'package:moovi_time/domain/usecases/base/app_result.dart';
import 'package:moovi_time/domain/usecases/base/no_params.dart';
import 'package:moovi_time/domain/usecases/getmoviesmodel/get_movies_model.dart';
import 'package:moovi_time/domain/usecases/getmoviesmodel/movies_model_result.dart';
import 'package:moovi_time/presentation/screens/movies/movies_event.dart';
import 'package:moovi_time/presentation/screens/movies/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesModel getMoviesModel;

  MoviesBloc({
    required this.getMoviesModel,
  }) : super(const MoviesState(
          isLoading: true,
          nowPlayingMovies: [],
          popularMovies: [],
          comingSoonMovies: [],
          topRatedMovies: [],
          genres: [],
        )) {
    on<MoviesEvent>((event, emit) async {
      await event.when(
        init: () async {
          AppResult<MoviesModelResult, AppError> result = await getMoviesModel.call(const NoParams());
          debugPrint("[App] [NowPlayingBloc] {NowPlayingBloc} result:$result");

          result.when(
            success: (data) {
              emit(state.copyWith(
                isLoading: false,
                nowPlayingMovies: data.nowPlayingMovies,
                popularMovies: data.popularMovies,
                comingSoonMovies: data.comingSoonMovies,
                topRatedMovies: data.topRatedMovies,
                genres: data.genres,
              ));
            },
            error: (error) {},
            failure: (failure) {},
          );
        },
      );
    });
  }

  @override
  Future<void> close() async {
    getMoviesModel.onDispose();
    super.close();
  }
}
