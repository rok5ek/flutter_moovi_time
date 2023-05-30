import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovi_time/domain/usecases/base/app_error.dart';
import 'package:moovi_time/domain/usecases/base/app_result.dart';
import 'package:moovi_time/domain/usecases/base/no_params.dart';
import 'package:moovi_time/domain/usecases/gettvshowsmodel/get_tvshows_model.dart';
import 'package:moovi_time/domain/usecases/gettvshowsmodel/tvshows_model_result.dart';
import 'package:moovi_time/presentation/screens/tvshows/tvshows_event.dart';
import 'package:moovi_time/presentation/screens/tvshows/tvshows_state.dart';

class TvShowsBloc extends Bloc<TvShowsEvent, TvShowsState> {
  final GetTvShowsModel getTvShowsModel;

  TvShowsBloc({
    required this.getTvShowsModel,
  }) : super(const TvShowsState(
          isLoading: true,
          airingTodayShows: [],
          onTheAirShows: [],
          popularShows: [],
          topRatedShows: [],
        )) {
    on<TvShowsEvent>((event, emit) async {
      await event.when(
        init: () async {
          AppResult<TvShowsModelResult, AppError> result = await getTvShowsModel.call(const NoParams());
          debugPrint("[App] [TvShowsBloc] {TvShowsBloc} result:$result");

          result.when(
            success: (data) {
              emit(state.copyWith(
                isLoading: false,
                airingTodayShows: data.airingTodayShows,
                onTheAirShows: data.onTheAirShows,
                popularShows: data.popularShows,
                topRatedShows: data.topRatedShows,
              ));
            },
            error: (error) {},
            failure: (failure) {},
          );
        },
      );
    });
  }

  @override
  Future<void> close() async {
    getTvShowsModel.onDispose();
    super.close();
  }
}
