import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:sept15_crickbuzz_developer/provider/TeamProvider.dart';

class MatchPage extends StatelessWidget {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Widget build(BuildContext context) {
    final teamProvider = Provider.of<TeamProvider>(context);
    //String? battingTeamName = (teamProvider.battingTeamm)!.toUpperCase();
    return Scaffold(
        appBar: AppBar(
          title: Text('CRICKADDU'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //THe batting team Text on top of the screen
              Text(
                  "${teamProvider.battingTeamm}  ${teamProvider.teamRuns}-${teamProvider.teamWickets}"
                      .toUpperCase(),
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),

              //Table to display batting team players data
              DataTable(columns: const <DataColumn>[
                DataColumn(label: Text('Batter')),
                DataColumn(label: Text('R')),
                DataColumn(label: Text('B')),
                DataColumn(label: Text('4s')),
                DataColumn(label: Text('6s'))
              ], rows: <DataRow>[
                DataRow(cells: <DataCell>[
                  DataCell(
                    Text("${teamProvider.batsman1}"),
                  ),
                  DataCell(Text('${teamProvider.runsBatsman1}')),
                  DataCell(Text("0")),
                  DataCell(Text("0")),
                  DataCell(Text("0")),
                ]),
                DataRow(cells: <DataCell>[
                  DataCell(
                    Text("${teamProvider.batsman2}"),
                  ),
                  DataCell(Text("${teamProvider.runsBatsman2}")),
                  DataCell(Text("0")),
                  DataCell(Text("0")),
                  DataCell(Text("0")),
                ])
              ]),

              const SizedBox(
                height: 10,
              ),

              //Bowling team name
              Text("${teamProvider.bowlingTeam}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),

              //Current Bowler Data
              DataTable(headingRowHeight: 20, columns: const <DataColumn>[
                DataColumn(label: Text('Bowler')),
                DataColumn(label: Text('O')),
                DataColumn(label: Text('M')),
                DataColumn(label: Text('R')),
                DataColumn(label: Text('W'))
              ], rows: <DataRow>[
                DataRow(cells: <DataCell>[
                  DataCell(
                    Text("${teamProvider.bowler}"),
                  ),
                  DataCell(Text("0")),
                  DataCell(Text("0")),
                  DataCell(Text("0")),
                  DataCell(Text("0")),
                ]),
              ]),

              const SizedBox(
                height: 10,
              ),

              //Started creating buttons for logic
              
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        teamProvider.incrementPlayer1RunsBy1();
                      },
                      child: const Text('Bat1-1')
                  ),

                  ElevatedButton(
                      onPressed: () {
                        teamProvider.incrementPlayer2RunsBy1();
                      },
                      child: const Text('Bat2-1')
                  ),
                ],
              ),
              
              const SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        teamProvider.incrementPlayer1RunsBy2();
                      },
                      child: const Text('Bat1-2')
                  ),

                  ElevatedButton(
                      onPressed: () {
                        teamProvider.incrementPlayer2RunsBy2();
                      },
                      child: const Text('Bat2-2')
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        teamProvider.incrementPlayer1RunsBy4();
                      },
                      child: const Text('Bat1-4')
                  ),

                  ElevatedButton(
                      onPressed: () {
                        teamProvider.incrementPlayer2RunsBy4();
                      },
                      child: const Text('Bat2-4')
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        teamProvider.incrementPlayer1RunsBy6();
                      },
                      child: const Text('Bat1-6')
                  ),

                  ElevatedButton(
                      onPressed: () {
                        teamProvider.incrementPlayer2RunsBy6();
                      },
                      child: const Text('Bat2-6')
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
