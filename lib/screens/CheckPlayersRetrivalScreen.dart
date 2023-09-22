import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sept15_crickbuzz_developer/services/TeamService.dart';

class CheckPlayersRetrivalScreen extends StatefulWidget {
  const CheckPlayersRetrivalScreen({super.key});

  @override
  State<CheckPlayersRetrivalScreen> createState() => _CheckPlayersRetrivalScreenState();
}

class _CheckPlayersRetrivalScreenState extends State<CheckPlayersRetrivalScreen> {
  final TeamService teamService = TeamService();
  @override
  Widget build(BuildContext context) {
    List<String> player = [];
    return Scaffold(
        //appBar
        appBar: AppBar(
          title: Text('CrickAddu'),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('teams').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(teamService.getPlayers('India'));
              return Text('ok');
            }
            //print(player.toString());
            if (!snapshot.hasData) {
              return Text('no data');
            }
            if (snapshot.hasError) {
              return Text('Error');
            } else {
              //teamService.getPlayerNames();
              var data = snapshot.data!.docs;
              var item = data[0];
              var players = item['players'];
              return ListView.builder(
                itemCount: players.length,
                itemBuilder: (context, index) {
                  player.add(players[index]["name"]);
                  return ListTile(
                    title: Text('Players: ${players[index]["name"]}'),
                    subtitle: Text(player.toString()),
                  );
                },
              );
            }
          },
        ));
  }
}
