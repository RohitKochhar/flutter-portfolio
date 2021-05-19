import 'package:flutter/material.dart';

class NewRound extends StatefulWidget {
  final Function addRd;

  NewRound(this.addRd);

  @override
  _NewRoundState createState() => _NewRoundState();
}

class _NewRoundState extends State<NewRound> {
  final courseNameController = TextEditingController();

  final courseParController = TextEditingController();

  final finalScoreController = TextEditingController();

  final numEaglesController = TextEditingController();

  final numBirdiesController = TextEditingController();

  final numParsController = TextEditingController();

  final numBogeysController = TextEditingController();

  final numDoublesController = TextEditingController();

  final numMaxesController = TextEditingController();

  void submitData() {
    final enteredCourseName = courseNameController.text;
    final enteredCoursePar = int.parse(courseParController.text);
    final enteredFinalScore = int.parse(finalScoreController.text);
    final enteredNumEagles = int.parse(numEaglesController.text);
    final enteredNumBirdies = int.parse(numBirdiesController.text);
    final enteredNumPars = int.parse(numParsController.text);
    final enteredNumBogeys = int.parse(numBogeysController.text);
    final enteredNumDoubles = int.parse(numDoublesController.text);
    final enteredNumMaxes = int.parse(numMaxesController.text);

    if (enteredCourseName.isEmpty ||
        enteredCoursePar < 0 ||
        enteredFinalScore < 0 ||
        enteredNumEagles < 0 ||
        enteredNumBirdies < 0 ||
        enteredNumPars < 0 ||
        enteredNumBogeys < 0 ||
        enteredNumDoubles < 0 ||
        enteredNumMaxes < 0 ||
        (enteredNumEagles +
                enteredNumBirdies +
                enteredNumPars +
                enteredNumBogeys +
                enteredNumDoubles +
                enteredNumMaxes !=
            18)) {
      return;
    }

    widget.addRd(
      enteredCourseName,
      enteredCoursePar,
      enteredFinalScore,
      enteredNumEagles,
      enteredNumBirdies,
      enteredNumPars,
      enteredNumBogeys,
      enteredNumDoubles,
      enteredNumMaxes,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Course Name'),
                controller: courseNameController,
                keyboardType: TextInputType.text,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Course Par'),
                controller: courseParController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Final Score'),
                controller: finalScoreController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: '# of Eagles'),
                controller: numEaglesController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: '# of Birdies'),
                controller: numBirdiesController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: '# of Pars'),
                controller: numParsController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: '# of Bogeys'),
                controller: numBogeysController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: '# of Doubles'),
                controller: numDoublesController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: '# of Maxes'),
                controller: numMaxesController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              FlatButton(
                child: Text('Add Round'),
                textColor: Colors.green,
                onPressed: submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
