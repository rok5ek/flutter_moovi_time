import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovi_time/domain/models/movie_entity.dart';
import 'package:moovi_time/domain/models/tvshow_entity.dart';
import 'package:moovi_time/domain/usecases/base/app_error.dart';
import 'package:moovi_time/domain/usecases/base/app_result.dart';
import 'package:moovi_time/domain/usecases/discover_by_type.dart';
import 'package:moovi_time/domain/usecases/get_movies_by.dart';
import 'package:moovi_time/domain/usecases/get_tvshows_by.dart';
import 'package:moovi_time/presentation/screens/discover/discover_event.dart';
import 'package:moovi_time/presentation/screens/discover/discover_payload.dart';
import 'package:moovi_time/presentation/screens/discover/discover_state.dart';
import 'package:moovi_time/presentation/screens/discover/discover_type.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final DiscoverPayload payload;
  final GetMoviesBy getMoviesBy;
  final GetTvShowsBy getTvShowsBy;

  DiscoverBloc({
    required this.payload,
    required this.getMoviesBy,
    required this.getTvShowsBy,
  }) : super(const DiscoverState(
          isLoading: true,
          items: [],
        )) {
    on<DiscoverEvent>((event, emit) async {
      await event.when(
        init: () async {
          switch (payload.type) {
            case DiscoverType.movie:
              AppResult<List<MovieEntity>, AppError> result = await getMoviesBy.call(GetMoviesByParams(
                type: DiscoverByType.byGenres,
                genreId: payload.genreId,
              ));
              result.when(
                success: (data) {
                  emit(state.copyWith(
                    isLoading: false,
                    items: data.map((MovieEntity e) => e.toItem()).toList(),
                  ));
                },
                error: (error) {},
                failure: (failure) {},
              );
              break;
            case DiscoverType.tvShow:
              AppResult<List<TvShowEntity>, AppError> result = await getTvShowsBy.call(GetTvShowsByParams(
                type: DiscoverByType.byGenres,
                genreId: payload.genreId,
              ));
              result.when(
                success: (data) {
                  emit(state.copyWith(
                    isLoading: false,
                    items: data.map((TvShowEntity e) => e.toItem()).toList(),
                  ));
                },
                error: (error) {},
                failure: (failure) {},
              );
              break;
          }
        },
      );
    });
  }

  @override
  Future<void> close() async {
    getMoviesBy.onDispose();
    getTvShowsBy.onDispose();
    super.close();
  }
}
