import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Take the full width of the screen
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 28,
        ),
        // Aligned to the container
        textAlign: TextAlign.center,
      ),
    );
  }
}
