import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_dasics/answer_button.dart';
import 'package:adv_dasics/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var correntQquestionIndex = 0;

  void anwserQuextion(String answer) {
    widget.onSelectAnswer(answer);

    setState(() {
      correntQquestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[correntQquestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 255, 206, 253),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShaffledAnswers().map((answer) {
              return AnswerButton(
                onTap: () {
                  anwserQuextion(answer);
                },
                answerText: answer,
              );
            }),
          ],
        ),
      ),
    );
  }
}
