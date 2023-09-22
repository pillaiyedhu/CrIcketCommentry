// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sept15_crickbuzz_developer/provider/MatchProvider.dart';
// import 'package:sept15_crickbuzz_developer/services/MatchScreenServiceOld.dart';

// class MatchScreenOld extends StatefulWidget {
//   const MatchScreenOld({super.key});

//   @override
//   State<MatchScreenOld> createState() => _MatchScreenOldState();
// }

// class _MatchScreenOldState extends State<MatchScreenOld> {
//   // bool isBallStarted = false;

//   MatchScreenServiceOld matchScreenService = MatchScreenServiceOld();

//   List<String> playersTeam1 = [
//     'Rohit',
//     'Gill',
//     'Kohli',
//     'Rahul',
//     'Kishan',
//     'Jadeja',
//     'Shardul',
//     'Siraj',
//     'Bumrah',
//     'Hardik',
//     'Yadav'
//   ];
//   List<String> bowlingType = [
//     'Right Arm Fast',
//     'Left Arm Fast',
//     'Right Arm Spinner',
//     'Left Arm Spinner'
//   ];

//   List<String> playersTeam2 = [
//     'Pathum',
//     'Kusal',
//     'Mendis',
//     'Samarawickrama',
//     'Asalanka',
//     'De Silva',
//     'Shanaka',
//     'Wellalage',
//     'Hemantha',
//     'Madhushan',
//     'Pathirana'
//   ];
//   String selectedPlayer1Team1 = 'Rohit';
//   String selectedPlayer2Team1 = 'Gill';
//   String selectedPlayerTeam2 = 'Madhushan';
//   String selectedBowlingType = 'Right Arm Fast';

//   @override
//   Widget build(BuildContext context) {
//     final matchProvider = Provider.of<MatchProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('CRICKADDU'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Container(
//           height: 400,
//           width: 400,
//           decoration: BoxDecoration(
//               border: Border.all(color: Colors.black),
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.purpleAccent),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               //INdia vs Srilanka Displayed ..........................
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text("${matchProvider.team1Name}"),
//                   const Text('VS'),
//                   Text('${matchProvider.team2Name}')
//                 ],
//               ),
//               //......Batting Team Credentials..................
//               const Text('Batting Team'),

//               //Batsman 1 credentials..........
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   const Text("Batsman 1:"),
//                   DropdownButton(
//                     value: selectedPlayer1Team1,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedPlayer1Team1 = value!;
//                       });
//                     },
//                     items: playersTeam1.map(
//                       (player) {
//                         return DropdownMenuItem(
//                           value: player,
//                           child: Text(player),
//                         );
//                       },
//                     ).toList(),
//                   )
//                 ],
//               ),

//               //Player1 controls

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(onPressed: () {}, child: Text('1')),
//                   ElevatedButton(onPressed: () {}, child: Text('2')),
//                   ElevatedButton(onPressed: () {}, child: Text('3')),
//                   ElevatedButton(onPressed: () {}, child: Text('4')),
//                   ElevatedButton(onPressed: () {}, child: Text('6'))
//                 ],
//               ),

//               //Batsman 2 credentials..........
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   const Text("Batsman 2:"),
//                   DropdownButton(
//                     value: selectedPlayer2Team1,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedPlayer2Team1 = value!;
//                       });
//                     },
//                     items: playersTeam1.map(
//                       (player) {
//                         return DropdownMenuItem(
//                           value: player,
//                           child: Text(player),
//                         );
//                       },
//                     ).toList(),
//                   )
//                 ],
//               ),

//               //Player2 controls

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(onPressed: () {}, child: Text('1')),
//                   ElevatedButton(onPressed: () {}, child: Text('2')),
//                   ElevatedButton(onPressed: () {}, child: Text('3')),
//                   ElevatedButton(onPressed: () {}, child: Text('4')),
//                   ElevatedButton(onPressed: () {}, child: Text('6'))
//                 ],
//               ),

//               Divider(
//                 thickness: 4,
//                 color: Colors.black,
//                 endIndent: 5,
//                 indent: 5,
//               ),

//               //Bowling side

//               const Text('Bowling Team'),

//               //Bowler
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   const Text("Bowler:"),
//                   DropdownButton(
//                     value: selectedPlayerTeam2,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedPlayerTeam2 = value!;
//                       });
//                     },
//                     items: playersTeam2.map(
//                       (player) {
//                         return DropdownMenuItem(
//                           value: player,
//                           child: Text(player),
//                         );
//                       },
//                     ).toList(),
//                   ),
//                   DropdownButton(
//                     value: selectedBowlingType,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedBowlingType = value!;
//                       });
//                     },
//                     items: bowlingType.map(
//                       (player) {
//                         return DropdownMenuItem(
//                           value: player,
//                           child: Text(player),
//                         );
//                       },
//                     ).toList(),
//                   )
//                 ],
//               ),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.greenAccent),
//                     onPressed: () {},
//                     child: Text(
//                       'Ball Start',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                   ElevatedButton(onPressed: () {}, child: Text('NB')),
//                   ElevatedButton(onPressed: () {}, child: Text('WB')),
//                   ElevatedButton(
//                       style:
//                           ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                       onPressed: () {},
//                       child: Text('W')),
//                 ],
//               ),

//               ElevatedButton(
//                   onPressed: () {
//                     matchScreenService.postmatchData(
//                         selectedPlayer1Team1,
//                         selectedPlayer2Team1,
//                         selectedPlayerTeam2,
//                         selectedBowlingType,
//                         matchProvider.team1Name!,
//                         matchProvider.team2Name!);
//                   },
//                   child: Text("Ok"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
