import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sept15_crickbuzz_developer/Services/static_service.dart';
import 'package:sept15_crickbuzz_developer/screens/tv_page.dart';

class LivePage extends StatefulWidget {
  const LivePage({super.key});

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    final matchProvider = Provider.of<FirebaseServiceProvider>(context);
    return Scaffold(
        body: Column(
      children: [
        Text(
          'Matches',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: FutureBuilder(
            future: matchProvider.getMatchesData(),
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
                List<DocumentSnapshot<Map<String, dynamic>>> matchData =
                    snapshot.data
                        as List<DocumentSnapshot<Map<String, dynamic>>>;
                List<Map<String, dynamic>> liveMatches =
                    <Map<String, dynamic>>[];

                matchData.forEach((element) {
                  if (element.data()!['match_status'] == 'Live') {
                    liveMatches.add(element.data()!);
                  }
                });

                return ListView.builder(
                    itemCount: liveMatches.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> matches = liveMatches[index];
                      int len = liveMatches.length;
                      print(len);
                      print(matchData[index]['match_status']);
                      // if (matches['match_status'] == 'Live') {
                      return GestureDetector(
                        child: Card(
                          elevation: 2,
                          color: Colors.white,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: 200,
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(matches['match_status']),
                                    Text(
                                        ' ${matches['match_date'].toString().substring(11, 16)}'),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      matches['team1_name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      matches['team2_name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      " 0/0(0.0)",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '0/0(0.0)',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  matches['venue'],
                                  // style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'message',
                                  style: TextStyle(color: Colors.blue.shade800),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TVPage(),
                              ));
                        },
                      );
                      // }
                    });
              }
            },
          ),
        )
      ],
    ));
  }
}
