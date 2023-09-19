import 'package:cloud_firestore/cloud_firestore.dart';

class MatchScreenService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> postmatchData(
      String batsman1Name,
      String batsman2Name,
      String bowlerName,
      String bowlerType,
      String battingTeamName,
      String bowlingTeamName) async {
    List<String> fields = [batsman1Name, batsman2Name, bowlerName];
    fields.sort();
    String id = fields.join('_');

    await firebaseFirestore.collection('matchdata').doc(id).set({
      'id':id,
      'battingteamname': battingTeamName,
      'bowlingteamname': bowlingTeamName,
      'batsman1name': batsman1Name,
      'batsman2name': batsman2Name,
      'bowlername': bowlerName,
      'bowlingType': bowlerType,
    });
  }
}
