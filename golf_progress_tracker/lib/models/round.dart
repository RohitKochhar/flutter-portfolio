import 'package:flutter/foundation.dart';

class Round {
  final String id;
  final String courseName;
  final int coursePar;
  final int finalScore;
  final int numEagles;
  final int numBirdies;
  final int numPars;
  final int numBogeys;
  final int numDoubles;
  final int numMaxes;
  final DateTime date;

  Round({
    @required this.id,
    @required this.courseName,
    @required this.coursePar,
    @required this.finalScore,
    @required this.numEagles,
    @required this.numBirdies,
    @required this.numPars,
    @required this.numBogeys,
    @required this.numDoubles,
    @required this.numMaxes,
    @required this.date,
  });
}
