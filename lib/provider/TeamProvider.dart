import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class TeamProvider extends ChangeNotifier {
  int id = 77777;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  String? _battingTeam;
  String? _bowlingTeam;
  String? _batsman1;
  String? _batsman2;
  String? _bowler;

  String? get battingTeamm => _battingTeam;
  String? get bowlingTeam => _bowlingTeam;
  String? get batsman1 => _batsman1;
  String? get batsman2 => _batsman2;
  String? get bowler => _bowler;

  int runsBatsman1 = 0;
  int runsBatsman2 = 0;
  int teamRuns = 0;
  int teamWickets = 0;

  setBattingTeam(String teamName) {
    _battingTeam = teamName;
    notifyListeners();
  }

  setBowlingTeam(String teamName) {
    _bowlingTeam = teamName;
    notifyListeners();
  }

  setBatsman1(String name) {
    _batsman1 = name;
    notifyListeners();
  }

  setBatsman2(String name) {
    _batsman2 = name;
    notifyListeners();
  }

  setBowler(String name) {
    _bowler = name;
    notifyListeners();
  }


  Future<void> postTeamData() async {
    await firebaseFirestore.collection('teams').doc(id.toString()).set({
      'battingTeam': battingTeamm,
      'bowlingTeam': bowlingTeam,
      'teamRuns': teamRuns,
      'teamWickets': teamWickets,
      'batsman1': batsman1,
      'batsman2': batsman2,
      'bowler': bowler,
      'runsBatsman1': runsBatsman1,
      'runsBatsman2': runsBatsman2
    });
  }

  //Batsman 1 Methods
  Future<void> incrementPlayer1RunsBy1() async {
    runsBatsman1 = runsBatsman1 + 1;
    teamRuns = runsBatsman1 + runsBatsman2;

    await firebaseFirestore
        .collection('teams')
        .doc(id.toString())
        .update({'runsBatsman1': runsBatsman1, 'teamRuns': teamRuns});

    notifyListeners();
  }

  Future<void> incrementPlayer1RunsBy2() async {
    runsBatsman1 = runsBatsman1 + 2;
    teamRuns = runsBatsman1 + runsBatsman2;

    await firebaseFirestore
        .collection('teams')
        .doc(id.toString())
        .update({'runsBatsman1': runsBatsman1, 'teamRuns': teamRuns});

    notifyListeners();
  }

  Future<void> incrementPlayer1RunsBy4() async {
    runsBatsman1 = runsBatsman1 + 4;
    teamRuns = runsBatsman1 + runsBatsman2;

    await firebaseFirestore
        .collection('teams')
        .doc(id.toString())
        .update({'runsBatsman1': runsBatsman1, 'teamRuns': teamRuns});

    notifyListeners();
  }

  Future<void> incrementPlayer1RunsBy6() async {
    runsBatsman1 = runsBatsman1 + 6;
    teamRuns = runsBatsman1 + runsBatsman2;

    await firebaseFirestore
        .collection('teams')
        .doc(id.toString())
        .update({'runsBatsman1': runsBatsman1, 'teamRuns': teamRuns});

    notifyListeners();
  }


  //Batsman 2 methods
  Future<void> incrementPlayer2RunsBy1() async {
    runsBatsman2 = runsBatsman2 + 1;
    teamRuns = runsBatsman1 + runsBatsman2;

    await firebaseFirestore
        .collection('teams')
        .doc(id.toString())
        .update({'runsBatsman2': runsBatsman2, 'teamRuns': teamRuns});

    notifyListeners();
  }

  Future<void> incrementPlayer2RunsBy2() async {
    runsBatsman2 = runsBatsman2 + 2;
    teamRuns = runsBatsman1 + runsBatsman2;

    await firebaseFirestore
        .collection('teams')
        .doc(id.toString())
        .update({'runsBatsman2': runsBatsman2, 'teamRuns': teamRuns});

    notifyListeners();
  }

  Future<void> incrementPlayer2RunsBy4() async {
    runsBatsman2 = runsBatsman2 + 4;
    teamRuns = runsBatsman1 + runsBatsman2;

    await firebaseFirestore
        .collection('teams')
        .doc(id.toString())
        .update({'runsBatsman2': runsBatsman2, 'teamRuns': teamRuns});

    notifyListeners();
  }

  Future<void> incrementPlayer2RunsBy6() async {
    runsBatsman2 = runsBatsman2 + 6;
    teamRuns = runsBatsman1 + runsBatsman2;

    await firebaseFirestore
        .collection('teams')
        .doc(id.toString())
        .update({'runsBatsman2': runsBatsman2, 'teamRuns': teamRuns});

    notifyListeners();
  }
}
