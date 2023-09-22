import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sept15_crickbuzz_developer/screens/MatchDataPage.dart';


class SeriesDataScreen extends StatefulWidget {
  const SeriesDataScreen({super.key});

  @override
  State<SeriesDataScreen> createState() => _SeriesDataScreenState();
}

class _SeriesDataScreenState extends State<SeriesDataScreen> {
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
            stream:
                FirebaseFirestore.instance.collection('series_new').snapshots(),
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
                    return Card(
                      child: ListTile(
                        tileColor: const Color.fromARGB(255, 240, 235, 235),
                        title: Text('${data[index]['series_name']}'),
                        subtitle: Text(
                            '${data[index]['start_date'].toString().substring(0, 10)} - ${data[index]['end_date'].toString().substring(0, 10)}'),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return MatchDataPage();
                            },
                          ));
                        },
                      ),
                      elevation: 4,
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
              return MatchDataPage();
            },
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
