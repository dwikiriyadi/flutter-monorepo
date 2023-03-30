import 'package:equatable/equatable.dart';

class ResultState<T> extends Equatable {
  const ResultState();

  @override
  List<Object?> get props => [];
}

class LoadingState<T> extends ResultState<T> {
  final T? previous;

  const LoadingState({this.previous}) : super();

  @override
  List<Object?> get props => [previous];
}

class IdleState<T> extends ResultState<T> {
  final T? previous;

  const IdleState({this.previous}) : super();

  @override
  List<Object?> get props => [previous];
}

class SuccessState<T> extends ResultState<T> {
  final T data;

  const SuccessState({required this.data}) : super();

  @override
  List<Object?> get props => [data];
}

class ErrorState<T> extends ResultState<T> {
  final int code;
  final String statusCode;
  final String message;
  final T? previous;

  const ErrorState(
      {required this.code,
      required this.statusCode,
      required this.message,
      this.previous})
      : super();

  @override
  List<Object?> get props => [code, statusCode, message, previous];
}
