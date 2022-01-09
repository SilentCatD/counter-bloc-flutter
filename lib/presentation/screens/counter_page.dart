import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/logic/bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage(
      {Key? key,  this.index=0})
      : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen $index"),
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      /// Important, must use a different context here mul
                      builder: (_) =>
                          BlocProvider.value(
                            value: context.read<CounterBloc>(),
                            child:  CounterPage(
                              index: index+1,
                            ),
                          ),
                    ),
                  );
                },
                child:  Text("Switch to screen ${index+1}")),
          ],
        ),
      ),
    );
  }
}
