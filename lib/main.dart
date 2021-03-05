import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //tableau des objets avec 2 éléments 'questiontext' et 'answers'
  final _questions = const [
    {
      'questionText': 'Qu\'elle est ta couleur préférer ?',
      'answers': [
        {'text': 'Noir', 'score': 10},
        {'text': 'Rouge', 'score': 6},
        {'text': 'Vert', 'score': 3},
        {'text': 'Blanc', 'score': 1}
      ],
    },
    {
      'questionText': 'Qu\'elle est ton animal préférer ?',
      'answers': [
        {'text': 'Lion', 'score': 10},
        {'text': 'Elephant', 'score': 6},
        {'text': 'Chat', 'score': 3},
        {'text': 'Chien', 'score': 1}
      ],
    },
    {
      'questionText': 'Qu\'elle est ton cours préférer ?',
      'answers': [
        {'text': 'Flutter', 'score': 10},
        {'text': 'PHP', 'score': 6},
        {'text': 'HTML', 'score': 3},
        {'text': 'JavaScript', 'score': 1}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz () {
    
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });

  }

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    // if(_questionIndex < questions.length) {
    //   print('encore des questions');
    // } else {
    //   print('plus de questions');
    // }

    print(_questionIndex);
    print(_totalScore);
  }

  @override
  Widget build(BuildContext context) {
    // questions = []; // ne fonctionne pas si 'questions est une constante

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ma premiere App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz,),
      ),
    );
  }
}
