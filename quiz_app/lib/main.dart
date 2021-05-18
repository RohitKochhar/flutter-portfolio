import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

//void main() {
// runApp() is retrieved from material.dart
// runApp(MyApp());
// }

// ^ For multi line main() functions
// v For functions with one argument
void main() => runApp(MyApp());

// Using the extends keyword allows for the defined class to inherit from
// the specified class

// Stateful Widget is retrieved from material.dart
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // _ leading underscore makes it a private variable, only used in this file
    return _MyAppState();
  }
}

// <> points to the class which this class is controlling the state of
class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'What\'s your favorite circuit?',
      'answers': [
        {'text': 'Monza', 'score': 1},
        {'text': 'Imola', 'score': 3},
        {'text': 'Abu Dhabi', 'score': 2},
        {'text': 'Montreal', 'score': 4}
      ],
    },
    {
      'questionText': 'Who\'s your favorite team principal?',
      'answers': [
        {'text': 'Guenther Steiner', 'score': 3},
        {'text': 'Zak Brown', 'score': 1},
        {'text': 'Toto Wolff', 'score': 4},
        {'text': 'Christian Horner', 'score': 2},
      ],
    },
    {
      'questionText': 'Who\'s your favorite driver?',
      'answers': [
        {'text': 'Lewis Hamilton', 'score': 4},
        {'text': 'Nikita Mazepin', 'score': 1},
        {'text': 'Charles Leclerc', 'score': 2},
        {'text': 'Carlos Sainz', 'score': 3},
      ]
    },
    {
      'questionText': 'Who\'s your favorite constructor?',
      'answers': [
        {'text': 'Mercedes', 'score': 4},
        {'text': 'Red Bull', 'score': 3},
        {'text': 'Ferrari', 'score': 2},
        {'text': 'Haas', 'score': 1},
      ],
    },
  ];
  // Defined here so that it is not reset upon each build
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // Functions used in this class should be defined as methods within the class
  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('More!');
    }
  }

  // This makes it clear that we are overriding the MyApp builtin build method
  @override
  // BuildContext is retrieved from material.dart
  // Build creates a widget, so it must return one
  Widget build(BuildContext context) {
    // MaterialApp() is retrieved from material.dart
    return MaterialApp(
      home: Scaffold(
        // AppBar() is from material.dart
        appBar: AppBar(
          // title needs a widget, so we use the text widget
          title: Text('Are you a bad F1 fan?'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
