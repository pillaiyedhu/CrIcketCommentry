import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sept15_crickbuzz_developer/provider/MatchProvider.dart';

class TeamDataPage extends StatefulWidget {
  const TeamDataPage({super.key});

  @override
  State<TeamDataPage> createState() => _TeamDataPageState();
}

class _TeamDataPageState extends State<TeamDataPage> {
  @override
  Widget build(BuildContext context) {
    final matchProvider = Provider.of<MatchProvider>(context);
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
                    color:const Color.fromARGB(255, 240, 235, 235),
                    shadowColor: Colors.black,
                    elevation: 4,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('${matchProvider.team1Name} vs ${matchProvider.team2Name}',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
                    ),
                    
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
                    color:const Color.fromARGB(255, 240, 235, 235),
                    shadowColor: Colors.black,
                    elevation: 4,
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${matchProvider.team1Name} - 0/0',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
              
                          DataTable(columns: const <DataColumn>[
                            DataColumn(label: Text('Batter')),
                            DataColumn(label: Text('R')),
                            DataColumn(label: Text('B')),
                            DataColumn(label: Text('4s')),
                            DataColumn(label: Text('6s'))
                          ], rows: <DataRow>[
                            DataRow(cells: <DataCell>[
                              DataCell(
                                Text("${matchProvider.batsman1}"),
                              ),
                              DataCell(Text('0')),
                              DataCell(Text("0")),
                              DataCell(Text("0")),
                              DataCell(Text("0")),
                            ]),
                            DataRow(cells: <DataCell>[
                              DataCell(
                                Text("${matchProvider.batsman2}"),
                              ),
                              DataCell(Text("0")),
                              DataCell(Text("0")),
                              DataCell(Text("0")),
                              DataCell(Text("0")),
                            ])
                          ]),
                        ]
                      )
                    ),

                    

                    
                  ),
                ),

                
                //button panel for batsman .....................................
                Container(
                  height: 250,
                  width: 900,
                  child: Card(
                    color:const Color.fromARGB(255, 240, 235, 235),
                    shadowColor: Colors.black,
                    elevation: 4,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('India vs Australia',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
                    ),
                    
                  ),
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
                    color:const Color.fromARGB(255, 240, 235, 235),
                    shadowColor: Colors.black,
                    elevation: 4,
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${matchProvider.team2Name}',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                          DataTable(headingRowHeight: 20, columns: const <DataColumn>[
                            DataColumn(label: Text('Bowler')),
                            DataColumn(label: Text('O')),
                            DataColumn(label: Text('M')),
                            DataColumn(label: Text('R')),
                            DataColumn(label: Text('W'))
                          ], rows: <DataRow>[
                            DataRow(cells: <DataCell>[
                              DataCell(
                                Text("${matchProvider.bowler}"),
                              ),
                              DataCell(Text("0")),
                              DataCell(Text("0")),
                              DataCell(Text("0")),
                              DataCell(Text("0")),
                            ]),
                          ]),
                        ],
                      )
                    ),
                    
                  ),
                ),

                //button panel for bowler......................................
                Container(
                  height: 250,
                  width: 900,
                  child: Card(
                    color:const Color.fromARGB(255, 240, 235, 235),
                    shadowColor: Colors.black,
                    elevation: 4,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('India vs Australia',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
                    ),
                    
                  ),
                ),
                
                
                    
                  
              
              ],
            )
          ],
        ),
      ),


    );
  }
}
