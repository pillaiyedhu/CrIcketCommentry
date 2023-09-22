import 'package:cloud_firestore/cloud_firestore.dart';

class MatchScreenService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> postSeriesData(
    String startDate,
    String endDate,
    String seriesName,
    String matchtype,
    String team1Name,
    String team2Name,
    int totalMatches,
    String seriesType,
  ) async {
    List<String> fields = [team1Name, team2Name];
    fields.sort();
    String id = fields.join('_');

    await firebaseFirestore.collection('series_new').doc(id).set({
      'id': id,
      'team1_name': team1Name,
      'team2_name': team2Name,
      'series_name': seriesName,
      'total_matches': totalMatches,
      'start_date': startDate,
      'end_date': endDate,
      'series_type':seriesType
    });
  }

  Future<void> postMatchData(
      String matchDate,
      String matchStatus,
      String team1Name,
      String team2Name,
      String toss,
      String venue,
      String seriesName,
      String seriesType,
      int currentMatchNumber) async {
    List<String> fields = [team1Name, team2Name];
    fields.sort();
    String id = fields.join('_');
    String collectionname = 'match_$currentMatchNumber';
    String documentname = '${collectionname}_$id';
    firebaseFirestore
        .collection('series_new')
        .doc(id)
        .collection('matches')
        .doc(documentname)
        .set({
      'match_date': matchDate,
      'match_status': matchStatus,
      'team1_name': team1Name,
      'team2_name': team2Name,
      'toss': toss,
      'venue': venue,
      'series_name':seriesName,
      'series_type':seriesType,
      'match_number':currentMatchNumber
    });
  }

  Future<void> postPlayerDataTeam1(String team1Name, String team2Name,
      int currentMatchNumber, List<dynamic> selectedPlayers) async {
    List<String> fields = [team1Name, team2Name];
    fields.sort();
    String id1 = fields.join('_');

    String collection1Name = 'match_$currentMatchNumber';
    String document1Name = '${collection1Name}_$id1';

    await firebaseFirestore
        .collection('series_new')
        .doc(id1)
        .collection('matches')
        .doc(document1Name)
        .collection("${team1Name}_squad")
        .doc('players')
        .set({'data': selectedPlayers});
  }


  Future<void> postPlayerDataTeam2(String team1Name, String team2Name,
      int currentMatchNumber, List<dynamic> selectedPlayers) async {
    List<String> fields = [team1Name, team2Name];
    fields.sort();
    String id1 = fields.join('_');

    String collection1Name = 'match_$currentMatchNumber';
    String document1Name = '${collection1Name}_$id1';

    await firebaseFirestore
        .collection('series_new')
        .doc(id1)
        .collection('matches')
        .doc(document1Name)
        .collection("${team2Name}_squad")
        .doc('players')
        .set({'data': selectedPlayers});
  }
}
