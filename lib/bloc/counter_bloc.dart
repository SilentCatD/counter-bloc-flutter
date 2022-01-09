import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(int initialVal) : super(CounterInitial(initialVal)) {
    on<IncreaseCounter>(_onIncreaseCounter);
    on<DecreaseCounter>(_onDecreaseCounter);
  }

  void _onIncreaseCounter(IncreaseCounter event, Emitter emit) {
    var currentVal = state.value;
    currentVal++;
    emit(CounterIncreased(currentVal));
  }

  void _onDecreaseCounter(DecreaseCounter event, Emitter emit) {
    var currentVal = state.value;
    currentVal--;
    emit(CounterDecreased(currentVal));
  }
}
