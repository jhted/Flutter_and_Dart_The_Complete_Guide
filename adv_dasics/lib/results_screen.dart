import 'package:adv_dasics/question_sammery.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_dasics/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.choosenAnswers,
    required this.resetAapp,
  });

  final List<String> choosenAnswers;
  final void Function() resetAapp;

  List<Map<String, Object>> getSummeryData() {
    final List<Map<String, Object>> summery = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summery.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i]
      });
    }

    return summery;
  }

  @override
  Widget build(context) {
    final summeryData = getSummeryData();
    final numTotalQuestions = questions.length;
    final numCoreectQuestions = summeryData.where((x) {
      return x['correct_answer'] == x['user_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have answered $numCoreectQuestions out of $numTotalQuestions questions correctly!",
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 255, 206, 253),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionSummery(summeryData: summeryData),
            const SizedBox(height: 30),
            TextButton(
              onPressed: resetAapp,
              child: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
