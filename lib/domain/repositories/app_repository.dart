import 'package:dio/dio.dart';
import 'package:moovi_time/domain/models/genre_entity.dart';
import 'package:moovi_time/domain/models/movie_entity.dart';
import 'package:moovi_time/domain/models/tvshow_entity.dart';
import 'package:moovi_time/domain/usecases/base/app_error.dart';
import 'package:moovi_time/domain/usecases/base/app_result.dart';
import 'package:moovi_time/domain/usecases/get_genres.dart';
import 'package:moovi_time/domain/usecases/get_movies.dart';
import 'package:moovi_time/domain/usecases/get_movies_by.dart';
import 'package:moovi_time/domain/usecases/get_tvshows.dart';
import 'package:moovi_time/domain/usecases/get_tvshows_by.dart';

abstract class AppRepository {
  Future<AppResult<List<MovieEntity>, AppError>> getMovies(CancelToken cancelToken, GetMoviesParams params);

  Future<AppResult<List<TvShowEntity>, AppError>> getTvShows(CancelToken cancelToken, GetTvShowsParams params);

  Future<AppResult<List<GenreEntity>, AppError>> getGenres(CancelToken cancelToken, GetGenresParams params);

  Future<AppResult<List<MovieEntity>, AppError>> getMoviesBy(CancelToken cancelToken, GetMoviesByParams params);

  Future<AppResult<List<TvShowEntity>, AppError>> getTvShowsBy(CancelToken cancelToken, GetTvShowsByParams params);
}
