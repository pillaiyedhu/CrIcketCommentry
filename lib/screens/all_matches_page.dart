import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sept15_crickbuzz_developer/provider/TeamProvider.dart';
import 'package:sept15_crickbuzz_developer/screens/single_match.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    final teamProvider = Provider.of<TeamProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text(
          'CricScore',
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Matches',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          AllMatches(),
        ],
      ),
    );
  }
}

Widget AllMatches() {
  return Expanded(
    child: StreamBuilder(
      stream: FirebaseFirestore.instance.collection('generalData').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          print('hello');
          return Text('No info');
        }
        if (snapshot.hasError) {
          Text('Error');
        } else {
          var data = snapshot.data!.docs;
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingleMatch(),
                    ),
                  );
                },
                child: AllMatches1(
                  data[index],
                ),
              );
            },
          );
        }
        return Container();
      },
    ),
  );
}

Widget AllMatches1(DocumentSnapshot documentSnapshot) {
  Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
  print(data['matchstatus']);
  return Card(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(data['matchstatus']),
              Text(data['matchdate']),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data['team1name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                data['team2name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " 50-1(10.2)",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '0/0(0.0)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            data['venue'],
            // style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            data['message'],
            style: TextStyle(color: Colors.blue.shade800),
          ),
        ],
      ),
    ),
  );
}
