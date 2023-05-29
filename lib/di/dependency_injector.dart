import 'package:dio/dio.dart';
import 'package:moovi_time/data/config.dart';
import 'package:moovi_time/data/datasources/remote/tmdb_api_service.dart';
import 'package:moovi_time/data/repositories/app_repository_impl.dart';
import 'package:moovi_time/domain/repositories/app_repository.dart';
import 'package:moovi_time/domain/usecases/get_movies_coming_soon.dart';
import 'package:moovi_time/domain/usecases/get_movies_now_playing.dart';
import 'package:moovi_time/domain/usecases/get_movies_popular.dart';
import 'package:moovi_time/domain/usecases/get_movies_top_rated.dart';
import 'package:moovi_time/domain/usecases/gethomemodel/get_home_model.dart';
import 'package:moovi_time/presentation/navigation/app_router.dart';
import 'package:moovi_time/presentation/screens/home/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

// Dependency injection
Future<void> initDependencies() async {
  final dio = Dio();
  dio.options.queryParameters = {"api_key": Config.apiKey};
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    compact: false,
  ));

  // repositories and data sources
  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<TmdbApiService>(() => TmdbApiService(getIt<Dio>()));
  getIt.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(tmdbApiService: getIt<TmdbApiService>()));

  // use cases
  getIt.registerLazySingleton<GetMoviesNowPlaying>(() => GetMoviesNowPlaying(repository: getIt<AppRepository>()));
  getIt.registerLazySingleton<GetMoviesPopular>(() => GetMoviesPopular(repository: getIt<AppRepository>()));
  getIt.registerLazySingleton<GetMoviesComingSoon>(() => GetMoviesComingSoon(repository: getIt<AppRepository>()));
  getIt.registerLazySingleton<GetMoviesTopRated>(() => GetMoviesTopRated(repository: getIt<AppRepository>()));
  getIt.registerLazySingleton<GetHomeModel>(
    () => GetHomeModel(
      getMoviesNowPlaying: getIt<GetMoviesNowPlaying>(),
      getMoviesPopular: getIt<GetMoviesPopular>(),
      getMoviesComingSoon: getIt<GetMoviesComingSoon>(),
      getMoviesTopRated: getIt<GetMoviesTopRated>(),
    ),
  );

  // blocs
  getIt.registerLazySingleton<HomeBloc>(() => HomeBloc(getHomeModel: getIt<GetHomeModel>()));

  // router
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
}
