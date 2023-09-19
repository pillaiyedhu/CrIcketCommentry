import 'package:flutter/material.dart';

class TeamProvider extends ChangeNotifier {
  String? _teamName1;
  String? _teamName2;

  String? get teamName1 => _teamName1;
  String? get teamName2 => _teamName2;

  void setTeamName1(String teamName1) {
    _teamName1 = teamName1;
    notifyListeners();
  }

   void setTeamName2(String teamName2) {
    _teamName2 = teamName2;
    notifyListeners();
  }
}
