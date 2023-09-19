import 'package:flutter/material.dart';

class MatchProvider extends ChangeNotifier {
  String? _team1Name;
  String? _team2Name;

  setTeam1Name(String teamName) {
    _team1Name = teamName;
    notifyListeners();
  }

  setTeam2Name(String teamName) {
    _team2Name = teamName;
    notifyListeners();
  }

  String? get team1Name => _team1Name;
  String? get team2Name => _team2Name;

}
