import 'package:moovi_time/domain/models/movie_entity.dart';
import 'package:moovi_time/domain/repositories/app_repository.dart';
import 'package:moovi_time/domain/usecases/base/app_error.dart';
import 'package:moovi_time/domain/usecases/base/app_result.dart';
import 'package:moovi_time/domain/usecases/base/no_params.dart';
import 'package:moovi_time/domain/usecases/base/use_case.dart';

class GetMoviesComingSoon extends UseCase<AppResult<List<MovieEntity>, AppError>, NoParams> {
  final AppRepository repository;

  GetMoviesComingSoon({required this.repository});

  @override
  Future<AppResult<List<MovieEntity>, AppError>> call(NoParams params) async {
    return await repository.getMoviesComingSoon(cancelToken);
  }

  @override
  void onDispose() {
    cancelToken.cancel();
  }
}
