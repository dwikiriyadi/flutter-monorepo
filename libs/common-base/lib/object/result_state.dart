import 'package:equatable/equatable.dart';

class ResultState<T> extends Equatable {
  final int code;
  final String message;
  final T? data;

  const ResultState({required this.code, required this.message, this.data});

  @override
  List<Object?> get props => [code, message, data];
}

class LoadingState<T> extends ResultState<T> {
  const LoadingState({T? previous})
      : super(code: 0, message: "", data: previous);
}

class IdleState<T> extends ResultState<T> {
  const IdleState({T? previous}) : super(code: 0, message: "", data: previous);
}

class SuccessState<T> extends ResultState<T> {
  @override
  // ignore: overridden_fields
  final T data;

  const SuccessState({required this.data})
      : super(code: 200, message: "", data: data);
}

class ErrorState<T> extends ResultState<T> {
  final String statusCode;

  const ErrorState(
      {required super.code,
      required this.statusCode,
      required super.message,
      T? previous})
      : super(data: previous);
}
