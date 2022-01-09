import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/logic/bloc/counter_bloc.dart';
import 'package:learn_bloc/presentation/screens/counter_page_1.dart';
import 'package:learn_bloc/presentation/screens/counter_page_2.dart';
import 'package:learn_bloc/presentation/screens/counter_page_3.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        initialRoute: CounterPage1.routeName,
        routes: {
          CounterPage1.routeName: (context) => const CounterPage1(),
          CounterPage2.routeName: (context) => const CounterPage2(),
          CounterPage3.routeName: (context) => const CounterPage3(),
        },
      ),
    );
  }
}
