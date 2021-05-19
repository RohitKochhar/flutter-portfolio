import 'package:flutter/material.dart';

import './widgets/new_round.dart';
import './models/round.dart';
import './widgets/round_list.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golf Tracker',
      theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Round> _userRounds = [
    Round(
      id: '0',
      courseName: 'Lingan',
      coursePar: 72,
      finalScore: 82,
      numEagles: 0,
      numBirdies: 1,
      numPars: 7,
      numBogeys: 9,
      numDoubles: 1,
      numMaxes: 0,
      date: DateTime.now(),
    ),
    Round(
      id: '1',
      courseName: 'Lingan',
      coursePar: 72,
      finalScore: 85,
      numEagles: 1,
      numBirdies: 0,
      numPars: 5,
      numBogeys: 9,
      numDoubles: 3,
      numMaxes: 0,
      date: DateTime.now(),
    ),
  ];

  List<Round> get _recentRounds {
    return _userRounds.where((round) {
      return round.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 31),
        ),
      );
    }).toList();
  }

  void _addNewRound(
      String courseName,
      int coursePar,
      int finalScore,
      int numEagles,
      int numBirdies,
      int numPars,
      int numBogeys,
      int numDoubles,
      int numMaxes) {
    final newRound = Round(
      courseName: courseName,
      coursePar: coursePar,
      finalScore: finalScore,
      numEagles: numEagles,
      numBirdies: numBirdies,
      numPars: numPars,
      numBogeys: numBogeys,
      numDoubles: numDoubles,
      numMaxes: numMaxes,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userRounds.add(newRound);
    });
  }

  void _startAddNewRound(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewRound(_addNewRound),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Golf Tracker',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewRound(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Card assumes the size of it's child
            Chart(_recentRounds),
            RoundList(_userRounds),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewRound(context),
      ),
    );
  }
}
