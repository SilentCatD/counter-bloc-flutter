import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/logic/counter_bloc//counter_bloc.dart';

import 'counter_page_1.dart';

class CounterPage3 extends StatelessWidget {
  const CounterPage3({Key? key}) : super(key: key);
  static const routeName = '/counter-page-3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 3"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "This is your value",
              style: TextStyle(fontSize: 20),
            ),
            BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {
                late String snackBarText;
                if (state is CounterIncreased) {
                  snackBarText = "Counter value increased";
                } else {
                  snackBarText = "Counter value decreased";
                }
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(snackBarText),
                    duration: const Duration(milliseconds: 500),
                  ),
                );
              },
              builder: (context, state) {
                return Text(
                  state.value.toString(),
                  style: const TextStyle(fontSize: 35),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncreaseCounter());
                  },
                  child: const Icon(Icons.add),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecreaseCounter());
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(CounterPage1.routeName);
              },
              child: const Text("Switch to screen 1"),
            ),
          ],
        ),
      ),
    );
  }
}
