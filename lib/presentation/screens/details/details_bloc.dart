import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovi_time/domain/models/movie_entity.dart';
import 'package:moovi_time/domain/models/tvshow_entity.dart';
import 'package:moovi_time/domain/usecases/base/app_error.dart';
import 'package:moovi_time/domain/usecases/base/app_result.dart';
import 'package:moovi_time/domain/usecases/discover_by_type.dart';
import 'package:moovi_time/domain/usecases/get_movies_by.dart';
import 'package:moovi_time/domain/usecases/get_tvshows_by.dart';
import 'package:moovi_time/presentation/screens/details/details_event.dart';
import 'package:moovi_time/presentation/screens/details/details_payload.dart';
import 'package:moovi_time/presentation/screens/details/details_state.dart';
import 'package:moovi_time/presentation/screens/details/details_type.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final DetailsPayload payload;
  final GetMoviesBy getMoviesBy;
  final GetTvShowsBy getTvShowsBy;

  DetailsBloc({
    required this.payload,
    required this.getMoviesBy,
    required this.getTvShowsBy,
  }) : super(const DetailsState(
          isLoading: true,
          items: [],
        )) {
    on<DetailsEvent>((event, emit) async {
      await event.when(
        init: () async {
          switch (payload.type) {
            case DetailsType.movie:
              AppResult<List<MovieEntity>, AppError> result = await getMoviesBy.call(GetMoviesByParams(
                type: DiscoverByType.byGenres,
                genreId: payload.id,
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
            case DetailsType.tvShow:
              AppResult<List<TvShowEntity>, AppError> result = await getTvShowsBy.call(GetTvShowsByParams(
                type: DiscoverByType.byGenres,
                genreId: payload.id,
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
