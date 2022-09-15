part of 'home_view_model.dart';

class HomeViewState extends Equatable {
  final int count;

  const HomeViewState({this.count = 0});

  HomeViewState copy({
    int? count,
  }) =>
      HomeViewState(count: count ?? this.count);

  @override
  List<Object?> get props => [count];

  @override
  bool get stringify => true;
}
