extension AllInstances on Iterable {
  bool allInstances<E>() {
    if (isEmpty) return true;
    for (dynamic element in this) {
      if (element is! E) return false;
    }
    return true;
  }
}

extension Find<T> on Iterable<T> {
  T? find(bool Function(T) predicate) {
    for (T element in this) {
      if (predicate(element)) return element;
    }
    return null;
  }
}

