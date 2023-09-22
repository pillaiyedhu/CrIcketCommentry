import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:sept15_crickbuzz_developer/services/MatchScreenService.dart';
import 'package:sept15_crickbuzz_developer/services/TeamService.dart';
import 'package:search_choices/search_choices.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  //Controller used for putting the series name
  final seriesNameController = TextEditingController();
  final venueController = TextEditingController();

  //Date time picker default values for start and end date of the series
  String selectedStartDate = DateTime.now().toString();
  String selectedEndDate = DateTime.now().toString();
  String selectedMatchDate = DateTime.now().toString();

  //the list for the match type
  List<String> matchType = ['OneDay', 'T20'];
  String selectedMatchType = 'OneDay';

  //the list for the match number
  List<int> matchNumber = [1, 2, 3, 4, 5];
  int selectedMatchNumber = 1;
  int currentMatchNumber = 1;

  List<String> teams = ['India', 'Pakistan', 'Australia', 'Srilanka'];
  String selectedTeam1 = 'India';
  String selectedTeam2 = 'Australia';
  List<String> tossTeams = [];
  String toss = '';

  List<String> matchStatus = ['Live', 'Completed', 'UpComing'];
  String selectedMatchStatus = 'Live';

  //Future<List<String>> allPlayers = TeamService().getPlayers();
  List<dynamic> allPlayers = [];
  List<dynamic> selectedPlayers = [];
  List<int> selectedPlayerIndex = [];

  final MatchScreenService matchScreenService = MatchScreenService();
  final TeamService teamService = TeamService();

  @override
  void initState() {
    super.initState();
    getPlayers();
  }

  Future<void> getPlayers() async {
    List<dynamic> players = await teamService.getPlayers('India');
    setState(() {
      allPlayers = players;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar
      appBar: AppBar(
        title: Text('CrickAddu'),
        centerTitle: true,
      ),

      body: Center(
        child: Container(
          height: 620,
          width: 800,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //1. text field for series name

                      Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 200,
                          child: TextField(
                            controller: seriesNameController,
                            decoration: InputDecoration(
                                hintText: 'Enter series name',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          )),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 200,
                            child: Text(
                              'No of Matches in Series :',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)),
                          ),
                          const SizedBox(width: 5),
                          DropdownButton(
                            borderRadius: BorderRadius.circular(10),
                            value: selectedMatchNumber,
                            onChanged: (value) {
                              setState(() {
                                selectedMatchNumber = value!;
                              });
                            },
                            items: matchNumber.map((int type) {
                              return DropdownMenuItem(
                                  value: type, child: Text(type.toString()));
                            }).toList(),
                          ),
                        ],
                      ),

                      //drop down menu for match type
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 150,
                            child: Text(
                              'Select Match Type :',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)),
                          ),
                          const SizedBox(width: 5),
                          DropdownButton(
                            borderRadius: BorderRadius.circular(10),
                            value: selectedMatchType,
                            onChanged: (value) {
                              setState(() {
                                selectedMatchType = value!;
                              });
                            },
                            items: matchType.map((String type) {
                              return DropdownMenuItem(
                                  value: type, child: Text(type));
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),

                  //-------------------Row 1 Completed----------------------

                  const SizedBox(
                    height: 5,
                  ),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Start date of series ........................
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 150,
                          child: Text("Start Date of Series :",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Container(
                          height: 50,
                          width: 150,
                          child: DateTimePicker(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            type: DateTimePickerType.dateTime,
                            initialValue: selectedStartDate,
                            firstDate: DateTime(2012),
                            lastDate: DateTime(2100),
                            onChanged: (val) => setState(() {
                              selectedStartDate = val;
                            }),
                          ),
                        ),

                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 150,
                          child: Text('End Date of Series :',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Container(
                          height: 50,
                          width: 150,
                          child: DateTimePicker(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            type: DateTimePickerType.dateTime,
                            initialValue: selectedEndDate,
                            firstDate: DateTime(2012),
                            lastDate: DateTime(2100),
                            onChanged: (val) => setState(() {
                              selectedEndDate = val;
                            }),
                          ),
                        ),
                      ]),

                  //--------------------Row 2  Completed ------------------------------------------

                  const SizedBox(
                    height: 5,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Drop Down for team1
                      DropdownButton(
                        borderRadius: BorderRadius.circular(10),
                        value: selectedTeam1,
                        onChanged: (value) {
                          setState(() {
                            selectedTeam1 = value!;
                          });
                        },
                        items: teams.map((type) {
                          return DropdownMenuItem(
                              value: type, child: Text(type.toString()));
                        }).toList(),
                      ),

                      const SizedBox(
                        width: 20,
                      ),

                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.pinkAccent,
                        child: Text('VS'),
                      ),

                      const SizedBox(
                        width: 20,
                      ),

                      //Drop Down for team2
                      DropdownButton(
                        borderRadius: BorderRadius.circular(10),
                        value: selectedTeam2,
                        onChanged: (value) {
                          setState(() {
                            selectedTeam2 = value!;
                          });
                        },
                        items: teams.map((type) {
                          return DropdownMenuItem(
                              value: type, child: Text(type.toString()));
                        }).toList(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  ElevatedButton(
                      onPressed: () {
                        // matchScreenService.postSeriesData(
                        //     selectedStartDate,
                        //     selectedEndDate,
                        //     seriesNameController.text,
                        //     selectedMatchType,
                        //     selectedTeam1,
                        //     selectedTeam2,
                        //     selectedMatchNumber);

                        tossTeams.add(selectedTeam1);
                        tossTeams.add(selectedTeam2);
                        toss = selectedTeam1;
                      },
                      child: Text('Submit')),
                  //----------------------------------------------------------------------------------

                  //Divider to seperate the page
                  const Divider(
                    thickness: 2,
                  ),

                  //-------------Row3 completed--------------------------------

                  const SizedBox(
                    height: 5,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 200,
                        child: Text(
                          'Current Match Number :',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                      ),
                      DropdownButton(
                        borderRadius: BorderRadius.circular(10),
                        value: currentMatchNumber,
                        onChanged: (value) {
                          setState(() {
                            currentMatchNumber = value!;
                          });
                        },
                        items: matchNumber.map((int type) {
                          return DropdownMenuItem(
                              value: type, child: Text(type.toString()));
                        }).toList(),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
                        child: Text(
                          'Match Status :',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                      ),
                      DropdownButton(
                        borderRadius: BorderRadius.circular(10),
                        value: selectedMatchStatus,
                        onChanged: (value) {
                          setState(() {
                            selectedMatchStatus = value!;
                          });
                        },
                        items: matchStatus.map((type) {
                          return DropdownMenuItem(
                              value: type, child: Text(type.toString()));
                        }).toList(),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 50,
                          width: 150,
                          child: TextField(
                            controller: venueController,
                            decoration: InputDecoration(
                                hintText: 'Enter Venue',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 150,
                            child: Text(
                              'Enter Match DateTime :',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 50,
                            width: 150,
                            child: DateTimePicker(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              type: DateTimePickerType.dateTime,
                              initialValue: selectedStartDate,
                              firstDate: DateTime(2012),
                              lastDate: DateTime(2100),
                              onChanged: (val) => setState(() {
                                selectedStartDate = val;
                              }),
                            ),
                          ),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 150,
                              child: Text(
                                'Toss :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black)),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            DropdownButton(
                              borderRadius: BorderRadius.circular(10),
                              value: toss,
                              onChanged: (value) {
                                setState(() {
                                  toss = value!;
                                });
                              },
                              items: tossTeams.map((type) {
                                return DropdownMenuItem(
                                    value: type, child: Text(type.toString()));
                              }).toList(),
                            ),
                          ]),
                    ],
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  ElevatedButton(
                      onPressed: () {
                        // matchScreenService.postMatchData(
                        //     selectedMatchDate,
                        //     selectedMatchStatus,
                        //     selectedTeam1,
                        //     selectedTeam2,
                        //     toss,
                        //     venueController.text,
                        //     seriesNameController.text,
                        //     currentMatchNumber,);

                        tossTeams.clear();
                      },
                      child: Text('Submit')),

                  Container(
                      height: 100,
                      width: 200,
                      child: SearchChoices.multiple(
                        items: allPlayers
                            .map((player) => DropdownMenuItem(
                                value: player, child: Text(player)))
                            .toList(),
                        hint: 'Select Players',
                        searchHint: "Search Players",
                        onChanged: (values) {
                          setState(() {
                            selectedPlayerIndex = values.cast<int>();
                            selectedPlayers = selectedPlayerIndex
                                .map((player) => allPlayers[player])
                                .toList();

                            print(selectedPlayers);
                          });
                        },
                        //selectedItems: selectedPlayerIndex,
                        isExpanded: false,
                        isCaseSensitiveSearch: false,
                        displayClearIcon: false,
                      )),

                  ElevatedButton(
                      onPressed: () {
                        // matchScreenService.postPlayerData(selectedTeam1,
                        //     selectedTeam2, currentMatchNumber, selectedPlayers);
                      },
                      child: Text("Ok"))

                  //Text(selectedPlayers.length.toString())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
