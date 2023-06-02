import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovi_time/domain/usecases/base/app_error.dart';
import 'package:moovi_time/domain/usecases/base/app_result.dart';
import 'package:moovi_time/domain/usecases/base/no_params.dart';
import 'package:moovi_time/domain/usecases/getmoviesmodel/get_movies_model.dart';
import 'package:moovi_time/domain/usecases/getmoviesmodel/movies_model_result.dart';
import 'package:moovi_time/presentation/screens/discover/discover_event.dart';
import 'package:moovi_time/presentation/screens/discover/discover_state.dart';
import 'package:moovi_time/presentation/screens/movies/movies_event.dart';
import 'package:moovi_time/presentation/screens/movies/movies_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final GetMoviesModel getMoviesModel;

  DiscoverBloc({
    required this.getMoviesModel,
  }) : super(const DiscoverState(
          isLoading: true,
          items: [],
        )) {
    on<DiscoverEvent>((event, emit) async {
      await event.when(
        init: () async {
        },
      );
    });
  }

  @override
  Future<void> close() async {
    getMoviesModel.onDispose();
    super.close();
  }
}
