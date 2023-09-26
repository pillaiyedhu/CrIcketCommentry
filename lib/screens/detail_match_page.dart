// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class DetailMatchPage extends StatefulWidget {
//   const DetailMatchPage({super.key});

//   @override
//   State<DetailMatchPage> createState() => _DetailMatchPageState();
// }

// class _DetailMatchPageState extends State<DetailMatchPage> {
//   bool isTeam1Expanded = false;
//   bool isTeam2Expanded = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Team1 vs Team2'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 10,
//             ),
//             ExpansionTile(
//               title: ListTile(
//                 title: Text('Team1'),
//                 tileColor: Color.fromARGB(255, 76, 161, 230),
//                 trailing: Text('0-0(0.0)'),
//               ),
//             ),
//             DataTable(
//               columns: <DataColumn>[
//                 DataColumn(label: Text('Batter')),
//                 DataColumn(label: Text('R')),
//                 DataColumn(label: Text('B')),
//                 DataColumn(label: Text('4s')),
//                 DataColumn(label: Text('6s')),
//               ],
//               rows: <DataRow>[
//                 DataRow(
//                   cells: <DataCell>[
//                     DataCell(Text('Rohit')),
//                     DataCell(Text('0')),
//                     DataCell(Text('0')),
//                     DataCell(Text('0')),
//                     DataCell(Text('0')),
//                   ],
//                 ),
//                 DataRow(
//                   cells: <DataCell>[
//                     DataCell(Text('Gill')),
//                     DataCell(Text('0')),
//                     DataCell(Text('0')),
//                     DataCell(Text('0')),
//                     DataCell(Text('0')),
//                   ],
//                 ),
//                 // DataRow(
//                 //   cells: <DataCell>[
//                 //     DataCell(Text('Virat')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //   ],
//                 // ),
//                 // DataRow(
//                 //   cells: <DataCell>[
//                 //     DataCell(Text('Kl Rahul')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //   ],
//                 // ),
//                 // DataRow(
//                 //   cells: <DataCell>[
//                 //     DataCell(Text('Ishan ')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //   ],
//                 // ),
//                 // DataRow(
//                 //   cells: <DataCell>[
//                 //     DataCell(Text('Hardik')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //   ],
//                 // ),
//                 // DataRow(
//                 //   cells: <DataCell>[
//                 //     DataCell(Text('Jadeja')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //   ],
//                 // ),
//                 // DataRow(
//                 //   cells: <DataCell>[
//                 //     DataCell(Text('Axar')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //   ],
//                 // ),
//                 // DataRow(
//                 //   cells: <DataCell>[
//                 //     DataCell(Text('Kuldeep')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //   ],
//                 // ),
//                 // DataRow(
//                 //   cells: <DataCell>[
//                 //     DataCell(Text('Bumarha')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //   ],
//                 // ),
//                 // DataRow(
//                 //   cells: <DataCell>[
//                 //     DataCell(Text('Siraj')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //     DataCell(Text('0')),
//                 //   ],
//                 // ),
//               ],
//             ),
//             SizedBox(
//               height: 100,
//             ),
//             DataTable(
//               columns: <DataColumn>[
//                 DataColumn(label: Text('Bowler')),
//                 DataColumn(label: Text('O')),
//                 DataColumn(label: Text('M')),
//                 DataColumn(label: Text('R')),
//                 DataColumn(label: Text('W')),
//               ],
//               rows: <DataRow>[
//                 DataRow(
//                   cells: <DataCell>[
//                     DataCell(Text('Starc')),
//                     DataCell(Text('0')),
//                     DataCell(Text('0')),
//                     DataCell(Text('0')),
//                     DataCell(Text('0')),
//                   ],
//                 ),
//                 DataRow(
//                   cells: <DataCell>[
//                     DataCell(Text('Cummins')),
//                     DataCell(Text('0')),
//                     DataCell(Text('0')),
//                     DataCell(Text('0')),
//                     DataCell(Text('0')),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     children: [
//                       Text(
//                         'Venue',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         'Custom Message',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                   Card(
//                     elevation: 1,
//                     color: Colors.white,
//                     child: Container(
//                       padding: EdgeInsets.all(8),
//                       height: 120,
//                       width: 200,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Inning Score',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Divider(
//                             height: 10,
//                             thickness: 2,
//                             color: Colors.blue.shade100,
//                           ),
//                           Text(
//                             'TEAM 1 - 0/0',
//                             style: TextStyle(fontSize: 15),
//                           ),
//                           SizedBox(
//                             height: 6,
//                           ),
//                           Text(
//                             'remainning overs - 12.3',
//                             style: TextStyle(fontSize: 15),
//                           ),
//                           SizedBox(
//                             height: 6,
//                           ),
//                           Text(
//                             'CRR -',
//                             style: TextStyle(fontSize: 15),
//                           )
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Divider(
//               height: 20,
//               thickness: 2,
//               color: Colors.blue.shade200,
//             ),
//             Text(
//               'Commentry -',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               '6.1 : here we go for six!',
//               style: TextStyle(fontSize: 16),
//             ),
//             Text(
//               '6.2 : here we go for six!',
//               style: TextStyle(fontSize: 16),
//             ),
//             Text(
//               '6.3 : here we go for six!',
//               style: TextStyle(fontSize: 16),
//             ),
//             Text(
//               '6.4 : here we go for six!',
//               style: TextStyle(fontSize: 16),
//             ),
//             Text(
//               '6.5 : here we go for six!',
//               style: TextStyle(fontSize: 16),
//             ),
//             Text(
//               '6.6 : here we go for six!',
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sept15_crickbuzz_developer/Services/static_service.dart';

class DetailMatchPage extends StatefulWidget {
  String? team1Name;
  String? team2Name;
  String? venue;
  String? mainId;
  String? matchId;
  DetailMatchPage(
      {required this.team1Name,
      required this.team2Name,
      required this.venue,
      required this.mainId,
      required this.matchId,
      super.key});

  @override
  State<DetailMatchPage> createState() => _DetailMatchPageState();
}

class _DetailMatchPageState extends State<DetailMatchPage> {
  bool isTeam1Expanded = false;
  bool isTeam2Expanded = false;

  @override
  Widget build(BuildContext context) {
    final scoreProvider = Provider.of<FirebaseServiceProvider>(context);
    return Scaffold(
      // backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('${widget.team1Name} vs ${widget.team2Name}'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: scoreProvider.getScoreData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text('No series data found'),
              );
            } else {
              List<DocumentSnapshot<Map<String, dynamic>>> scoreData =
                  snapshot.data as List<DocumentSnapshot<Map<String, dynamic>>>;
              print(scoreData);
              print(scoreData.length);
              return ListView.builder(
                itemCount: scoreData.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> score = scoreData[index].data()!;
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Start of Team 1 ExpansionTile

                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: ExpansionTile(
                            title: Text(
                              '${widget.team1Name}- ${score['team_runs']}/${score['team_wickets']}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            // textColor: Color.fromARGB(255, 76, 161, 230),
                            // trailing: Text('50-10(15.2)'),
                            initiallyExpanded: isTeam1Expanded,
                            onExpansionChanged: (expanded) {
                              setState(() {
                                isTeam1Expanded = expanded;
                              });
                            },
                            children: [
                              // Start of Team 1 DataTable
                              DataTable(
                                columns: <DataColumn>[
                                  DataColumn(label: Text('Batter')),
                                  DataColumn(label: Text('R')),
                                  DataColumn(label: Text('B')),
                                  DataColumn(label: Text('4s')),
                                  DataColumn(label: Text('6s')),
                                ],
                                rows: <DataRow>[
                                  DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text(score['batsman1_name'])),
                                      DataCell(Text(
                                          score['batsman1_runs'].toString())),
                                      DataCell(Text('0')),
                                      DataCell(Text('0')),
                                      DataCell(Text('0')),
                                    ],
                                  ),
                                  DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text(score['batsman2_name'])),
                                      DataCell(Text(
                                          score['batsman2_runs'].toString())),
                                      DataCell(Text('0')),
                                      DataCell(Text('0')),
                                      DataCell(Text('0')),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 80,
                              ),
                              DataTable(
                                columns: <DataColumn>[
                                  DataColumn(label: Text('Bowler')),
                                  DataColumn(label: Text('O')),
                                  DataColumn(label: Text('M')),
                                  DataColumn(label: Text('R')),
                                  DataColumn(label: Text('W')),
                                ],
                                rows: <DataRow>[
                                  DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text(score['bowler_name'])),
                                      DataCell(Text(
                                          score['bowler_balls'].toString())),
                                      DataCell(Text('0')),
                                      DataCell(Text(
                                          score['bowler_runs'].toString())),
                                      DataCell(Text(
                                          score['bowler_wickets'].toString())),
                                    ],
                                  ),
                                  // DataRow(
                                  //   cells: <DataCell>[
                                  //     DataCell(Text('Cummins')),
                                  //     DataCell(Text('0')),
                                  //     DataCell(Text('0')),
                                  //     DataCell(Text('0')),
                                  //     DataCell(Text('0')),
                                  //   ],
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(12.0),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Column(
                              //         children: [
                              //           Text(
                              //             '${widget.venue}',
                              //             style: TextStyle(fontWeight: FontWeight.bold),
                              //           ),
                              //           SizedBox(
                              //             height: 10,
                              //           ),
                              //           Text(
                              //             'Custom Message',
                              //             style: TextStyle(fontWeight: FontWeight.bold),
                              //           ),
                              //         ],
                              //       ),
                              //       // Card(
                              //       //   elevation: 1,
                              //       //   color: Colors.white,
                              //       //   child: Container(
                              //       //     padding: EdgeInsets.all(8),
                              //       //     height: 120,
                              //       //     width: 200,
                              //       //     decoration: BoxDecoration(
                              //       //       borderRadius: BorderRadius.circular(12),
                              //       //     ),
                              //       //     child: Column(
                              //       //       crossAxisAlignment: CrossAxisAlignment.start,
                              //       //       children: [
                              //       //         Text(
                              //       //           'Inning Score',
                              //       //           style: TextStyle(fontWeight: FontWeight.bold),
                              //       //         ),
                              //       //         Divider(
                              //       //           height: 10,
                              //       //           thickness: 2,
                              //       //           color: Colors.blue.shade100,
                              //       //         ),
                              //       //         Text(
                              //       //           '${widget.team1Name} - 0/0',
                              //       //           style: TextStyle(fontSize: 15),
                              //       //         ),
                              //       //         SizedBox(
                              //       //           height: 6,
                              //       //         ),
                              //       //         Text(
                              //       //           'remainning overs -0.0',
                              //       //           style: TextStyle(fontSize: 15),
                              //       //         ),
                              //       //         SizedBox(
                              //       //           height: 6,
                              //       //         ),
                              //       //         Text(
                              //       //           'CRR -',
                              //       //           style: TextStyle(fontSize: 15),
                              //       //         )
                              //       //       ],
                              //       //     ),
                              //       //   ),
                              //       // )
                              //     ],
                              //   ),
                              // ),
                              // Divider(
                              //   height: 20,
                              //   thickness: 2,
                              //   color: Colors.blue.shade200,
                              // ),
                              // Text(
                              //   'Commentry -',
                              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // Text(
                              //   '6.1 : here we go for six!',
                              //   style: TextStyle(fontSize: 16),
                              // ),
                              // Text(
                              //   '6.2 : here we go for six!',
                              //   style: TextStyle(fontSize: 16),
                              // ),
                              // Text(
                              //   '6.3 : here we go for six!',
                              //   style: TextStyle(fontSize: 16),
                              // ),
                              // Text(
                              //   '6.4 : here we go for six!',
                              //   style: TextStyle(fontSize: 16),
                              // ),
                              // Text(
                              //   '6.5 : here we go for six!',
                              //   style: TextStyle(fontSize: 16),
                              // ),
                              // Text(
                              //   '6.6 : here we go for six!',
                              //   style: TextStyle(fontSize: 16),
                              // ),
                            ],
                          ),
                        ), // End of Team 1 ExpansionTile

                        // Start of Team 2 ExpansionTile
                        ExpansionTile(
                          title: Text(
                            '${widget.team2Name}- 0/0',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          textColor: Color.fromARGB(255, 76, 161, 230),
                          // trailing: Text('50-10(15.2)'),
                          initiallyExpanded: isTeam2Expanded,
                          onExpansionChanged: (expanded) {
                            setState(() {
                              isTeam2Expanded = expanded;
                            });
                          },
                          children: [
                            // Start of Team 2 DataTable
                            DataTable(
                              columns: <DataColumn>[
                                DataColumn(label: Text('Batter')),
                                DataColumn(label: Text('R')),
                                DataColumn(label: Text('B')),
                                DataColumn(label: Text('4s')),
                                DataColumn(label: Text('6s')),
                              ],
                              rows: <DataRow>[
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Jos Buttler')),
                                    DataCell(Text('0')),
                                    DataCell(Text('0')),
                                    DataCell(Text('0')),
                                    DataCell(Text('0')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Johny Bairstow')),
                                    DataCell(Text('0')),
                                    DataCell(Text('0')),
                                    DataCell(Text('0')),
                                    DataCell(Text('0')),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            DataTable(
                              columns: <DataColumn>[
                                DataColumn(label: Text('Bowler')),
                                DataColumn(label: Text('O')),
                                DataColumn(label: Text('M')),
                                DataColumn(label: Text('R')),
                                DataColumn(label: Text('W')),
                              ],
                              rows: <DataRow>[
                                // DataRow(
                                //   cells: <DataCell>[
                                //     DataCell(Text('Siraj')),
                                //     DataCell(Text('0')),
                                //     DataCell(Text('0')),
                                //     DataCell(Text('0')),
                                //     DataCell(Text('0')),
                                //   ],
                                // ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Shami')),
                                    DataCell(Text('0')),
                                    DataCell(Text('0')),
                                    DataCell(Text('0')),
                                    DataCell(Text('0')),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            // Divider(
                            //   height: 20,
                            //   thickness: 2,
                            //   color: Colors.blue.shade200,
                            // ),
                            // Text(
                            //   'Commentry -',
                            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Text(
                            //   '6.1 : here we go for six!',
                            //   style: TextStyle(fontSize: 16),
                            // ),
                            // Text(
                            //   '6.2 : here we go for six!',
                            //   style: TextStyle(fontSize: 16),
                            // ),
                            // Text(
                            //   '6.3 : here we go for six!',
                            //   style: TextStyle(fontSize: 16),
                            // ),
                            // Text(
                            //   '6.4 : here we go for six!',
                            //   style: TextStyle(fontSize: 16),
                            // ),
                            // Text(
                            //   '6.5 : here we go for six!',
                            //   style: TextStyle(fontSize: 16),
                            // ),
                            // Text(
                            //   '6.6 : here we go for six!',
                            //   style: TextStyle(fontSize: 16),
                            // ),
                            // End of Team 2 DataTable
                          ],
                        ), // End of Team 2 ExpansionTile

                        Divider(
                          height: 20,
                          thickness: 2,
                          color: Colors.blue.shade100,
                        ),
                        // Other widgets
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: double.maxFinite,
                              color: Colors.blue.shade100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '${widget.team1Name}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${widget.team2Name}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 25,
                              width: double.maxFinite,
                              child: Text(
                                'Playing XI',
                                style: TextStyle(fontSize: 16),
                              ),
                              color: Colors.grey.shade100,
                              alignment: Alignment.center,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: 200,
                                    height: double.maxFinite,
                                    child: SquadList(widget.mainId,
                                        widget.matchId, widget.team1Name)),
                                Container(
                                    width: 200,
                                    height: double.maxFinite,
                                    child: SquadList(widget.mainId,
                                        widget.matchId, widget.team2Name)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}

Widget SquadList(String? id, String? matchId, String? teamName) {
  return Expanded(
    child: StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('series_new')
          .doc(id)
          .collection('matches')
          .doc(matchId)
          .collection('${teamName}_squad')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text('No info');
        }
        if (snapshot.hasError) {
          return Text('error');
        } else {
          var data = snapshot.data!.docs;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return SquadList1(data[index]);
            },
          );
        }
      },
    ),
  );
}

Widget SquadList1(DocumentSnapshot documentSnapshot) {
  Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

  List<dynamic> players = data['data'];
  print(players);
  // return Text(data['data']);
  return SingleChildScrollView(
    child: Column(
      children: players.map((player) {
        return ListTile(title: Text(player.toString()));
      }).toList(),
    ),
  );
}
