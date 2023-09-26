// import 'package:flutter/material.dart';

// class MatchPage extends StatefulWidget {
//   const MatchPage({super.key});

//   @override
//   State<MatchPage> createState() => _MatchPageState();
// }

// class _MatchPageState extends State<MatchPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade300,
//       appBar: AppBar(
//         title: Text('Aus vs India'),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Card(
//               elevation: 2,
//               color: Colors.white,
//               child: Container(
//                 padding: EdgeInsets.all(10),
//                 height: 200,
//                 width: 400,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Match Status'),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Team 1',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           'Team 2',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           " 0/0(0.0)",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           '0/0(0.0)',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       'Match Venue',
//                       // style: TextStyle(fontSize: 15),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       'Custom messages',
//                       style: TextStyle(color: Colors.blue.shade800),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               height: 30,
//               width: double.infinity,
//               color: Colors.blue.shade100,
//               child: Text('hi'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
