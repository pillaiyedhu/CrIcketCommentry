import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sept15_crickbuzz_developer/provider/MatchProvider.dart';
import 'package:sept15_crickbuzz_developer/screens/MatchScreen.dart';
import 'package:sept15_crickbuzz_developer/services/StaticScreenService.dart';

class StaticScreen extends StatefulWidget {
  const StaticScreen({super.key});

  @override
  State<StaticScreen> createState() => _StaticScreenState();
}

class _StaticScreenState extends State<StaticScreen> {
  //All the controllers used..................................
  final venueController = TextEditingController();
  final team1NameController = TextEditingController();
  final team2NameController = TextEditingController();
  final customMsgController = TextEditingController();

  String selectedMatchStatus = 'Live';
  String selectedDate = DateTime.now().toString();
  String selectedMatchType = 'OneDay';

  List<String> matchStatus = ['Live', 'Completed', 'Abonded', 'UpComing'];
  List<String> matchType = ['OneDay', 'T20'];

  StaticScreenService screenService = StaticScreenService();

  @override
  Widget build(BuildContext context) {
    final matchProvider = Provider.of<MatchProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRICKADDU'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(15),
          height: 500,
          width: 300,
          child: Column(children: [
            //1. Match venue................................
            TextField(
              controller: venueController,
              decoration: const InputDecoration(
                  hintText: 'Match Venue',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  fillColor: Colors.black),
            ),

            const SizedBox(
              height: 10,
            ),

            //2. Date and Time of Match.......................
            DateTimePicker(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              type: DateTimePickerType.dateTime,
              initialValue: selectedDate,
              firstDate: DateTime(2012),
              lastDate: DateTime(2100),
              onChanged: (val) => setState(() {
                selectedDate = val;
              }),
            ),

            const SizedBox(
              height: 10,
            ),

            //3.DropDown for match Status.....................................
            DropdownButton(
              borderRadius: BorderRadius.circular(10),
              focusColor: Colors.white,
              value: selectedMatchStatus,
              onChanged: (value) {
                setState(() {
                  selectedMatchStatus = value!;
                });
              },
              items: matchStatus.map((String status) {
                return DropdownMenuItem<String>(
                    value: status, child: Text(status));
              }).toList(),
            ),

            const SizedBox(
              height: 10,
            ),

            //4. Names of Teams...............................................
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 100,
                  child: TextField(
                      controller: team1NameController,
                      decoration: const InputDecoration(
                          hintText: 'Enter Team1 Name',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))))),
                ),
                Container(
                  height: 50,
                  width: 100,
                  child: TextField(
                    controller: team2NameController,
                    decoration: const InputDecoration(
                        hintText: 'Enter Team2 Name',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                )
              ],
            ),

            const SizedBox(
              height: 10,
            ),

            //5.MatchType i.e Oneday or T20......................................
            DropdownButton(
              borderRadius: BorderRadius.circular(10),
              value: selectedMatchType,
              onChanged: (value) {
                setState(() {
                  selectedMatchType = value!;
                });
              },
              items: matchType.map((String type) {
                return DropdownMenuItem(value: type, child: Text(type));
              }).toList(),
            ),

            const SizedBox(
              height: 10,
            ),

            //6.Custom Message...............................................

            TextField(
              controller: customMsgController,
              keyboardType: TextInputType.multiline,
              minLines: 3,
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: 'Enter Description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),

            const SizedBox(
              height: 10,
            ),

            //7.................Done Button............................
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent),
                onPressed: () {
                  sendData(
                      venueController.text,
                      selectedDate,
                      selectedMatchStatus,
                      team1NameController.text,
                      team2NameController.text,
                      selectedMatchType,
                      customMsgController.text);
                  matchProvider.setTeam1Name(team1NameController.text);
                  matchProvider.setTeam2Name(team2NameController.text);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MatchScreen(),
                      ));
                },
                child: const Text(
                  'Done',
                  style: TextStyle(color: Colors.black),
                )),
          ]),
        ),
      ),
    );
  }

  Future<void> sendData(
      String venue,
      String selectedDate,
      String matchStatus,
      String teamName1,
      String teamName2,
      String matchType,
      String message) async {
    screenService.postGeneralData(venue, selectedDate, matchStatus, teamName1,
        teamName2, matchType, message);
  }
}
