import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            height: 300,
            color: const Color.fromARGB(158, 252, 251, 251),
          ),
          const SizedBox(height: 80),
          Text(
            "Learn fluuter the fun eay",
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 255, 206, 253),
                fontSize: 24,
              ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("start Quiz"),
          ),
        ],
      ),
    );
  }
}
