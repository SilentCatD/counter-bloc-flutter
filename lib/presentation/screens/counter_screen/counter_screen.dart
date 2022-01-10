import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/logic/counter_logic/counter_logic.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);
  static const routeName = '/counter-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter screen"),
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
          ],
        ),
      ),
    );
  }
}
