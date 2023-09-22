import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_choices/search_choices.dart';
import 'package:sept15_crickbuzz_developer/provider/MatchProvider.dart';
import 'package:sept15_crickbuzz_developer/screens/TeamDataPage.dart';
import 'package:sept15_crickbuzz_developer/services/MatchScreenService.dart';
import 'package:sept15_crickbuzz_developer/services/TeamService.dart';

class MatchDataPage extends StatefulWidget {
  const MatchDataPage(
      {String? seriesName,
      String? totalMatches,
      String? seriesType,
      String? startDate,
      String? endDate,
      String? team1Name,
      String? team2Name,
      super.key});

  @override
  State<MatchDataPage> createState() => _MatchDataPageState();
}

class _MatchDataPageState extends State<MatchDataPage> {
  //All my controllers..........................................................
  final seriesNameController = TextEditingController();
  final venueController = TextEditingController();

  //All the dates and times of matches and series...............................
  String selectedStartDate = DateTime.now().toString();
  String selectedEndDate = DateTime.now().toString();
  String selectedMatchDate = DateTime.now().toString();

  //Match number List and their selected values.................................
  List<int> matchNumber = [1, 2, 3, 4, 5];
  int selectedMatchNumber = 1;
  int currentMatchNumber = 1;

  //Match type List and their selected values...................................
  List<String> matchType = ['ODI', 'T20'];
  String selectedMatchType = 'ODI';

  //List of Teams and the selected teams........................................
  List<String> teams = ['India', 'England', 'Australia', 'Srilanka'];
  String selectedTeam1 = 'India';
  String selectedTeam2 = 'Australia';

  //List of teams in toss and selected team
  List<String> tossTeams = [];
  String toss = '';

  //List of match status of teams and selected match status
  List<String> matchStatus = ['Live', 'Completed', 'UpComing'];
  String selectedMatchStatus = 'Live';

  //services call
  final MatchScreenService matchScreenService = MatchScreenService();
  final TeamService teamService = TeamService();

  //players list - selected , all players , index
  List<dynamic> team1PlayersAll = [];
  List<dynamic> team2PlayersAll = [];
  List<dynamic> selectedPlayers1 = [];
  List<int> selectedPlayerIndex1 = [];
  List<dynamic> selectedPlayers2 = [];
  List<int> selectedPlayerIndex2 = [];

  //select batsman and bowler
  String batsman1 = '';
  String batsman2 = '';
  String bowler = '';

  //init state to get all players at the start..................................
  @override
  void initState() {
    super.initState();
    getPlayers();
  }

