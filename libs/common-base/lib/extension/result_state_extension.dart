import 'package:common_base/object/result_state.dart';

extension ResultStateChecking on ResultState {
  bool isLoading() => this is LoadingState;

  bool isSuccess() => this is SuccessState;

  bool isError() => this is ErrorState;

  bool isIdle() => this is IdleState;
}
