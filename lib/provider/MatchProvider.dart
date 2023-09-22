import 'package:flutter/material.dart';

class MatchProvider extends ChangeNotifier {
  String? _batsman1;
  String? _batsman2;
  String? _bowler;
  String? _team1Name;
  String? _team2Name;

  setBatsman1(String batsman1) {
    _batsman1 = batsman1;
    notifyListeners();
  }

  setBatsman2(String batsman2) {
    _batsman2 = batsman2;
    notifyListeners();
  }

  setBowler(String bowler) {
    _bowler = bowler;
    notifyListeners();
  }

  setTeam1(String team1) {
    _team1Name = team1;
    notifyListeners();
  }

  setTeam2(String team2) {
    _team2Name = team2;
    notifyListeners();
  }

  String? get batsman1 => _batsman1;
  String? get batsman2 => _batsman2;
  String? get bowler => _bowler;
  String? get team1Name => _team1Name;
  String? get team2Name => _team2Name;
}
