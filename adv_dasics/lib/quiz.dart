import 'package:adv_dasics/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_dasics/start_screen.dart';
import 'package:adv_dasics/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void chooseAnser(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
    setState(() {
      activeScreen = "start-screen";
      selectedAnswers = [];
    });
    }
  }

  @override
  Widget build(context) {
    Widget screeWidget = StartScreen(switchScreen);
    if (activeScreen == "question-screen") {
      screeWidget = QuestionScreen(
        onSelectAnswer: chooseAnser,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 82, 4, 92),
                Color.fromARGB(255, 82, 5, 153),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screeWidget,
        ),
      ),
    );
  }
}
