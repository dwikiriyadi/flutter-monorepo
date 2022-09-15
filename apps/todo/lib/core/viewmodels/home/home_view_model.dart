import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_view_state.dart';

class HomeViewModel extends Cubit<HomeViewState> {
  HomeViewModel() : super(const HomeViewState());

  void increment() => emit(state.copy(count: state.count + 1));

  void test() {

  }
}
