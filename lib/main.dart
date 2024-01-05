import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/counter_bloc.dart';
import 'package:flutter_bloc_example/counter_event.dart';
import 'package:flutter_bloc_example/counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Demo App"),
      ),
      body: BlocBuilder<CounterBloc, CounterStates>(builder: ((context, state) {
        if (state is InitialState) {
          return _counter(context, 0);
        }
        if (state is UpdateState) {
          return _counter(context, state.counter);
        }
        return Container();
      })),
    );
  }

  Widget _counter(BuildContext context, int counter) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            counter.toString(),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  context.read<CounterBloc>().add(NumberDecreaseEvent());
                },
                color: Colors.grey,
                elevation: 0,
                height: 50,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: const Text(
                  "-",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
              const SizedBox(width: 50),
              MaterialButton(
                onPressed: () {
                  context.read<CounterBloc>().add(NumberIncreaseEvent());
                },
                color: Colors.grey,
                elevation: 0,
                height: 50,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Text(
                  "+",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
