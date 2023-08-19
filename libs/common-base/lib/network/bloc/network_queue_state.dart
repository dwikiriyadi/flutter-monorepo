part of 'network_queue_view_model.dart';

class NetworkQueueState extends Equatable {
  final bool retrying;
  final Map<String, ResultState> results;

  const NetworkQueueState({this.retrying = false, this.results = const {}});

  NetworkQueueState copy({Map<String, ResultState>? results, bool? retrying}) {
    return NetworkQueueState(
        retrying: retrying ?? this.retrying, results: results ?? this.results);
  }

  @override
  List<Object?> get props => [retrying, results];

  @override
  bool? get stringify => true;
}
