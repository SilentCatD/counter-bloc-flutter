part of 'counter_bloc.dart';

@immutable
abstract class CounterState extends Equatable{
  final int value;

  const CounterState(this.value);
}

class CounterInitial extends CounterState {
  const CounterInitial(int value) : super(value);

  @override
  List<Object?> get props => [value];
}

class CounterIncreased extends CounterState {
  const CounterIncreased(int value) : super(value);

  @override
  List<Object?> get props => [value];
}

class CounterDecreased extends CounterState {
  const CounterDecreased(int value) : super(value);

  @override
  List<Object?> get props => [value];
}
