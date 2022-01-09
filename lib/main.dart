import 'package:flutter/material.dart';
import 'package:learn_bloc/presentation/router/app_router.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: _router.initialRoute,
      onGenerateRoute: _router.onGenerateRouteRoute,
    );
  }

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }
}
