import 'package:common_base/object/result_state.dart';

extension ResultStateChecking on ResultState {
  bool get isLoading => this is LoadingState;

  bool get isSuccess => this is SuccessState;

  bool get isError => this is ErrorState;

  bool get isIdle => this is IdleState;

  SuccessState get success => this as SuccessState;

  bool get stable => (isIdle && data != null);
}
