import 'package:flutter/material.dart';

import '../models/round.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Round> recentRounds;

  Chart(this.recentRounds);

  List<Map<String, Object>> get groupedHoleScores {
    int totalEagleSum = 0;
    int totalBirdieSum = 0;
    int totalParSum = 0;
    int totalBogeySum = 0;
    int totalDoubleSum = 0;
    int totalMaxSum = 0;

    for (var i = 0; i < recentRounds.length; i++) {
      totalEagleSum += recentRounds[i].numEagles;
      totalBirdieSum += recentRounds[i].numBirdies;
      totalParSum += recentRounds[i].numPars;
      totalBogeySum += recentRounds[i].numBogeys;
      totalDoubleSum += recentRounds[i].numDoubles;
      totalMaxSum += recentRounds[i].numMaxes;
    }
    return [
      {'score': '-2', 'freq': totalEagleSum},
      {'score': '-1', 'freq': totalBirdieSum},
      {'score': '+-', 'freq': totalParSum},
      {'score': '+1', 'freq': totalBogeySum},
      {'score': '+2', 'freq': totalDoubleSum},
      {'score': '+M', 'freq': totalMaxSum},
    ];
  }

  double get maxFreq {
    return groupedHoleScores.fold(0.0, (sum, item) {
      return sum + item['freq'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedHoleScores);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedHoleScores.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  data['score'],
                  data['freq'],
                  maxFreq == 0.0 ? 0.0 : (data['freq'] as num) / maxFreq,
                ),
              );
            }).toList()),
      ),
    );
  }
}
