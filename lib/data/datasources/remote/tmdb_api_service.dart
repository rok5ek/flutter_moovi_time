import 'package:dio/dio.dart';
import 'package:moovi_time/data/config.dart';
import 'package:moovi_time/data/datasources/remote/tmdb_endpoints.dart';
import 'package:moovi_time/data/models/movieresponse/movie_response_wrapper.dart';
import 'package:moovi_time/data/models/tvshowresponse/tvshow_response_wrapper.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/genreresponse/genre_response_wrapper.dart';

part 'tmdb_api_service.g.dart';

@RestApi(baseUrl: Config.baseUrl)
abstract class TmdbApiService {
  factory TmdbApiService(Dio dio, {String baseUrl}) = _TmdbApiService;

  @GET(TmdbEndpoints.moviesNowPlaying)
  Future<HttpResponse<MovieResponseWrapper>> getMoviesNowPlaying(@CancelRequest() CancelToken cancelToken);

  @GET(TmdbEndpoints.moviesPopular)
  Future<HttpResponse<MovieResponseWrapper>> getMoviesPopular(@CancelRequest() CancelToken cancelToken);

  @GET(TmdbEndpoints.moviesComingSoon)
  Future<HttpResponse<MovieResponseWrapper>> getMoviesComingSoon(@CancelRequest() CancelToken cancelToken);

  @GET(TmdbEndpoints.moviesTopRated)
  Future<HttpResponse<MovieResponseWrapper>> getMoviesTopRated(@CancelRequest() CancelToken cancelToken);

  @GET(TmdbEndpoints.tvShowsAiringToday)
  Future<HttpResponse<TvShowResponseWrapper>> getTvShowsAiringToday(@CancelRequest() CancelToken cancelToken);

  @GET(TmdbEndpoints.tvShowsOnTheAir)
  Future<HttpResponse<TvShowResponseWrapper>> getTvShowsOnTheAir(@CancelRequest() CancelToken cancelToken);

  @GET(TmdbEndpoints.tvShowsPopular)
  Future<HttpResponse<TvShowResponseWrapper>> getTvShowsPopular(@CancelRequest() CancelToken cancelToken);

  @GET(TmdbEndpoints.tvShowsTopRated)
  Future<HttpResponse<TvShowResponseWrapper>> getTvShowsTopRated(@CancelRequest() CancelToken cancelToken);

  @GET(TmdbEndpoints.movieGenres)
  Future<HttpResponse<GenreResponseWrapper>> getMovieGenres(@CancelRequest() CancelToken cancelToken);

  @GET(TmdbEndpoints.tvGenres)
  Future<HttpResponse<GenreResponseWrapper>> getTvGenres(@CancelRequest() CancelToken cancelToken);
}
