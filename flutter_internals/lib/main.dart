import 'package:flutter/material.dart';
import 'package:flutter_internals/keys/keys.dart';

void main() {
  // const n umber = [1, 2, 3, 4];
  // number.add((5));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Internals'),
        ),
        body: const Keys(),
      ),
    );
  }
}
