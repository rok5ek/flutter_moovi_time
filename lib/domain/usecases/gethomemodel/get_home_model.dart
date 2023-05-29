import 'package:flutter/foundation.dart';
import 'package:moovi_time/data/core/utils/await_utils.dart';
import 'package:moovi_time/data/core/utils/result_utils.dart';
import 'package:moovi_time/domain/models/movie_entity.dart';
import 'package:moovi_time/domain/usecases/base/app_error.dart';
import 'package:moovi_time/domain/usecases/base/app_exception.dart';
import 'package:moovi_time/domain/usecases/base/app_result.dart';
import 'package:moovi_time/domain/usecases/base/no_params.dart';
import 'package:moovi_time/domain/usecases/base/use_case.dart';
import 'package:moovi_time/domain/usecases/get_movies_coming_soon.dart';
import 'package:moovi_time/domain/usecases/get_movies_now_playing.dart';
import 'package:moovi_time/domain/usecases/get_movies_popular.dart';
import 'package:moovi_time/domain/usecases/get_movies_top_rated.dart';
import 'package:moovi_time/domain/usecases/gethomemodel/home_model_result.dart';

class GetHomeModel extends UseCase<AppResult<HomeModelResult, AppError>, NoParams> {
  final GetMoviesNowPlaying getMoviesNowPlaying;
  final GetMoviesPopular getMoviesPopular;
  final GetMoviesComingSoon getMoviesComingSoon;
  final GetMoviesTopRated getMoviesTopRated;

  GetHomeModel({
    required this.getMoviesNowPlaying,
    required this.getMoviesPopular,
    required this.getMoviesComingSoon,
    required this.getMoviesTopRated,
  });

  @override
  Future<AppResult<HomeModelResult, AppError>> call(NoParams params) async {
    final getMoviesNowPlayingRequest = getMoviesNowPlaying.call(const NoParams());
    final getMoviesPopularRequest = getMoviesPopular.call(const NoParams());
    final getMoviesComingSoonRequest = getMoviesComingSoon.call(const NoParams());
    final getMoviesTopRatedRequest = getMoviesTopRated.call(const NoParams());

    final result = await await4(
        getMoviesNowPlayingRequest, getMoviesPopularRequest, getMoviesComingSoonRequest, getMoviesTopRatedRequest,
        (response1, response2, response3, response4) {
      debugPrint(
          "[App] [GetHomeModel] {call} response1:$response1, response2:$response2, response3:$response3, response4:$response4");
      return result4<
          AppResult<HomeModelResult, AppError>,
          AppResult<List<MovieEntity>, AppError>,
          AppResult<List<MovieEntity>, AppError>,
          AppResult<List<MovieEntity>, AppError>,
          AppResult<List<MovieEntity>, AppError>>(
        response1,
        response2,
        response3,
        response4,
        onSuccess: (p1, p2, p3, p4) {
          debugPrint("[App] [GetHomeModel] {call} onSuccess:$p1 $p2 $p3 $p4");
          return AppResult.success(
            HomeModelResult(
              nowPlayingMovies: p1.result,
              popularMovies: p2.result,
              comingSoonMovies: p3.result,
              topRatedMovies: p4.result,
            ),
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
  }
}
