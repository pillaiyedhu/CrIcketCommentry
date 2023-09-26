import 'package:flutter/material.dart';

class cardWidget extends StatelessWidget {
  // Map<String, dynamic>? data;

  cardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            Text('Match Status'),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Team 1',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Team 2',
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
              'Match Venue',
              // style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Custom messages',
              style: TextStyle(color: Colors.blue.shade800),
            ),
          ],
        ),
      ),
    );
  }
}
