import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:moovi_time/data/config.dart';
import 'package:moovi_time/data/datasources/remote/tmdb_api_service.dart';
import 'package:moovi_time/data/repositories/app_repository_impl.dart';
import 'package:moovi_time/domain/repositories/app_repository.dart';
import 'package:moovi_time/domain/usecases/get_genres.dart';
import 'package:moovi_time/domain/usecases/get_movies.dart';
import 'package:moovi_time/domain/usecases/get_movies_by.dart';
import 'package:moovi_time/domain/usecases/get_tvshows.dart';
import 'package:moovi_time/domain/usecases/get_tvshows_by.dart';
import 'package:moovi_time/domain/usecases/getmoviesmodel/get_movies_model.dart';
import 'package:moovi_time/domain/usecases/gettvshowsmodel/get_tvshows_model.dart';
import 'package:moovi_time/presentation/app_bloc.dart';
import 'package:moovi_time/presentation/navigation/app_router.dart';
import 'package:moovi_time/presentation/screens/discover/discover_bloc.dart';
import 'package:moovi_time/presentation/screens/discover/discover_payload.dart';
import 'package:moovi_time/presentation/screens/main/main_bloc.dart';
import 'package:moovi_time/presentation/screens/movies/movies_bloc.dart';
import 'package:moovi_time/presentation/screens/profile/profile_bloc.dart';
import 'package:moovi_time/presentation/screens/tvshows/tvshows_bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

// Dependency injection
Future<void> initDependencies() async {
  final dio = Dio();
  dio.options.queryParameters = {"api_key": Config.apiKey};
  dio.interceptors.add(PrettyDioLogger(
    // requestHeader: true,
    // requestBody: true,
    responseBody: false,
    // responseHeader: false,
    compact: false,
  ));

  // repositories and data sources
  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<TmdbApiService>(() => TmdbApiService(getIt<Dio>()));
  getIt.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(tmdbApiService: getIt<TmdbApiService>()));

  // use cases
  getIt.registerLazySingleton<GetMovies>(() => GetMovies(repository: getIt<AppRepository>()));
  getIt.registerLazySingleton<GetTvShows>(() => GetTvShows(repository: getIt<AppRepository>()));
  getIt.registerLazySingleton<GetGenres>(() => GetGenres(repository: getIt<AppRepository>()));
  getIt.registerLazySingleton<GetMoviesModel>(() => GetMoviesModel(
        getMoviesNowPlaying: getIt<GetMovies>(),
        getMoviesPopular: getIt<GetMovies>(),
        getMoviesComingSoon: getIt<GetMovies>(),
        getMoviesTopRated: getIt<GetMovies>(),
        getGenres: getIt<GetGenres>(),
      ));
  getIt.registerLazySingleton<GetTvShowsModel>(() => GetTvShowsModel(
        getTvShowsAiringToday: getIt<GetTvShows>(),
        getTvShowsOnTheAir: getIt<GetTvShows>(),
        getTvShowsPopular: getIt<GetTvShows>(),
        getTvShowsTopRated: getIt<GetTvShows>(),
      ));
  getIt.registerLazySingleton<GetMoviesBy>(() => GetMoviesBy(repository: getIt<AppRepository>()));
  getIt.registerLazySingleton<GetTvShowsBy>(() => GetTvShowsBy(repository: getIt<AppRepository>()));

  // blocs
  getIt.registerLazySingleton<AppBloc>(() => AppBloc());
  getIt.registerLazySingleton<MainBloc>(() => MainBloc());
  getIt.registerLazySingleton<MoviesBloc>(() => MoviesBloc(getMoviesModel: getIt<GetMoviesModel>()));
  getIt.registerLazySingleton<TvShowsBloc>(() => TvShowsBloc(getTvShowsModel: getIt<GetTvShowsModel>()));
  getIt.registerLazySingleton<ProfileBloc>(() => ProfileBloc());
  // bloc with injected parameter
  getIt.registerFactoryParam<DiscoverBloc, DiscoverPayload, void>((param1, param2) => DiscoverBloc(
        payload: param1,
        getMoviesBy: getIt<GetMoviesBy>(),
        getTvShowsBy: getIt<GetTvShowsBy>(),
      ));

  // router
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
}
