import 'package:dio/dio.dart';
import 'package:moovi_time/data/config.dart';
import 'package:moovi_time/data/datasources/remote/tmdb_endpoints.dart';
import 'package:moovi_time/data/models/movieresponse/movie_response_wrapper.dart';
import 'package:retrofit/retrofit.dart';

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
}
