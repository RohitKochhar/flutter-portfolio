import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetFunction;

  Result(this.resultScore, this.resetFunction);

  // Getter definition
  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 8) {
      resultText = 'You are a bad fan!';
    } else if (resultScore <= 11) {
      resultText = 'You are an ok fan!';
    } else {
      resultText = 'You are the best fan :-)';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text('Restart Quiz!'),
            onPressed: resetFunction,
          ),
        ],
      ),
    );
  }
}
