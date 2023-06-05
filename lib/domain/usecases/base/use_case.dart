import 'package:dio/dio.dart';

abstract class UseCase<T, Params> {
  CancelToken cancelToken = CancelToken();

  Future<T> call(Params params);

  void onDispose();
}
