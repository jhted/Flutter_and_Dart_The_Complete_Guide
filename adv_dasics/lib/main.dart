import 'package:flutter/material.dart';
import 'package:adv_dasics/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 82, 5, 153),
                Color.fromARGB(255, 82, 4, 92),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ),
          ),
          child: const StartScreen(),
        ),
      ),
    ),
  );
}
