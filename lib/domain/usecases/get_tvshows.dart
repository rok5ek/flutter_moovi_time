import 'package:moovi_time/domain/models/tvshow_entity.dart';
import 'package:moovi_time/domain/repositories/app_repository.dart';
import 'package:moovi_time/domain/usecases/base/app_error.dart';
import 'package:moovi_time/domain/usecases/base/app_result.dart';
import 'package:moovi_time/domain/usecases/base/use_case.dart';
import 'package:moovi_time/domain/usecases/tvshow_list_type.dart';

class GetTvShows extends UseCase<AppResult<List<TvShowEntity>, AppError>, GetTvShowsParams> {
  final AppRepository repository;

  GetTvShows({required this.repository});

  @override
  Future<AppResult<List<TvShowEntity>, AppError>> call(GetTvShowsParams params) async {
    return await repository.getTvShows(cancelToken, params);
  }

  @override
  void onDispose() {
    cancelToken.cancel();
  }
}

class GetTvShowsParams {
  final TvShowListType type;

  GetTvShowsParams({required this.type});
}
