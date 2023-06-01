import 'package:moovi_time/domain/models/genre_entity.dart';
import 'package:moovi_time/domain/repositories/app_repository.dart';
import 'package:moovi_time/domain/usecases/base/app_error.dart';
import 'package:moovi_time/domain/usecases/base/app_result.dart';
import 'package:moovi_time/domain/usecases/base/use_case.dart';
import 'package:moovi_time/domain/usecases/genre_list_type.dart';

class GetGenres extends UseCase<AppResult<List<GenreEntity>, AppError>, GetGenresParams> {
  final AppRepository repository;

  GetGenres({required this.repository});

  @override
  Future<AppResult<List<GenreEntity>, AppError>> call(GetGenresParams params) async {
    return await repository.getGenres(cancelToken, params);
  }

  @override
  void onDispose() {
    cancelToken.cancel();
  }
}

class GetGenresParams {
  final GenreListType type;

  GetGenresParams({required this.type});
}
