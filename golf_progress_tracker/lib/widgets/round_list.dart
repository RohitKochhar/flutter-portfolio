import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/round.dart';

class RoundList extends StatelessWidget {
  final List<Round> rounds;

  RoundList(this.rounds);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: rounds.isEmpty
          ? Column(
              children: [
                Text(
                  'No rounds played!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('${rounds[index].finalScore}'),
                        ),
                      ),
                    ),
                    title: Text(
                      rounds[index].courseName,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(rounds[index].date),
                    ),
                    trailing: Text(
                        '| ${rounds[index].numEagles} | ${rounds[index].numBirdies} | ${rounds[index].numPars} | ${rounds[index].numBogeys} | ${rounds[index].numDoubles} | ${rounds[index].numMaxes} |'),
                  ),
                );
              },
              itemCount: rounds.length,
            ),
    );
  }
}
