import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_bloc/logic/counter_logic/counter_logic.dart';

void main() {
  group("CounterBloc test", () {
    late CounterBloc counterBloc;
    setUp(() {
      counterBloc = CounterBloc();
    });
    tearDown(() {
      counterBloc.close();
    });

    test("CounterBLoc initialVal is 0", () {
      expect(counterBloc.state, const CounterInitial(0));
    });

    blocTest(
      'Bloc should emit CounterIncreased() state when IncreaseCounter() event is dispatched',
      build: () => counterBloc,
      act: (CounterBloc bloc) {
        bloc.add(IncreaseCounter());
      },
      expect: () => [const CounterIncreased(1)],
    );

    blocTest(
      'Bloc should emit CounterDecreased() state when DecreaseCounter() event is dispatched',
      build: () => counterBloc,
      act: (CounterBloc bloc) {
        bloc.add(DecreaseCounter());
      },
      expect: () => [const CounterDecreased(-1)],
    );

  });
}
