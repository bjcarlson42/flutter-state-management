import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/counter_provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example App (${context.watch<Counter>().count})'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'You have pushed the button this many times: ${context.watch<Counter>().count}'),
            Count(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Text('Launch screen'),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: Key('decrement_floatingActionButton'),
            onPressed: () => context.read<Counter>().decrement(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            key: Key('reset_floatingActionButton'),
            onPressed: () => context.read<Counter>().reset(),
            tooltip: 'Reset',
            child: Icon(Icons.exposure_zero),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            key: Key('increment_floatingActionButton'),
            onPressed: () => context.read<Counter>().increment(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class Count extends StatelessWidget {
  Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<Counter>().count}',
        key: Key('counterState'), style: Theme.of(context).textTheme.headline4);
  }
}