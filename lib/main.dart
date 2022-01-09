import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/logic/bloc/counter_bloc.dart';
import 'package:learn_bloc/presentation/screens/counter_page_1.dart';
import 'package:learn_bloc/presentation/screens/counter_page_2.dart';
import 'package:learn_bloc/presentation/screens/counter_page_3.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  final _counterBloc = CounterBloc();

  /// Only provide access for widgets that need it
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: CounterPage1.routeName,
      routes: {
        CounterPage1.routeName: (context) => BlocProvider.value(
              value: _counterBloc,
              child: const CounterPage1(),
            ),
        CounterPage2.routeName: (context) => BlocProvider.value(
              value: _counterBloc,
              child: const CounterPage2(),
            ),
        CounterPage3.routeName: (context) => BlocProvider.value(
              value: _counterBloc,
              child: const CounterPage3(),
            ),
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _counterBloc.close();
  }
}
