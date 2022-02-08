import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        BlocBuilder<CounterCubit, CounterInitial>(
          builder: (context, state) {
            return Text(state.counterValue.toString());
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildBtn("Sub",
                () => BlocProvider.of<CounterCubit>(context).decrement()),
            buildBtn("Add",
                () => BlocProvider.of<CounterCubit>(context).increment()),
          ],
        )
      ]),
    );
  }

  Widget buildBtn(String text, Function myFunction) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(onPressed: () => myFunction(), child: Text(text)),
      );
}
