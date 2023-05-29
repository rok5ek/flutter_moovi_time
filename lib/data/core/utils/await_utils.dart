await2<T1, T2, R>(Future<T1> firstFuture, Future<T2> secondFuture, R Function(T1, T2) block) async {
  late final T1 item1;
  late final T2 item2;
  await Future.wait<void>([
    (() async => item1 = await firstFuture)(),
    (() async => item2 = await secondFuture)(),
  ]);
  return block(item1, item2);
}

await3<T1, T2, T3, R>(
  Future<T1> future1,
  Future<T2> future2,
  Future<T3> future3,
  R Function(T1, T2, T3) block,
) async {
  late final T1 item1;
  late final T2 item2;
  late final T3 item3;
  await Future.wait<void>([
    (() async => item1 = await future1)(),
    (() async => item2 = await future2)(),
    (() async => item3 = await future3)(),
  ]);
  return block(item1, item2, item3);
}

await4<T1, T2, T3, T4, R>(
  Future<T1> future1,
  Future<T2> future2,
  Future<T3> future3,
  Future<T4> future4,
  R Function(T1, T2, T3, T4) block,
) async {
  late final T1 item1;
  late final T2 item2;
  late final T3 item3;
  late final T4 item4;
  await Future.wait<void>([
    (() async => item1 = await future1)(),
    (() async => item2 = await future2)(),
    (() async => item3 = await future3)(),
    (() async => item4 = await future4)(),
  ]);
  return block(item1, item2, item3, item4);
}
