import 'package:dio/dio.dart';

abstract class UseCase<T, Params> {
  CancelToken cancelToken = CancelToken();

  Future<T> call(Params params);

  void onDispose() {
    cancelToken.cancel();
    // assign a new cancel token so we can cancel the request the next time
    cancelToken = CancelToken();
  }
}
