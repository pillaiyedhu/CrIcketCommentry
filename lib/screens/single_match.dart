import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SingleMatch extends StatefulWidget {
  const SingleMatch({super.key});

  @override
  State<SingleMatch> createState() => _SingleMatchState();
}

class _SingleMatchState extends State<SingleMatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team1 vs Team2'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text('Team1'),
              tileColor: Color.fromARGB(255, 76, 161, 230),
              trailing: Text('50-10(15.2)'),
            ),
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
                    DataCell(Text('Rohit')),
                    DataCell(Text('0')),
                    DataCell(Text('0')),
                    DataCell(Text('0')),
                    DataCell(Text('0')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Gill')),
                    DataCell(Text('0')),
                    DataCell(Text('0')),
                    DataCell(Text('0')),
                    DataCell(Text('0')),
                  ],
                ),
                // DataRow(
                //   cells: <DataCell>[
                //     DataCell(Text('Virat')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //   ],
                // ),
                // DataRow(
                //   cells: <DataCell>[
                //     DataCell(Text('Kl Rahul')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //   ],
                // ),
                // DataRow(
                //   cells: <DataCell>[
                //     DataCell(Text('Ishan ')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //   ],
                // ),
                // DataRow(
                //   cells: <DataCell>[
                //     DataCell(Text('Hardik')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //   ],
                // ),
                // DataRow(
                //   cells: <DataCell>[
                //     DataCell(Text('Jadeja')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //   ],
                // ),
                // DataRow(
                //   cells: <DataCell>[
                //     DataCell(Text('Axar')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //   ],
                // ),
                // DataRow(
                //   cells: <DataCell>[
                //     DataCell(Text('Kuldeep')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //   ],
                // ),
                // DataRow(
                //   cells: <DataCell>[
                //     DataCell(Text('Bumarha')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //   ],
                // ),
                // DataRow(
                //   cells: <DataCell>[
                //     DataCell(Text('Siraj')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //     DataCell(Text('0')),
                //   ],
                // ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            DataTable(
              columns: <DataColumn>[
                DataColumn(label: Text('Bowler')),
                DataColumn(label: Text('M')),
                DataColumn(label: Text('R')),
                DataColumn(label: Text('W')),
                DataColumn(label: Text('Ex')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Starc')),
                    DataCell(Text('0')),
                    DataCell(Text('0')),
                    DataCell(Text('0')),
                    DataCell(Text('0')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Cummins')),
                    DataCell(Text('0')),
                    DataCell(Text('0')),
                    DataCell(Text('0')),
                    DataCell(Text('0')),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Venue',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Custom Message',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Card(
                    elevation: 1,
                    color: Colors.white,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 120,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Inning Score',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            height: 10,
                            thickness: 2,
                            color: Colors.blue.shade100,
                          ),
                          Text(
                            'TEAM 1 - 0/0',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            'remainning overs - 12.3',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            'CRR -',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 20,
              thickness: 2,
              color: Colors.blue.shade200,
            ),
            Text(
              'Commentry -',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '6.1 : here we go for six!',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '6.2 : here we go for six!',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '6.3 : here we go for six!',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '6.4 : here we go for six!',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '6.5 : here we go for six!',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '6.6 : here we go for six!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
