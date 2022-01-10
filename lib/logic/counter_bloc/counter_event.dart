part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class IncreaseCounter extends CounterEvent{}

class DecreaseCounter extends CounterEvent{}
