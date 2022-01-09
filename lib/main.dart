import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/logic/bloc/counter_bloc.dart';
import 'package:learn_bloc/presentation/router/app_router.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  CounterApp({Key? key}) : super(key: key);
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        initialRoute: _router.initialRoute,
        onGenerateRoute: _router.onGenerateRouteRoute,
      ),
    );
  }
}
