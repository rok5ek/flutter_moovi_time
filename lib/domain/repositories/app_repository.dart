import 'package:dio/dio.dart';
import 'package:moovi_time/domain/models/movie_entity.dart';
import 'package:moovi_time/domain/models/tvshow_entity.dart';
import 'package:moovi_time/domain/usecases/base/app_error.dart';
import 'package:moovi_time/domain/usecases/base/app_result.dart';
import 'package:moovi_time/domain/usecases/get_movies.dart';
import 'package:moovi_time/domain/usecases/get_tvshows.dart';

abstract class AppRepository {
  Future<AppResult<List<MovieEntity>, AppError>> getMovies(CancelToken cancelToken, GetMoviesParams params);

  Future<AppResult<List<TvShowEntity>, AppError>> getTvShows(CancelToken cancelToken, GetTvShowsParams params);
}