  //creating a method to get my future players in the form of list of players...
  Future<void> getPlayers() async {
    print('check');
    List<dynamic> players1 = await teamService.getPlayers(selectedTeam1);
    List<dynamic> players2 = await teamService.getPlayers(selectedTeam2);

    setState(() {
      team1PlayersAll = players1;
      team2PlayersAll = players2;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Provider called
    final matchProvider = Provider.of<MatchProvider>(context);

    return Scaffold(
        //appBar
        appBar: AppBar(
          title: Text('CrickAddu'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 124, 79, 94),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 1st Card .....................................................
                  Container(
                    height: 700,
                    width: 400,
                    child: Card(
                        color: const Color.fromARGB(255, 240, 235, 235),
                        elevation: 4,
                        shadowColor: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Row 1 for series name:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    width: 150,
                                    child: const Text('Enter Name of Series :'),
                                  ),
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      height: 50,
                                      width: 200,
                                      child: TextField(
                                        controller: seriesNameController,
                                        decoration: InputDecoration(
                                            hintText: 'Enter series name',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                      )),
                                ],
                              ),

                              const SizedBox(
                                height: 20,
                              ),
                              //Row 2 for no of matches in series ..........................
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height: 50,
                                    width: 200,
                                    child:
                                        const Text('No of Matches in Series :'),
                                  ),
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
                                          value: type,
                                          child: Text(type.toString()));
                                    }).toList(),
                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 20,
                              ),

                              //Row 3. for match type.................................
                              Row(
                                children: [
                                  const SizedBox(width: 5),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height: 50,
                                    width: 150,
                                    child: Text(
                                      'Select Match Type :',
                                    ),
                                  ),
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

                              const SizedBox(
                                height: 20,
                              ),
                              //Row 4 for start date of series........................

                              Row(
                                children: [
                                  const SizedBox(width: 5),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height: 50,
                                    width: 150,
                                    child: Text(
                                      'Select Start date :',
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 200,
                                    child: DateTimePicker(
                                      decoration: const InputDecoration(
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

                              const SizedBox(
                                height: 20,
                              ),
                              //Row 5 for end date of series..........................

                              Row(
                                children: [
                                  const SizedBox(width: 5),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height: 50,
                                    width: 150,
                                    child: Text(
                                      'Select End date :',
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 200,
                                    child: DateTimePicker(
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)))),
                                      type: DateTimePickerType.dateTime,
                                      initialValue: selectedEndDate,
                                      firstDate: DateTime(2012),
                                      lastDate: DateTime(2100),
                                      onChanged: (val) => setState(() {
                                        selectedEndDate = val;
                                      }),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 20,
                              ),

                              //Card for displaying team names........................

                              Container(
                                alignment: Alignment.center,
                                height: 100,
                                width: 360,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //Drop Down for team1
                                    DropdownButton(
                                      borderRadius: BorderRadius.circular(10),
                                      value: selectedTeam1,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedTeam1 = value!;
                                          getPlayers();
                                        });
                                      },
                                      items: teams.map((type) {
                                        return DropdownMenuItem(
                                            value: type,
                                            child: Text(type.toString()));
                                      }).toList(),
                                    ),

                                    const SizedBox(
                                      width: 20,
                                    ),

                                    const CircleAvatar(
                                      radius: 30,
                                      backgroundColor: const Color.fromARGB(
                                          255, 124, 79, 94),
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
                                          getPlayers();
                                        });
                                      },
                                      items: teams.map((type) {
                                        return DropdownMenuItem(
                                            value: type,
                                            child: Text(type.toString()));
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),

                              //Submit button of card 1
                              Container(
                                height: 100,
                                width: 100,
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 124, 79, 94),
                                    ),
                                    onPressed: () {
                                      matchScreenService.postSeriesData(
                                          selectedStartDate,
                                          selectedEndDate,
                                          seriesNameController.text,
                                          selectedMatchType,
                                          selectedTeam1,
                                          selectedTeam2,
                                          selectedMatchNumber,
                                          selectedMatchType);

                                      tossTeams.add(selectedTeam1);
                                      tossTeams.add(selectedTeam2);
                                      toss = selectedTeam1;
                                    },
                                    child: Text('Submit')),
                              ),
                            ],
                          ),
                        )),
                  ),

                  // 2nd Card......................................................
                  Container(
                    height: 700,
                    width: 400,
                    child: Card(
                      color: const Color.fromARGB(255, 240, 235, 235),
                      elevation: 4,
                      shadowColor: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //row 1 of card 2 - current match number..............
                            Row(
                              children: [
                                const SizedBox(width: 5),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 50,
                                  width: 150,
                                  child: Text(
                                    'Current Match Number :',
                                  ),
                                ),
                                const SizedBox(
                                  width: 40,
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
                                        value: type,
                                        child: Text(type.toString()));
                                  }).toList(),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            //row 2 of card 2 - match status .......................

                            Row(
                              children: [
                                const SizedBox(width: 5),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 50,
                                  width: 150,
                                  child: Text(
                                    'Current Match Status :',
                                  ),
                                ),
                                const SizedBox(
                                  width: 40,
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
                                        value: type,
                                        child: Text(type.toString()));
                                  }).toList(),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            //row 3 select venue of the match ......................

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 150,
                                  child: const Text('Enter Name of Venue :'),
                                ),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    height: 50,
                                    width: 200,
                                    child: TextField(
                                      controller: venueController,
                                      decoration: InputDecoration(
                                          hintText: 'Enter Venue',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            //row 4 to decide who won the toss......................
                            Row(
                              children: [
                                const SizedBox(width: 5),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 50,
                                  width: 150,
                                  child: Text(
                                    'Toss Winning Team :',
                                  ),
                                ),
                                const SizedBox(
                                  width: 40,
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
                                        value: type,
                                        child: Text(type.toString()));
                                  }).toList(),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            //row 5 to decide match date time.......................

                            Row(
                              children: [
                                const SizedBox(width: 5),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 50,
                                  width: 150,
                                  child: Text(
                                    'Select Match datetime :',
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 200,
                                  child: DateTimePicker(
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)))),
                                    type: DateTimePickerType.dateTime,
                                    initialValue: selectedMatchDate,
                                    firstDate: DateTime(2012),
                                    lastDate: DateTime(2100),
                                    onChanged: (val) => setState(() {
                                      selectedMatchDate = val;
                                    }),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            //submit button to submit all the entries...............

                            Container(
                              height: 100,
                              width: 100,
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 124, 79, 94),
                                  ),
                                  onPressed: () {
                                    matchScreenService.postMatchData(
                                        selectedMatchDate,
                                        selectedMatchStatus,
                                        selectedTeam1,
                                        selectedTeam2,
                                        toss,
                                        venueController.text,
                                        seriesNameController.text,
                                        selectedMatchType,
                                        currentMatchNumber);

                                    //tossTeams.clear();
                                  },
                                  child: Text('Submit')),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // 3rd Card......................................................
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 230,
                          width: 400,
                          child: Card(
                            color: const Color.fromARGB(255, 240, 235, 235),
                            elevation: 4,
                            shadowColor: Colors.black,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //Team1 select data....................................
                                  Column(
                                    children: [
                                      //Select players of Team1
                                      Container(
                                        alignment: Alignment.center,
                                        height: 50,
                                        width: 150,
                                        child:
                                            Text('$selectedTeam1 - Playing 11'),
                                      ),

                                      const SizedBox(
                                        height: 20,
                                      ),
                                      //Choices to select players of team1
                                      Container(
                                          height: 100,
                                          width: 150,
                                          child: SearchChoices.multiple(
                                            items: team1PlayersAll
                                                .map((player) =>
                                                    DropdownMenuItem(
                                                        value: player,
                                                        child: Text(player)))
                                                .toList(),
                                            hint: 'Select Players',
                                            searchHint: "Search Players",
                                            onChanged: (values) {
                                              setState(() {
                                                selectedPlayerIndex1 =
                                                    values.cast<int>();
                                                selectedPlayers1 =
                                                    selectedPlayerIndex1
                                                        .map((player) =>
                                                            team1PlayersAll[
                                                                player])
                                                        .toList();

                                                print(selectedPlayers1);
                                              });
                                            },
                                            //selectedItems: selectedPlayerIndex,
                                            isExpanded: false,
                                            isCaseSensitiveSearch: false,
                                            displayClearIcon: false,
                                          )),

                                      //Button to submit data of team1
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 124, 79, 94),
                                          ),
                                          onPressed: () {
                                            matchScreenService
                                                .postPlayerDataTeam1(
                                                    selectedTeam1,
                                                    selectedTeam2,
                                                    currentMatchNumber,
                                                    selectedPlayers1);
                                          },
                                          child:
                                              Text("$selectedTeam1 squad done"))
                                    ],
                                  ),

                                  //Team 2 select data...................................
                                  Column(
                                    children: [
                                      //Text to select team 2 data
                                      Container(
                                        alignment: Alignment.center,
                                        height: 50,
                                        width: 150,
                                        child:
                                            Text('$selectedTeam2 - Playing 11'),
                                      ),

                                      const SizedBox(
                                        height: 20,
                                      ),
                                      //choices to select team2 data
                                      Container(
                                          height: 100,
                                          width: 150,
                                          child: SearchChoices.multiple(
                                            items: team2PlayersAll
                                                .map((player) =>
                                                    DropdownMenuItem(
                                                        value: player,
                                                        child: Text(player)))
                                                .toList(),
                                            hint: 'Select Players',
                                            searchHint: "Search Players",
                                            onChanged: (values) {
                                              setState(() {
                                                selectedPlayerIndex2 =
                                                    values.cast<int>();
                                                selectedPlayers2 =
                                                    selectedPlayerIndex2
                                                        .map((player) =>
                                                            team2PlayersAll[
                                                                player])
                                                        .toList();

                                                print(selectedPlayers2);
                                              });
                                            },
                                            isExpanded: false,
                                            isCaseSensitiveSearch: false,
                                            displayClearIcon: false,
                                          )),

                                      //Selected players submit button
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 124, 79, 94),
                                          ),
                                          onPressed: () {
                                            matchScreenService
                                                .postPlayerDataTeam2(
                                                    selectedTeam1,
                                                    selectedTeam2,
                                                    currentMatchNumber,
                                                    selectedPlayers2);
                                          },
                                          child:
                                              Text("$selectedTeam2 squad done"))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height: 360,
                            width: 400,
                            child: Card(
                                color: const Color.fromARGB(255, 240, 235, 235),
                                elevation: 4,
                                shadowColor: Colors.black,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          //To select the batsman 1
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: 50,
                                                width: 120,
                                                child:
                                                    Text('Select Batsman 1 :'),
                                              ),
                                              Container(
                                                  height: 100,
                                                  width: 190,
                                                  child: SearchChoices.single(
                                                    items: selectedPlayers1
                                                        .map((player) =>
                                                            DropdownMenuItem<
                                                                    String>(
                                                                value: player,
                                                                child: Text(
                                                                    player)))
                                                        .toList(),
                                                    hint: 'Select Batsman1',
                                                    searchHint: 'Search Player',
                                                    onChanged: (value) {
                                                      setState(() {
                                                        batsman1 = value;
                                                      });
                                                    },
                                                    isCaseSensitiveSearch:
                                                        false,
                                                  )),
                                            ],
                                          ),
                                          //To select the batsman 2
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: 50,
                                                width: 120,
                                                child:
                                                    Text('Select Batsman 2 :'),
                                              ),
                                              Container(
                                                  height: 100,
                                                  width: 190,
                                                  child: SearchChoices.single(
                                                    items: selectedPlayers1
                                                        .map((player) =>
                                                            DropdownMenuItem<
                                                                    String>(
                                                                value: player,
                                                                child: Text(
                                                                    player)))
                                                        .toList(),
                                                    hint: 'Select Batsman2',
                                                    searchHint: 'Search Player',
                                                    onChanged: (value) {
                                                      setState(() {
                                                        batsman2 = value;
                                                      });
                                                    },
                                                    isCaseSensitiveSearch:
                                                        false,
                                                  )),
                                            ],
                                          ),
                                          //To select the bowler
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: 50,
                                                width: 120,
                                                child: Text('Select Bowler :'),
                                              ),
                                              Container(
                                                  height: 100,
                                                  width: 190,
                                                  child: SearchChoices.single(
                                                    items: selectedPlayers2
                                                        .map((player) =>
                                                            DropdownMenuItem<
                                                                    String>(
                                                                value: player,
                                                                child: Text(
                                                                    player)))
                                                        .toList(),
                                                    hint: 'Select Bowler',
                                                    searchHint: 'Search Player',
                                                    onChanged: (value) {
                                                      setState(() {
                                                        bowler = value;
                                                      });
                                                    },
                                                    isCaseSensitiveSearch:
                                                        false,
                                                  )),
                                            ],
                                          ),

                                          //Elevated button to select the players
                                          ElevatedButton(
                                              onPressed: () {
                                                matchProvider
                                                    .setBatsman1(batsman1);
                                                matchProvider
                                                    .setBatsman2(batsman2);
                                                matchProvider.setBowler(bowler);
                                                matchProvider
                                                    .setTeam1(selectedTeam1);
                                                matchProvider
                                                    .setTeam2(selectedTeam2);

                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          TeamDataPage(),
                                                    ));
                                              },
                                              child: Text('Submit')),
                                        ]))))
                      ])
                ])));
  }
}
