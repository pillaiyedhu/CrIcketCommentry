import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_choices/search_choices.dart';
import 'package:sept15_crickbuzz_developer/provider/MatchProvider.dart';
import 'package:sept15_crickbuzz_developer/services/MatchScreenService.dart';

class TestPage extends StatefulWidget {
  //All my fields to be taken from other side
  String mainId;
  String matchId;
  int matchNumber;
  String team1Name;
  String team2Name;

  TestPage(this.mainId, this.matchId, this.matchNumber, this.team1Name,
      this.team2Name,
      {super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String batsman1 = 'Player 1';
  String batsman2 = 'Player 2';
  String bowler = 'Player ';

  int player1runs = 0;
  int player2runs = 0;

  final matchScreenService = MatchScreenService();

  @override
  Widget build(BuildContext context) {
    final matchProvider = Provider.of<MatchProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('CrickAddu'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 124, 79, 94),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Display both teams name at top ..............................
                  Container(
                    height: 100,
                    width: 300,
                    child: Card(
                      color: const Color.fromARGB(255, 240, 235, 235),
                      shadowColor: Colors.black,
                      elevation: 4,
                      child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            '${widget.team1Name} vs ${widget.team2Name}',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Contains the data of batsman and his team
                  Container(
                    height: 250,
                    width: 400,
                    child: Card(
                      color: const Color.fromARGB(255, 240, 235, 235),
                      shadowColor: Colors.black,
                      elevation: 4,
                      child: Container(
                          alignment: Alignment.center,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '${widget.team1Name} - ${matchProvider.teamRuns}/${matchProvider.teamWickets}',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                                DataTable(columns: const <DataColumn>[
                                  DataColumn(label: Text('Batter')),
                                  DataColumn(label: Text('R')),
                                  DataColumn(label: Text('B')),
                                  DataColumn(label: Text('4s')),
                                  DataColumn(label: Text('6s'))
                                ], rows: <DataRow>[
                                  DataRow(cells: <DataCell>[
                                    DataCell(
                                      Text("$batsman1"),
                                    ),
                                    DataCell(Text(
                                        matchProvider.runsBatsman1.toString())),
                                    DataCell(Text(
                                        matchProvider.ballsPlayer1.toString())),
                                    DataCell(Text("0")),
                                    DataCell(Text("0")),
                                  ]),
                                  DataRow(cells: <DataCell>[
                                    DataCell(
                                      Text("$batsman2"),
                                    ),
                                    DataCell(Text(
                                        matchProvider.runsBatsman2.toString())),
                                    DataCell(Text(
                                        matchProvider.ballsPlayer2.toString())),
                                    DataCell(Text("0")),
                                    DataCell(Text("0")),
                                  ])
                                ]),
                              ])),
                    ),
                  ),

                  //Batsman Selection ............................................
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('series_new')
                        .doc(widget.mainId)
                        .collection('matches')
                        .doc(widget.matchId)
                        .collection('${widget.team1Name}_squad')
                        .snapshots(),
                    builder: (context, snapshot) {
                      var data = snapshot.data!.docs;
                      List<dynamic> playersTeam1 = data[0]['data'];
                      return Container(
                        height: 250,
                        width: 500,
                        child: Card(
                            color: const Color.fromARGB(255, 240, 235, 235),
                            shadowColor: Colors.black,
                            elevation: 4,
                            child: Column(
                              children: [
                                //Select the 1st Batsman..............................
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Checkbox(
                                      activeColor: Colors.green,
                                      value: matchProvider.isSelectedPlayer1,
                                      onChanged: (bool? value) {
                                        matchProvider.setSelectedPlayer1(value);
                                        print(
                                            'first : ${matchProvider.isSelectedPlayer1}');
                                        print(
                                            'first : ${matchProvider.isSelectedPlayer2}');
                                      },
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: 120,
                                      child: Text('Select Batsman 1 :'),
                                    ),
                                    Container(
                                        height: 100,
                                        width: 190,
                                        child: SearchChoices.single(
                                          items: playersTeam1
                                              .map((player) =>
                                                  DropdownMenuItem<String>(
                                                      value: player,
                                                      child: Text(player)))
                                              .toList(),
                                          hint: 'Select Batsman1',
                                          searchHint: 'Search Player',
                                          onChanged: (value) {
                                            setState(() {
                                              batsman1 = value;
                                              matchProvider.updateBatsman1(
                                                  widget.mainId,
                                                  widget.matchId,
                                                  batsman1);
                                            });

                                            print('Batsman1 : $batsman1');
                                          },
                                          isCaseSensitiveSearch: false,
                                        )),
                                  ],
                                ),

                                //Select the 2nd Batsman.............................
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Checkbox(
                                      activeColor: Colors.green,
                                      value: matchProvider.isSelectedPlayer2,
                                      onChanged: (bool? value) {
                                        matchProvider.setSelectedPlayer2(value);
                                        print(
                                            'first : ${matchProvider.isSelectedPlayer1}');
                                        print(
                                            'first : ${matchProvider.isSelectedPlayer2}');
                                      },
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: 120,
                                      child: Text('Select Batsman 2 :'),
                                    ),
                                    Container(
                                        height: 100,
                                        width: 190,
                                        child: SearchChoices.single(
                                          items: playersTeam1
                                              .map((player) =>
                                                  DropdownMenuItem<String>(
                                                      value: player,
                                                      child: Text(player)))
                                              .toList(),
                                          hint: 'Select Batsman2',
                                          searchHint: 'Search Player',
                                          onChanged: (value) {
                                            setState(() {
                                              batsman2 = value;
                                              matchProvider.updateBatsman2(
                                                  widget.mainId,
                                                  widget.matchId,
                                                  batsman2);
                                            });
                                            print('Batsman2 : $batsman2');
                                          },
                                          isCaseSensitiveSearch: false,
                                        )),
                                  ],
                                ),
                              ],
                            )),
                      );
                    },
                  ),

                  //Runs controller card.......................................
                  Container(
                    height: 250,
                    width: 400,
                    child: Card(
                        color: const Color.fromARGB(255, 240, 235, 235),
                        shadowColor: Colors.black,
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //Runs 1 UI
                                InkWell(
                                  onTap: () {
                                    if (matchProvider.isSelectedPlayer1 ==
                                        true) {
                                      matchProvider.updatePlayer1RunsBy1(
                                          widget.mainId, widget.matchId);
                                      matchProvider.incrementBallsPlayer1(
                                          widget.mainId, widget.matchId);
                                    }
                                    if (matchProvider.isSelectedPlayer2 ==
                                        true) {
                                      matchProvider.updatePlayer2RunsBy1(
                                          widget.mainId, widget.matchId);
                                      matchProvider.incrementBallsPlayer2(
                                          widget.mainId, widget.matchId);
                                    }
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: Card(
                                      color: Colors.white,
                                      child: Text(
                                        '  1',
                                        style: TextStyle(
                                            fontSize: 60,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),

                                //Runs 2 UI
                                InkWell(
                                  onTap: () {
                                    if (matchProvider.isSelectedPlayer1 ==
                                        true) {
                                      matchProvider.updatePlayer1RunsBy2(
                                          widget.mainId, widget.matchId);
                                      matchProvider.incrementBallsPlayer1(
                                          widget.mainId, widget.matchId);
                                    }
                                    if (matchProvider.isSelectedPlayer2 ==
                                        true) {
                                      matchProvider.updatePlayer2RunsBy2(
                                          widget.mainId, widget.matchId);
                                      matchProvider.incrementBallsPlayer2(
                                          widget.mainId, widget.matchId);
                                    }
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: Card(
                                      color: const Color.fromARGB(
                                          255, 248, 242, 242),
                                      child: Text(
                                        '  2',
                                        style: TextStyle(
                                            fontSize: 60,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),

                                //Runs 3 UI
                                InkWell(
                                  onTap: () {
                                    if (matchProvider.isSelectedPlayer1 ==
                                        true) {
                                      matchProvider.updatePlayer1RunsBy3(
                                          widget.mainId, widget.matchId);
                                      matchProvider.incrementBallsPlayer1(
                                          widget.mainId, widget.matchId);
                                    }
                                    if (matchProvider.isSelectedPlayer2 ==
                                        true) {
                                      matchProvider.updatePlayer2RunsBy3(
                                          widget.mainId, widget.matchId);
                                      matchProvider.incrementBallsPlayer2(
                                          widget.mainId, widget.matchId);
                                    }
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: Card(
                                      color: const Color.fromARGB(
                                          255, 221, 218, 218),
                                      child: Text(
                                        '  3',
                                        style: TextStyle(
                                            fontSize: 60,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //Runs 4
                                InkWell(
                                  onTap: () {
                                    if (matchProvider.isSelectedPlayer1 ==
                                        true) {
                                      matchProvider.updatePlayer1RunsBy4(
                                          widget.mainId, widget.matchId);
                                      matchProvider.incrementBallsPlayer1(
                                          widget.mainId, widget.matchId);
                                    }
                                    if (matchProvider.isSelectedPlayer2 ==
                                        true) {
                                      matchProvider.updatePlayer2RunsBy4(
                                          widget.mainId, widget.matchId);
                                      matchProvider.incrementBallsPlayer2(
                                          widget.mainId, widget.matchId);
                                    }
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: Card(
                                      color: Color.fromARGB(255, 169, 240, 111),
                                      child: Text(
                                        '  4',
                                        style: TextStyle(
                                            fontSize: 60,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),

                                //Runs 6
                                InkWell(
                                  onTap: () {
                                    if (matchProvider.isSelectedPlayer1 ==
                                        true) {
                                      matchProvider.updatePlayer1RunsBy6(
                                          widget.mainId, widget.matchId);
                                      matchProvider.incrementBallsPlayer1(
                                          widget.mainId, widget.matchId);
                                    }
                                    if (matchProvider.isSelectedPlayer2 ==
                                        true) {
                                      matchProvider.updatePlayer2RunsBy6(
                                          widget.mainId, widget.matchId);
                                      matchProvider.incrementBallsPlayer2(
                                          widget.mainId, widget.matchId);
                                    }
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: Card(
                                      color: const Color.fromARGB(
                                          255, 247, 126, 126),
                                      child: Text(
                                        '  6',
                                        style: TextStyle(
                                            fontSize: 60,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Contains data of bowler......................................
                  Container(
                    height: 250,
                    width: 400,
                    child: Card(
                      color: const Color.fromARGB(255, 240, 235, 235),
                      shadowColor: Colors.black,
                      elevation: 4,
                      child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${widget.team2Name}',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              DataTable(
                                  headingRowHeight: 20,
                                  columns: const <DataColumn>[
                                    DataColumn(label: Text('Bowler')),
                                    DataColumn(label: Text('O')),
                                    DataColumn(label: Text('M')),
                                    DataColumn(label: Text('R')),
                                    DataColumn(label: Text('W'))
                                  ],
                                  rows: <DataRow>[
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text("$bowler"),
                                      ),
                                      DataCell(Text(matchProvider.ballsBowler
                                          .toString())),
                                      DataCell(Text("0")),
                                      DataCell(Text(
                                          matchProvider.runsBowler.toString())),
                                      DataCell(Text(matchProvider.bowlerWickets
                                          .toString())),
                                    ]),
                                  ]),
                            ],
                          )),
                    ),
                  ),

                  //Select bowler
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('series_new')
                        .doc(widget.mainId)
                        .collection('matches')
                        .doc(widget.matchId)
                        .collection('${widget.team2Name}_squad')
                        .snapshots(),
                    builder: (context, snapshot) {
                      var data = snapshot.data!.docs;
                      List<dynamic> playersTeam2 = data[0]['data'];
                      return Container(
                        alignment: Alignment.center,
                        height: 250,
                        width: 500,
                        child: Card(
                            color: const Color.fromARGB(255, 240, 235, 235),
                            shadowColor: Colors.black,
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //Select the Bowler ..............................
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: 120,
                                      child: Text('Select Bowler :'),
                                    ),
                                    Container(
                                        height: 100,
                                        width: 190,
                                        child: SearchChoices.single(
                                          items: playersTeam2
                                              .map((player) =>
                                                  DropdownMenuItem<String>(
                                                      value: player,
                                                      child: Text(player)))
                                              .toList(),
                                          hint: 'Select Bowler',
                                          searchHint: 'Search Player',
                                          onChanged: (value) {
                                            setState(() {
                                              bowler = value;
                                              matchProvider.updateBowler(
                                                  widget.mainId,
                                                  widget.matchId,
                                                  bowler);
                                            });
                                            print('Bowler : $bowler');
                                          },
                                          isCaseSensitiveSearch: false,
                                        )),
                                  ],
                                ),

                                ElevatedButton(
                                    onPressed: () {
                                      matchScreenService.postMatchDetails(
                                          widget.team1Name,
                                          widget.team2Name,
                                          widget.matchNumber,
                                          0,
                                          0,
                                          batsman1,
                                          batsman2,
                                          bowler,
                                          0,
                                          0,
                                          0,
                                          0,
                                          0,
                                          0,
                                          0);
                                    },
                                    child: Text('Submit data'))
                              ],
                            )),
                      );
                    },
                  ),

                  //button panel for bowler......................................
                  Container(
                    height: 250,
                    width: 400,
                    child: Card(
                        color: const Color.fromARGB(255, 240, 235, 235),
                        shadowColor: Colors.black,
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Wickets UI
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (matchProvider.isSelectedPlayer1 ==
                                        true) {
                                      batsman1 = 'Wicket......';
                                      matchProvider.wicket(
                                          widget.mainId, widget.matchId);
                                    } else if (matchProvider
                                            .isSelectedPlayer2 ==
                                        true) {
                                      batsman2 = 'Wicket......';
                                      
                                      matchProvider.wicket(
                                          widget.mainId, widget.matchId);
                                    }
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 130,
                                    child: Card(
                                      color:
                                          const Color.fromARGB(255, 228, 0, 0),
                                      child: Text(
                                        '  W',
                                        style: TextStyle(
                                            fontSize: 64,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),

                                //Dot ball UI

                                InkWell(
                                  onTap: () {
                                    if (matchProvider.isSelectedPlayer1 ==
                                        true) {
                                      matchProvider.dotBallPlayer1(
                                        widget.mainId,
                                        widget.matchId,
                                      );
                                    } else if (matchProvider
                                            .isSelectedPlayer2 ==
                                        true) {
                                      matchProvider.dotBallPlayer2(
                                        widget.mainId,
                                        widget.matchId,
                                      );
                                    }
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 140,
                                    child: Card(
                                      color: Color.fromARGB(255, 227, 230, 90),
                                      child: Text(
                                        '  DB',
                                        style: TextStyle(
                                            fontSize: 64,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //No Ball 2 UI
                                InkWell(
                                  onTap: () {
                                    matchProvider.noBall(
                                      widget.mainId,
                                      widget.matchId,
                                    );
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 180,
                                    child: Card(
                                      color: const Color.fromARGB(
                                          255, 248, 242, 242),
                                      child: Text(
                                        '   NB',
                                        style: TextStyle(
                                            fontSize: 66,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),

                                //Wide Ball 3 UI
                                InkWell(
                                  onTap: () {
                                    matchProvider.wideBall(
                                      widget.mainId,
                                      widget.matchId,
                                    );
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 180,
                                    child: Card(
                                      color: const Color.fromARGB(
                                          255, 221, 218, 218),
                                      child: Text(
                                        '  WB',
                                        style: TextStyle(
                                            fontSize: 66,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
