import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovi_time/domain/usecases/base/app_error.dart';
import 'package:moovi_time/domain/usecases/base/app_result.dart';
import 'package:moovi_time/domain/usecases/base/no_params.dart';
import 'package:moovi_time/domain/usecases/gethomemodel/get_home_model.dart';
import 'package:moovi_time/domain/usecases/gethomemodel/home_model_result.dart';
import 'package:moovi_time/presentation/screens/home/home_event.dart';
import 'package:moovi_time/presentation/screens/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeModel getHomeModel;

  HomeBloc({
    required this.getHomeModel,
  }) : super(const HomeState(
          isLoading: true,
          nowPlayingMovies: [],
          popularMovies: [],
          comingSoonMovies: [],
    topRatedMovies: [],
        )) {
    on<HomeEvent>((event, emit) async {
      await event.when(
        init: () async {
          AppResult<HomeModelResult, AppError> homeModelResult = await getHomeModel.call(const NoParams());
          debugPrint("[App] [NowPlayingBloc] {NowPlayingBloc} result:$homeModelResult");

          homeModelResult.when(
            success: (data) {
              emit(state.copyWith(
                isLoading: false,
                nowPlayingMovies: data.nowPlayingMovies,
                popularMovies: data.popularMovies,
                comingSoonMovies: data.comingSoonMovies,
                topRatedMovies: data.topRatedMovies,
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
    getHomeModel.onDispose();
    super.close();
  }
}
