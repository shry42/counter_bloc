import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/counter_event.dart';
import 'package:flutter_bloc_example/counter_state.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  int counter = 0;

  CounterBloc() : super(InitialState()) {
    on<NumberIncreaseEvent>(onNumberIncrease);
    on<NumberDecreaseEvent>(onNumberDecrease);
  }

  void onNumberIncrease(
      NumberIncreaseEvent event, Emitter<CounterStates> emit) async {
    counter = counter + 1;
    emit(UpdateState(counter));
  }

  void onNumberDecrease(
      NumberDecreaseEvent event, Emitter<CounterStates> emit) async {
    if (counter == 0) {
      return;
    }
    counter = counter - 1;
    emit(UpdateState(counter));
  }
}
