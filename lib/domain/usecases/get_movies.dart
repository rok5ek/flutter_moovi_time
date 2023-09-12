import 'package:moovi_time/domain/models/movie_entity.dart';
import 'package:moovi_time/domain/repositories/app_repository.dart';
import 'package:moovi_time/domain/usecases/base/app_error.dart';
import 'package:moovi_time/domain/usecases/base/app_result.dart';
import 'package:moovi_time/domain/usecases/base/use_case.dart';
import 'package:moovi_time/domain/usecases/movie_list_type.dart';

class GetMovies
    extends UseCase<AppResult<List<MovieEntity>, AppError>, GetMoviesParams> {
  final AppRepository repository;

  GetMovies({required this.repository});

  @override
  Future<AppResult<List<MovieEntity>, AppError>> call(
      GetMoviesParams params) async {
    return await repository.getMovies(cancelToken, params);
  }
}

class GetMoviesParams {
  final MovieListType type;

  GetMoviesParams({required this.type});
}
