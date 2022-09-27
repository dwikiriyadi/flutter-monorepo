import 'package:equatable/equatable.dart';

class ResultState<T> extends Equatable {
  final int code;
  final String message;
  final T? data;

  const ResultState({required this.code, required this.message, this.data});

  @override
  List<Object?> get props => [code, message, data];

  static loading<T>({T? previous}) => LoadingState(previous);

  static idle<T>({T? previous}) => IdleState(previous);

  static success<T>(T data) => SuccessState(data: data);

  static error<T>({required int code, required String message, T? previous}) =>
      ErrorState(code: code, message: message, previous: previous);
}

class LoadingState<T> extends ResultState<T> {
  const LoadingState(T? previous) : super(code: 0, message: "", data: previous);
}

class IdleState<T> extends ResultState<T> {
  const IdleState(T? previous) : super(code: 0, message: "", data: previous);
}

class SuccessState<T> extends ResultState<T> {
  const SuccessState({required T data})
      : super(code: 200, message: "", data: data);
}

class ErrorState<T> extends ResultState<T> {
  const ErrorState({required int code, required String message, T? previous})
      : super(code: code, message: message, data: previous);
}
