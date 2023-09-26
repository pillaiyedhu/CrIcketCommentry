import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sept15_crickbuzz_developer/Services/static_service.dart';
import 'package:sept15_crickbuzz_developer/screens/detail_match_page.dart';

class SingleSeriesPage extends StatefulWidget {
  final Map<String, dynamic> seriesData;

  const SingleSeriesPage({super.key, required this.seriesData});

  @override
  State<SingleSeriesPage> createState() => _SingleSeriesPageState();
}

class _SingleSeriesPageState extends State<SingleSeriesPage> {
  @override
  Widget build(BuildContext context) {
    final firebaseProvider = Provider.of<FirebaseServiceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.seriesData['series_name']}'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SingleSeries(widget.seriesData['id']),
          ],
        ),
      ),
    );
  }
}

Widget SingleSeries(String id) {
  return Expanded(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('series_new')
              .doc(id)
              .collection('matches')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              print('No data');
              return Text('No info');
            }
            if (snapshot.hasError) {
              return Text('error');
            } else {
              var data = snapshot.data!.docs;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: SingleSeries1(data[index]),
                    onTap: () {
                      List<String> makeId = [
                        data[index]['team1_name'],
                        data[index]['team2_name']
                      ];
                      makeId.sort();
                      String mainId = '${makeId[0]}_${makeId[1]}';
                      print(mainId);

                      String matchId =
                          'match_${data[index]['match_number']}_$mainId';
                      print(matchId);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailMatchPage(
                              team1Name: data[index]['team1_name'],
                              team2Name: data[index]['team2_name'],
                              venue: data[index]['venue'],
                              mainId: mainId,
                              matchId: matchId,
                            ),
                          ));
                    },
                  );
                },
              );
            }
          }));
}

Widget SingleSeries1(DocumentSnapshot documentSnapshot) {
  Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
  print(data['series_name']);
  return Container(
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // ListTile(
        //   title: Text(
        //     'Aus tour of Ind',
        //     style: TextStyle(fontSize: 20),
        //   ),
        //   tileColor: Colors.blue.shade100,
        // ),
        Container(
            alignment: Alignment.centerLeft,
            height: 40,
            width: double.infinity,
            color: Colors.blue.shade100,
            child: Text(
              ' ${data['match_date'].toString().substring(0, 10)}',
              style: TextStyle(fontSize: 16),
            )),
        SizedBox(
          height: 10,
        ),
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Match -${data['match_number']}, ${data['series_type']}-${data['venue']}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
                Text(
                  data['match_status'],
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 153, 55, 36)),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              data['team1_name'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              data['team2_name'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              ' ${data['match_date'].toString().substring(11, 16)}',
              style: TextStyle(fontSize: 16),
            ),
            //  late var startTimestamp=SnapshotWidget.data['start_date'] as Timestamp;
          ],
        )
      ],
    ),
  );
}
