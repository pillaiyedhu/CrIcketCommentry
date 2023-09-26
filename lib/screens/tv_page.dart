import 'package:flutter/material.dart';

class TVPage extends StatefulWidget {
  const TVPage({super.key});

  @override
  State<TVPage> createState() => _TVPageState();
}

class _TVPageState extends State<TVPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TV Page'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 300,
            width: double.infinity,
            child: Card(
              shadowColor: Colors.black,
              color: Colors.black,
              elevation: 10,
              child: Center(
                child: Text(
                  'Commnetry !!!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'venue',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
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
                          'team1_name - 0/0',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'remainning overs - 0.0',
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
        ],
      ),
    );
  }
}
