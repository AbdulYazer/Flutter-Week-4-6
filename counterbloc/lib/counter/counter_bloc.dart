import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialState ()) {
    on<Increment>((event, emit){
      final currentState = state.count;
      final incrementState = currentState + 1;
      return emit(CounterState(count: incrementState));
    });
    on<Decrement>((event, emit){
      final currentState = state.count;
      final decrementState = currentState - 1;
      return emit(CounterState(count: decrementState));
    });
  }
}
