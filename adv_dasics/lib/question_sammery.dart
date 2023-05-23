import 'package:flutter/material.dart';

class QuestionSummery extends StatelessWidget {
  const QuestionSummery({super.key, required this.summeryData});

  final List<Map<String, Object>> summeryData;

  @override
  Widget build(context) {
    return Column(
      children: summeryData.map((data) {
        return Row(
          children: [
            Text(((data['question_index'] as int) + 1).toString()),
            Expanded(
              child: Column(
                children: [
                  Text(data['question'] as String),
                  const SizedBox(height: 5),
                  Text(data['correct_answer'] as String),
                  const SizedBox(height: 5),
                  Text(data['user_answer'] as String),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
