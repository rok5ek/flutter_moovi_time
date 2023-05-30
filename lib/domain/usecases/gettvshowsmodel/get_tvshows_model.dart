import 'package:flutter/foundation.dart';
import 'package:moovi_time/data/core/utils/await_utils.dart';
import 'package:moovi_time/data/core/utils/result_utils.dart';
import 'package:moovi_time/domain/models/tvshow_entity.dart';
import 'package:moovi_time/domain/usecases/base/app_error.dart';
import 'package:moovi_time/domain/usecases/base/app_exception.dart';
import 'package:moovi_time/domain/usecases/base/app_result.dart';
import 'package:moovi_time/domain/usecases/base/no_params.dart';
import 'package:moovi_time/domain/usecases/base/use_case.dart';
import 'package:moovi_time/domain/usecases/get_tvshows.dart';
import 'package:moovi_time/domain/usecases/gettvshowsmodel/tvshows_model_result.dart';
import 'package:moovi_time/domain/usecases/tvshow_list_type.dart';

class GetTvShowsModel extends UseCase<AppResult<TvShowsModelResult, AppError>, NoParams> {
  final GetTvShows getTvShowsAiringToday;
  final GetTvShows getTvShowsOnTheAir;
  final GetTvShows getTvShowsPopular;
  final GetTvShows getTvShowsTopRated;

  GetTvShowsModel({
    required this.getTvShowsAiringToday,
    required this.getTvShowsOnTheAir,
    required this.getTvShowsPopular,
    required this.getTvShowsTopRated,
  });

  @override
  Future<AppResult<TvShowsModelResult, AppError>> call(NoParams params) async {
    final getTvShowsAiringTodayRequest = getTvShowsAiringToday.call(GetTvShowsParams(type: TvShowListType.airingToday));
    final getTvShowsOnTheAirRequest = getTvShowsOnTheAir.call(GetTvShowsParams(type: TvShowListType.onTheAir));
    final getTvShowsPopularRequest = getTvShowsPopular.call(GetTvShowsParams(type: TvShowListType.popular));
    final getTvShowsTopRatedRequest = getTvShowsTopRated.call(GetTvShowsParams(type: TvShowListType.topRated));

    final result = await await4(
        getTvShowsAiringTodayRequest, getTvShowsOnTheAirRequest, getTvShowsPopularRequest, getTvShowsTopRatedRequest,
        (response1, response2, response3, response4) {
      debugPrint(
          "[App] [GetHomeModel] {call} response1:$response1, response2:$response2, response3:$response3, response4:$response4");
      return result4<
          AppResult<TvShowsModelResult, AppError>,
          AppResult<List<TvShowEntity>, AppError>,
          AppResult<List<TvShowEntity>, AppError>,
          AppResult<List<TvShowEntity>, AppError>,
          AppResult<List<TvShowEntity>, AppError>>(
        response1,
        response2,
        response3,
        response4,
        onSuccess: (p1, p2, p3, p4) {
          debugPrint("[App] [GetHomeModel] {call} onSuccess:$p1 $p2 $p3 $p4");
          return AppResult.success(
            TvShowsModelResult(
              airingTodayShows: p1.result,
              onTheAirShows: p2.result,
              popularShows: p3.result,
              topRatedShows: p4.result,
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
    getTvShowsAiringToday.onDispose();
    getTvShowsOnTheAir.onDispose();
    getTvShowsPopular.onDispose();
    getTvShowsTopRated.onDispose();
  }
}
