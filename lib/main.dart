import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "what\'s your favorite color ? ",
      "answers": [
        {'text': 'Black', 'score': 10},
        {'text': 'white', 'score': 1},
        {'text': 'blue', 'score': 6}
      ],
    },
    {
      "questionText": "what\'s your favorite animal? ",
      'answers': [
        {'text': 'Rabbit', 'score': 7},
        {'text': 'Snake', 'score': 0},
        {'text': 'Elephant', 'score': 10},
        {'text': 'Lion', 'score': 2}
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Rania', 'score': 10},
        {'text': 'Rania', 'score': 1},
        {'text': 'Rania', 'score': 10},
        {'text': 'Rania', 'score': 5},
      ],
    },
  ];
  var _questionIndex = 0;
  var _toltalScore = 0;
  void _answerQuestion(int score) {
    _toltalScore += score;
    print(_toltalScore);
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetHandler() {
    setState(() {
      _questionIndex = 0;
      _toltalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("my first app"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestions: _answerQuestion,
              )
            : Result(score: _toltalScore, resetHandler: _resetHandler),
      ),
    );
  }
}
