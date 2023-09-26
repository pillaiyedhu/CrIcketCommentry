// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:sept15_crickbuzz_developer/screens/single_series.dart';

// class SeriesPage extends StatefulWidget {
//   const SeriesPage({super.key});

//   @override
//   State<SeriesPage> createState() => _SeriesPageState();
// }

// class _SeriesPageState extends State<SeriesPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Series Page'),
//       ),
//       body: SafeArea(
//           child: Column(
//         children: [
//           SizedBox(
//             height: 20,
//           ),
//           AllSeries(),
//         ],
//       )),
//     );
//   }
// }

// Widget AllSeries() {
//   return Expanded(
//     child: StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('series_new').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           print('No data');
//           return Text('No info');
//         }
//         if (snapshot.hasError) {
//           return Text('error');
//         } else {
//           var data = snapshot.data!.docs;
//           return ListView.builder(
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 child: AllSeries1(data[index]),
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => SingleSeries(),
//                       ));
//                 },
//               );
//             },
//           );
//         }
//       },
//     ),
//   );
// }

// Widget AllSeries1(DocumentSnapshot documentSnapshot) {
//   Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
//   print(data['start_date']);
//   return Card(
//     color: Colors.blue.shade100,
//     elevation: 4,
//     child: ListTile(
//       title: Text(data['series_name']),
//       subtitle: Text(
//           ' ${data['start_date'].toString().substring(0, 10)} -  ${data['end_date'].toString().substring(0, 10)}'),
//     ),
//   );
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sept15_crickbuzz_developer/Services/static_service.dart';
import 'package:sept15_crickbuzz_developer/screens/single_series.dart';

class AllSeriesPage extends StatefulWidget {
  const AllSeriesPage({super.key});

  @override
  State<AllSeriesPage> createState() => _AllSeriesPageState();
}

class _AllSeriesPageState extends State<AllSeriesPage> {
  @override
  Widget build(BuildContext context) {
    final firebaseProvider = Provider.of<FirebaseServiceProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Series Page'),
      ),
      body: FutureBuilder<List<DocumentSnapshot<Map<String, dynamic>>>>(
        future: firebaseProvider.getSeriesData(),
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
            List<DocumentSnapshot<Map<String, dynamic>>> seriesData =
                snapshot.data as List<DocumentSnapshot<Map<String, dynamic>>>;
            return ListView.builder(
              itemCount: seriesData.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> series = seriesData[index].data()!;
                return Card(
                  color: Colors.blue.shade100,
                  elevation: 4,
                  child: ListTile(
                    title: Text(series['series_name']),
                    subtitle: Text(
                        ' ${series['start_date'].toString().substring(0, 10)} -  ${series['end_date'].toString().substring(0, 10)}'),
                    onTap: () {
                      firebaseProvider.setId(series['id']);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingleSeriesPage(
                            seriesData: series,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
