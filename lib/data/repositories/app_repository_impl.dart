import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:moovi_time/data/datasources/remote/tmdb_api_service.dart';
import 'package:moovi_time/data/models/apierror/api_error.dart';
import 'package:moovi_time/data/models/movieresponse/movie_response.dart';
import 'package:moovi_time/data/models/movieresponse/movie_response_wrapper.dart';
import 'package:moovi_time/data/models/tvshowresponse/tvshow_response.dart';
import 'package:moovi_time/data/models/tvshowresponse/tvshow_response_wrapper.dart';
import 'package:moovi_time/domain/models/movie_entity.dart';
import 'package:moovi_time/domain/models/tvshow_entity.dart';
import 'package:moovi_time/domain/repositories/app_repository.dart';
import 'package:moovi_time/domain/usecases/base/app_error.dart';
import 'package:moovi_time/domain/usecases/base/app_exception.dart';
import 'package:moovi_time/domain/usecases/base/app_result.dart';
import 'package:moovi_time/domain/usecases/get_tvshows.dart';
import 'package:moovi_time/domain/usecases/tvshow_list_type.dart';
import 'package:retrofit/retrofit.dart';

class AppRepositoryImpl extends AppRepository {
  final TmdbApiService tmdbApiService;

  AppRepositoryImpl({required this.tmdbApiService});

  @override
  Future<AppResult<List<MovieEntity>, AppError>> getMoviesNowPlaying(CancelToken cancelToken) async {
    try {
      HttpResponse<MovieResponseWrapper> response = await tmdbApiService.getMoviesNowPlaying(cancelToken);
      List<MovieEntity> movies = response.data.results.map((e) => e.toModel()).toList();
      debugPrint("[App] [AppRepositoryImpl] {getMoviesNowPlaying} response:$response");
      debugPrint("[App] [AppRepositoryImpl] {getMoviesNowPlaying} movies:$movies");
      return AppResult.success(movies);
    } on DioError catch (e) {
      int? statusCode = e.response?.statusCode;
      final data = e.response?.data;
      final AppError appError;
      if (data is Map<String, dynamic>) {
        // error response is json - parse to object
        ApiError apiError = ApiError.fromJson(data);
        appError = AppError(message: apiError.message, code: statusCode);
      } else {
        appError = AppError(message: null, code: statusCode);
      }
      debugPrint("[App] [AppRepositoryImpl] {getMoviesNowPlaying} error:$appError");
      return AppResult.error(appError);
    } on Exception catch (e) {
      debugPrint("[App] [AppRepositoryImpl] {getMoviesNowPlaying} exception:$e");
      return const AppResult.failure(AppException.server());
    }
  }

  @override
  Future<AppResult<List<MovieEntity>, AppError>> getMoviesPopular(CancelToken cancelToken) async {
    try {
      HttpResponse<MovieResponseWrapper> response = await tmdbApiService.getMoviesPopular(cancelToken);
      List<MovieEntity> movies = response.data.results.map((e) => e.toModel()).toList();
      debugPrint("[App] [AppRepositoryImpl] {getMoviesNowPlaying} response:$response");
      debugPrint("[App] [AppRepositoryImpl] {getMoviesNowPlaying} movies:$movies");
      return AppResult.success(movies);
    } on DioError catch (e) {
      int? statusCode = e.response?.statusCode;
      final data = e.response?.data;
      final AppError appError;
      if (data is Map<String, dynamic>) {
        // error response is json - parse to object
        ApiError apiError = ApiError.fromJson(data);
        appError = AppError(message: apiError.message, code: statusCode);
      } else {
        appError = AppError(message: null, code: statusCode);
      }
      debugPrint("[App] [AppRepositoryImpl] {getMoviesNowPlaying} error:$appError");
      return AppResult.error(appError);
    } on Exception catch (e) {
      debugPrint("[App] [AppRepositoryImpl] {getMoviesNowPlaying} exception:$e");
      return const AppResult.failure(AppException.server());
    }
  }

  @override
  Future<AppResult<List<MovieEntity>, AppError>> getMoviesComingSoon(CancelToken cancelToken) async {
    try {
      HttpResponse<MovieResponseWrapper> response = await tmdbApiService.getMoviesComingSoon(cancelToken);
      List<MovieEntity> movies = response.data.results.map((e) => e.toModel()).toList();
      return AppResult.success(movies);
    } on DioError catch (e) {
      int? statusCode = e.response?.statusCode;
      final data = e.response?.data;
      final AppError appError;
      if (data is Map<String, dynamic>) {
        // error response is json - parse to object
        ApiError apiError = ApiError.fromJson(data);
        appError = AppError(message: apiError.message, code: statusCode);
      } else {
        appError = AppError(message: null, code: statusCode);
      }
      return AppResult.error(appError);
    } on Exception catch (e) {
      return const AppResult.failure(AppException.server());
    }
  }

  @override
  Future<AppResult<List<MovieEntity>, AppError>> getMoviesTopRated(CancelToken cancelToken) async {
    try {
      HttpResponse<MovieResponseWrapper> response = await tmdbApiService.getMoviesTopRated(cancelToken);
      List<MovieEntity> movies = response.data.results.map((MovieResponse e) => e.toModel()).toList();
      return AppResult.success(movies);
    } on DioError catch (e) {
      int? statusCode = e.response?.statusCode;
      final data = e.response?.data;
      final AppError appError;
      if (data is Map<String, dynamic>) {
        // error response is json - parse to object
        ApiError apiError = ApiError.fromJson(data);
        appError = AppError(message: apiError.message, code: statusCode);
      } else {
        appError = AppError(message: null, code: statusCode);
      }
      return AppResult.error(appError);
    } on Exception catch (e) {
      return const AppResult.failure(AppException.server());
    }
  }

  @override
  Future<AppResult<List<TvShowEntity>, AppError>> getTvShows(
    CancelToken cancelToken,
    GetTvShowsParams params,
  ) async {
    try {
      HttpResponse<TvShowResponseWrapper> response;
      switch (params.type) {
        case TvShowListType.airingToday:
          response = await tmdbApiService.getTvShowsAiringToday(cancelToken);
          break;
        case TvShowListType.onTheAir:
          response = await tmdbApiService.getTvShowsOnTheAir(cancelToken);
          break;
        case TvShowListType.popular:
          response = await tmdbApiService.getTvShowsPopular(cancelToken);
          break;
        case TvShowListType.topRated:
          response = await tmdbApiService.getTvShowsTopRated(cancelToken);
          break;
      }
      List<TvShowEntity> entities = response.data.results.map((TvShowResponse e) => e.toModel()).toList();
      return AppResult.success(entities);
    } on DioError catch (e) {
      int? statusCode = e.response?.statusCode;
      final data = e.response?.data;
      final AppError appError;
      if (data is Map<String, dynamic>) {
        // error response is json - parse to object
        ApiError apiError = ApiError.fromJson(data);
        appError = AppError(message: apiError.message, code: statusCode);
      } else {
        appError = AppError(message: null, code: statusCode);
      }
      return AppResult.error(appError);
    } on Exception catch (e) {
      return const AppResult.failure(AppException.server());
    }
  }
}
