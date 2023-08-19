import 'package:common_base/common_base.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'network_queue_state.dart';

class NetworkQueueViewModel extends Cubit<NetworkQueueState> {
  NetworkQueueViewModel() : super(const NetworkQueueState());

  void setRetrying(bool value) {
    emit(state.copy(retrying: value));
  }

  void addResult(String key, ResultState result) {
    emit(state.copy(results: {
      ...state.results,
      key: result,
    }));
  }
}
