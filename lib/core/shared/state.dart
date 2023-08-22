import '../errors/failures.dart';

class ListState<T, E> {
  final List<T> data;
  final E status;
  final Failure? failure;

  const ListState._({
    this.data = const [],
    required this.status,
    this.failure,
  });

  factory ListState.initial(E status) {
    return ListState._(
      status: status,
    );
  }

  copyWith({
    List<T>? data,
    required E status,
    Failure? failure,
  }) {
    return ListState._(
      data: data ?? this.data,
      status: status,
      failure: failure,
    );
  }
}

class ValueState<T, E> {
  final T? value;
  final E status;
  final Failure? failure;

  const ValueState._({
    this.value,
    required this.status,
    this.failure,
  });

  factory ValueState.initial(E status) {
    return ValueState._(
      status: status,
    );
  }

  copyWith({
    T? value,
    required E status,
    Failure? failure,
  }) {
    return ValueState._(
      value: value,
      status: status,
      failure: failure,
    );
  }
}