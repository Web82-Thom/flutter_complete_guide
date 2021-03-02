import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
  final questions = const [
    {
      'questionText': 'Qu\'elle est ta couleur préférer ?',
      'answers': ['Noir', 'Rouge', 'Vert', 'Blanc'],
    },
    {
      'questionText': 'Qu\'elle est ton animal préférer ?',
      'answers': ['Lion', 'Elephant', 'Chat', 'Chien'],
    },
    {
      'questionText': 'Qu\'elle est ton cours préférer ?',
      'answers': ['HTML', 'PHP', 'Flutter', 'JavaScript'],
    },
  ];

  var _questionIndex = 0;

  void _answerQuestion() {

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if(_questionIndex < questions.length) {
      print('encore des questions');
    } else {
      print('plus de questions');
    }

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    

    // questions = []; // ne fonctionne pas si 'questions est une constante

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ma premiere App'),
        ),
        body: _questionIndex < questions.length ? Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            // ... opérateur de propagation
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ): Center(child: Text('Terminer')),
      ),
    );
  }
}
