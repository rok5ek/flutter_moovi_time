import 'package:moovi_time/domain/usecases/base/app_result.dart';

R? result2<R, T1, T2>(
  AppResult result1,
  AppResult result2, {
  required R Function(Success, Success) onSuccess,
  required R Function(Error) onError,
  required R Function(Failure) onException,
}) {
  if (result1 is Failure) {
    return onException(result1);
  } else if (result2 is Failure) {
    return onException(result2);
  } else if (result1 is Error) {
    return onError(result1);
  } else if (result2 is Error) {
    return onError(result2);
  } else if (result1 is Success && result2 is Success) {
    return onSuccess(result1, result2);
  }
  return null;
}

R? result3<R, T1, T2, T3>(
  AppResult result1,
  AppResult result2,
  AppResult result3, {
  required R Function(Success, Success, Success) onSuccess,
  required R Function(Error) onError,
  required R Function(Failure) onException,
}) {
  if (result1 is Failure) {
    return onException(result1);
  } else if (result2 is Failure) {
    return onException(result2);
  } else if (result3 is Failure) {
    return onException(result3);
  } else if (result1 is Error) {
    return onError(result1);
  } else if (result2 is Error) {
    return onError(result2);
  } else if (result3 is Error) {
    return onError(result3);
  } else if (result1 is Success && result2 is Success && result3 is Success) {
    return onSuccess(result1, result2, result3);
  }
  return null;
}

R? result4<R, T1, T2, T3, T4>(
  AppResult result1,
  AppResult result2,
  AppResult result3,
  AppResult result4, {
  required R Function(Success, Success, Success, Success) onSuccess,
  required R Function(Error) onError,
  required R Function(Failure) onException,
}) {
  if (result1 is Failure) {
    return onException(result1);
  } else if (result2 is Failure) {
    return onException(result2);
  } else if (result3 is Failure) {
    return onException(result3);
  } else if (result4 is Failure) {
    return onException(result4);
  } else if (result1 is Error) {
    return onError(result1);
  } else if (result2 is Error) {
    return onError(result2);
  } else if (result3 is Error) {
    return onError(result3);
  } else if (result4 is Error) {
    return onError(result4);
  } else if (result1 is Success && result2 is Success && result3 is Success && result4 is Success) {
    return onSuccess(result1, result2, result3, result4);
  }
  return null;
}
