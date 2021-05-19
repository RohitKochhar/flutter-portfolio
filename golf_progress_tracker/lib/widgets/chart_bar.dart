import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final int scoreFreq;
  final double scorePctOfTotal;

  ChartBar(this.label, this.scoreFreq, this.scorePctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${scoreFreq.toString()}'),
        SizedBox(height: 4),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                  heightFactor: scorePctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
