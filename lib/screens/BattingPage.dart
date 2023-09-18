import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sept15_crickbuzz_developer/provider/TeamProvider.dart';
import 'package:sept15_crickbuzz_developer/screens/MatchPage.dart';

class BattingPage extends StatelessWidget {
  //final BattingService battingService = BattingService();

  final battingTeamController = TextEditingController();
  final bowlingTeamController = TextEditingController();
  final battingPlayer1Controller = TextEditingController();
  final battingPlayer2Controller = TextEditingController();
  final bowlerController = TextEditingController();

  Widget build(BuildContext context) {
    final teamProvider = Provider.of<TeamProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('CRICK ADI YEDHU'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: battingTeamController,
                  decoration:
                      const InputDecoration(hintText: 'Enter Batting Team Name'),
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                TextField(
                  controller: bowlingTeamController,
                  decoration:
                      const InputDecoration(hintText: 'Enter Bowling Team Name'),
                ),
                TextField(
                  controller: battingPlayer1Controller,
                  decoration:
                      const InputDecoration(hintText: 'Enter Batsman 1 Name'),
                ),
                TextField(
                  controller: battingPlayer2Controller,
                  decoration:
                      const InputDecoration(hintText: 'Enter Batsman 2 Name'),
                ),
                TextField(
                  controller: bowlerController,
                  decoration:
                      const InputDecoration(hintText: 'Enter Bowler Name'),
                ),
                ElevatedButton(
                    onPressed: () {
                      teamProvider.setBattingTeam(battingTeamController.text);
                      teamProvider.setBowlingTeam(bowlingTeamController.text);
                      teamProvider.setBatsman1(battingPlayer1Controller.text);
                      teamProvider.setBatsman2(battingPlayer2Controller.text);
                      teamProvider.setBowler(bowlerController.text);

                      teamProvider.postTeamData();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MatchPage(),
                          ));

                      //print(teamProvider.batsman1);
                    },
                    child: const Text('Add Team')),

                SizedBox(height: 20),

                // Text("${teamProvider.battingTeamm}"),
                // Text("${teamProvider.bowlingTeam}"),
                // Text("${teamProvider.batsman1}"),
                // Text("${teamProvider.batsman2}"),
                // Text("${teamProvider.bowler}"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future setTeamName() async {
  //   await battingService.setTeamName(teamController.text, 0, 0);
  // }
}
