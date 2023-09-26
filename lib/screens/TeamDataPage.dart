import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_choices/search_choices.dart';
import 'package:sept15_crickbuzz_developer/provider/MatchProvider.dart';

class TeamDataPage extends StatefulWidget {
  // List<dynamic> team1Players;
  // List<dynamic> team2Players;
  const TeamDataPage({super.key});

  @override
  State<TeamDataPage> createState() => _TeamDataPageState();
}

class _TeamDataPageState extends State<TeamDataPage> {
  List<String> selectedPlayers1 = ['Rahul', 'Rohit'];
  List<dynamic> selectedPlayers2 = ['Adam Zampa', 'Starc'];
  String batsman1 = 'Player1';
  String batsman2 = 'Player2';
  String bowler = 'Player';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar
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
                          // '${matchProvider.team1Name} vs ${matchProvider.team2Name}',
                          "India Vs Australia",
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
                              Text('India - 0/0',
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
                                  DataCell(Text('0')),
                                  DataCell(Text("0")),
                                  DataCell(Text("0")),
                                  DataCell(Text("0")),
                                ]),
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text("$batsman2"),
                                  ),
                                  DataCell(Text("0")),
                                  DataCell(Text("0")),
                                  DataCell(Text("0")),
                                  DataCell(Text("0")),
                                ])
                              ]),
                            ])),
                  ),
                ),

                //Batsman Decision ............................................
                Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
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
                                    items: selectedPlayers1
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
                                      });
                                      print('Batsman1 : $batsman1');
                                    },
                                    isCaseSensitiveSearch: false,
                                  )),
                            ],
                          ),

                          //Select the 2nd Batsman.............................
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
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
                                    items: selectedPlayers1
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
                                      });
                                      print('Batsman2 : $batsman2');
                                    },
                                    isCaseSensitiveSearch: false,
                                  )),
                            ],
                          ),
                        ],
                      )),
                ),

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
                                onTap: () {},
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
                                onTap: () {},
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
                                onTap: () {},
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
                                onTap: () {},
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
                                onTap: () {},
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
                            Text('Team2Name',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
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
                                    DataCell(Text("0")),
                                    DataCell(Text("0")),
                                    DataCell(Text("0")),
                                    DataCell(Text("0")),
                                  ]),
                                ]),
                          ],
                        )),
                  ),
                ),

                //Select bowler
                Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    items: selectedPlayers2
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
                                      });
                                      print('Bowler : $bowler');
                                    },
                                    isCaseSensitiveSearch: false,
                                  )),
                            ],
                          ),
                        ],
                      )),
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
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 100,
                              width: 130,
                              child: Card(
                                color: const Color.fromARGB(255, 228, 0, 0),
                                child: Text(
                                  '  W',
                                  style: TextStyle(
                                      fontSize: 64,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //Runs 2 UI
                              InkWell(
                                onTap: () {},
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

                              //Runs 3 UI
                              InkWell(
                                onTap: () {},
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
      ),
    );
  }
}
