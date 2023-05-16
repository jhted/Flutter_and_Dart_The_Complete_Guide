import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 138, 7, 150),
                Color.fromARGB(255, 140, 0, 255),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/quiz-logo.png',
                  width: 300,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text("Learn Flutter the fun way!",style: TextStyle(fontSize: 20,color: Colors.white,),),
                const SizedBox(
                  height: 15,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      // fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  onPressed: () {
                    print("Starting quiz");
                  },
                  child: const Text("Start Quiz"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
