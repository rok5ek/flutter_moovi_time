import 'package:moovi_time/domain/models/movie_entity.dart';
import 'package:moovi_time/domain/repositories/app_repository.dart';
import 'package:moovi_time/domain/usecases/base/app_error.dart';
import 'package:moovi_time/domain/usecases/base/app_result.dart';
import 'package:moovi_time/domain/usecases/base/use_case.dart';
import 'package:moovi_time/domain/usecases/discover_by_type.dart';

class GetMoviesBy
    extends UseCase<AppResult<List<MovieEntity>, AppError>, GetMoviesByParams> {
  final AppRepository repository;

  GetMoviesBy({required this.repository});

  @override
  Future<AppResult<List<MovieEntity>, AppError>> call(
      GetMoviesByParams params) async {
    return await repository.getMoviesBy(cancelToken, params);
  }
}

class GetMoviesByParams {
  final DiscoverByType type;
  final int genreId;

  GetMoviesByParams({required this.type, required this.genreId});
}
