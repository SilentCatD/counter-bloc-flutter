import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/logic/counter_bloc//counter_bloc.dart';
import 'package:learn_bloc/presentation/screens/screens.dart';

class AppRouter {
  /// add a bunch of Blocs/Cubits here
  final _counterBloc = CounterBloc();
  final String initialRoute = CounterPage1.routeName;

  Route? onGenerateRouteRoute(RouteSettings settings) {
    switch (settings.name!) {
      case CounterPage1.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterBloc,
            child: const CounterPage1(),
          ),
        );
      case CounterPage2.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterBloc,
            child: const CounterPage2(),
          ),
        );
      case CounterPage3.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterBloc,
            child: const CounterPage3(),
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    _counterBloc.close();
  }
}
