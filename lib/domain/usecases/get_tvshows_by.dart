import 'package:moovi_time/domain/models/tvshow_entity.dart';
import 'package:moovi_time/domain/repositories/app_repository.dart';
import 'package:moovi_time/domain/usecases/base/app_error.dart';
import 'package:moovi_time/domain/usecases/base/app_result.dart';
import 'package:moovi_time/domain/usecases/base/use_case.dart';
import 'package:moovi_time/domain/usecases/discover_by_type.dart';

class GetTvShowsBy extends UseCase<AppResult<List<TvShowEntity>, AppError>,
    GetTvShowsByParams> {
  final AppRepository repository;

  GetTvShowsBy({required this.repository});

  @override
  Future<AppResult<List<TvShowEntity>, AppError>> call(
      GetTvShowsByParams params) async {
    return await repository.getTvShowsBy(cancelToken, params);
  }
}

class GetTvShowsByParams {
  final DiscoverByType type;
  final int genreId;

  GetTvShowsByParams({required this.type, required this.genreId});
}
