import 'package:flutter/foundation.dart';
import 'package:moovi_time/data/core/utils/await_utils.dart';
import 'package:moovi_time/data/core/utils/result_utils.dart';
import 'package:moovi_time/domain/models/genre_entity.dart';
import 'package:moovi_time/domain/models/movie_entity.dart';
import 'package:moovi_time/domain/usecases/base/app_error.dart';
import 'package:moovi_time/domain/usecases/base/app_exception.dart';
import 'package:moovi_time/domain/usecases/base/app_result.dart';
import 'package:moovi_time/domain/usecases/base/no_params.dart';
import 'package:moovi_time/domain/usecases/base/use_case.dart';
import 'package:moovi_time/domain/usecases/genre_list_type.dart';
import 'package:moovi_time/domain/usecases/get_genres.dart';
import 'package:moovi_time/domain/usecases/get_movies.dart';
import 'package:moovi_time/domain/usecases/getmoviesmodel/movies_model_result.dart';
import 'package:moovi_time/domain/usecases/movie_list_type.dart';

class GetMoviesModel extends UseCase<AppResult<MoviesModelResult, AppError>, NoParams> {
  final GetMovies getMoviesNowPlaying;
  final GetMovies getMoviesPopular;
  final GetMovies getMoviesComingSoon;
  final GetMovies getMoviesTopRated;
  final GetGenres getGenres;

  GetMoviesModel({
    required this.getMoviesNowPlaying,
    required this.getMoviesPopular,
    required this.getMoviesComingSoon,
    required this.getMoviesTopRated,
    required this.getGenres,
  });

  @override
  Future<AppResult<MoviesModelResult, AppError>> call(NoParams params) async {
    final getMoviesNowPlayingRequest = getMoviesNowPlaying.call(GetMoviesParams(type: MovieListType.nowPlaying));
    final getMoviesPopularRequest = getMoviesPopular.call(GetMoviesParams(type: MovieListType.popular));
    final getMoviesComingSoonRequest = getMoviesComingSoon.call(GetMoviesParams(type: MovieListType.comingSoon));
    final getMoviesTopRatedRequest = getMoviesTopRated.call(GetMoviesParams(type: MovieListType.topRated));
    final getGenresRequest = getGenres.call(GetGenresParams(type: GenreListType.movie));

    final result = await await5(getMoviesNowPlayingRequest, getMoviesPopularRequest, getMoviesComingSoonRequest,
        getMoviesTopRatedRequest, getGenresRequest, (response1, response2, response3, response4, response5) {
      debugPrint(
          "[App] [GetHomeModel] {call} response1:$response1, response2:$response2, response3:$response3, response4:$response4, response5:$response5");
      return result5<
          AppResult<MoviesModelResult, AppError>,
          AppResult<List<MovieEntity>, AppError>,
          AppResult<List<MovieEntity>, AppError>,
          AppResult<List<MovieEntity>, AppError>,
          AppResult<List<MovieEntity>, AppError>,
          AppResult<List<GenreEntity>, AppError>>(
        response1,
        response2,
        response3,
        response4,
        response5,
        onSuccess: (p1, p2, p3, p4, p5) {
          debugPrint("[App] [GetHomeModel] {call} onSuccess:$p1 $p2 $p3 $p4 $p5");
          return AppResult.success(
            MoviesModelResult(
                nowPlayingMovies: p1.result,
                popularMovies: p2.result,
                comingSoonMovies: p3.result,
                topRatedMovies: p4.result,
                genres: p5.result),
          );
        },
        onError: (p) {
          debugPrint("[App] [GetHomeModel] {call} error:$p");
          return const AppResult.error(AppError(message: 'test', code: 400));
        },
        onException: (p) {
          debugPrint("[App] [GetHomeModel] {call} onException:$p");
          return const AppResult.failure(AppException.unknown());
        },
      );
    });
    debugPrint("[App] [GetHomeModel] {call} useCase:$result");
    debugPrint("[App] [GetHomeModel] {call} useCase:${result.runtimeType}");
    return result;
  }

  @override
  void onDispose() {
    getMoviesNowPlaying.onDispose();
    getMoviesPopular.onDispose();
    getMoviesComingSoon.onDispose();
    getMoviesTopRated.onDispose();
    getGenres.onDispose();
  }
}
