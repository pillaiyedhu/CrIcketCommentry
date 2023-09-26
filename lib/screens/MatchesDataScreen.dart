import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sept15_crickbuzz_developer/provider/MatchProvider.dart';
import 'package:sept15_crickbuzz_developer/screens/AddSeriesMatchesPage.dart';
import 'package:sept15_crickbuzz_developer/screens/TeamDataPage.dart';
import 'package:sept15_crickbuzz_developer/screens/testpage.dart';

class MatchesDataScreen extends StatefulWidget {
  String id;
  MatchesDataScreen({required this.id, super.key});

  @override
  State<MatchesDataScreen> createState() => _MatchesDataScreenState();
}

class _MatchesDataScreenState extends State<MatchesDataScreen> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text('CrickAddu'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 124, 79, 94),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Center(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('series_new')
                .doc(widget.id)
                .collection('matches')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text("No data");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading.......");
              } else {
                var data = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // matchProvider.setTeam1(data[index]['team1_name']);
                        // matchProvider.setTeam2(data[index]['team2_name']);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return TestPage(widget.id, data[index]['match_id'],data[index]['match_number'],data[index]['team1_name'],data[index]['team2_name']);
                          },
                        ));
                      },
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(data[index]['match_date']
                                        .toString()
                                        .substring(0, 10)),
                                    Text(
                                        'Match - ${data[index]['match_number']} || ${data[index]['series_type']}'),
                                    Text(data[index]['match_date']
                                        .toString()
                                        .substring(10, 19)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '${data[index]['team1_name']} - 0/0',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${data[index]['team2_name']} - 0/0',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Text(data[index]['venue']),
                                Text('${data[index]['toss']} won the toss')
                              ],
                            ),
                          ),
                          elevation: 4,
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 124, 79, 94),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AddSeriesMatchesPage();
            },
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
