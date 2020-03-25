import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestions;

  Quiz({this.questions, this.questionIndex, this.answerQuestions});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(
        question: questions[questionIndex]['questionText'],
      ),
      ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
          .map((answer) {
        return Answer(
          answerText: answer['text'],
          handelSelected: () => answerQuestions(answer['score']),
        );
      }).toList()
    ]);
  }
}
