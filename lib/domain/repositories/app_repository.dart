import 'package:dio/dio.dart';
import 'package:moovi_time/domain/models/movie_entity.dart';
import 'package:moovi_time/domain/usecases/base/app_error.dart';
import 'package:moovi_time/domain/usecases/base/app_result.dart';

abstract class AppRepository {
  Future<AppResult<List<MovieEntity>, AppError>> getMoviesNowPlaying(CancelToken cancelToken);

  Future<AppResult<List<MovieEntity>, AppError>> getMoviesPopular(CancelToken cancelToken);

  Future<AppResult<List<MovieEntity>, AppError>> getMoviesComingSoon(CancelToken cancelToken);

  Future<AppResult<List<MovieEntity>, AppError>> getMoviesTopRated(CancelToken cancelToken);
}
