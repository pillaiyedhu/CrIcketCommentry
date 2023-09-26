import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sept15_crickbuzz_developer/screens/AddSeriesMatchesPage.dart';
import 'package:sept15_crickbuzz_developer/screens/MatchesDataScreen.dart';
import 'package:sept15_crickbuzz_developer/screens/testpage.dart';
import 'package:sept15_crickbuzz_developer/services/MatchScreenService.dart';

class SeriesDataScreen extends StatefulWidget {
  const SeriesDataScreen({super.key});

  @override
  State<SeriesDataScreen> createState() => _SeriesDataScreenState();
}

class _SeriesDataScreenState extends State<SeriesDataScreen> {
  List<String> popActions = ['Edit', 'Delete'];
  final matchScreenService = MatchScreenService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBAR of Series Data..................................................
      appBar: AppBar(
        title: Text('CrickAddu'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 124, 79, 94),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Center(
          //Stream Builder for to call series data..............................
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
                      elevation: 4,
                      child: ListTile(
                        //menu button for editing and deleting..................
                        trailing: PopupMenuButton(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: popActions[0],
                              child: const Text('Edit'),
                            ),
                            PopupMenuItem(
                              value: popActions[1],
                              child: const Text('Delete'),
                            ),
                          ],
                          onSelected: (value) {
                            //Edit the series data.............................
                            if (value == popActions[0]) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AddSeriesMatchesPage(),
                                  ));
                            }
                            //Delete the series data...........................
                            else if (value == popActions[1]) {
                              matchScreenService.deleteSeriesData(data[index]['id']);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SeriesDataScreen()
                                  )
                              );
                            }
                          },
                        ),
                        tileColor: const Color.fromARGB(255, 240, 235, 235),
                        title: Text('${data[index]['series_name']}'),
                        subtitle: Text(
                            '${data[index]['start_date'].toString().substring(0, 10)} - ${data[index]['end_date'].toString().substring(0, 10)}'),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return MatchesDataScreen(
                                id: data[index]['id'],
                              );
                            },
                          ));
                        },
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
