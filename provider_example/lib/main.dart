import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/counter_provider.dart';
import 'package:provider_example/providers/shopping_cart_provider.dart';
import 'package:provider_example/screens/home_screen.dart';
import 'package:provider_example/screens/second_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => ShoppingCart()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/second': (context) => SecondScreen(),
      },
    );
  }
}
