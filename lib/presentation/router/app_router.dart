import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/logic/counter_logic/counter_logic.dart';
import 'package:learn_bloc/presentation/screens/screens.dart';

class AppRouter {
  /// add a bunch of Blocs/Cubits here
  final _counterBloc = CounterBloc();
  final String initialRoute = CounterScreen.routeName;

  Route? onGenerateRouteRoute(RouteSettings settings) {
    switch (settings.name!) {
      case CounterScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterBloc,
            child: const CounterScreen(),
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    /// dispose all blocs/cubits here
    _counterBloc.close();
  }
}
