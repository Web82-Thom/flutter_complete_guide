import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;

    if (resultScore <= 8) {
      resultText = 'Ok t\'es normal';
    } else if (resultScore <= 12) {
      resultText = 'Parfait';
    } else if (resultScore <= 16) {
      resultText = 'Attention consulte';
    } else {
      resultText = 'Danger';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          FlatButton(
            child: Text(
              'Redémarer le quiz!'
            ),
            color: Colors.blue[200],
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
