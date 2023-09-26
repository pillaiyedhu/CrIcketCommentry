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
      'series_type': seriesType
    });
  }

  Future<void> deleteSeriesData(String id) async {
    await firebaseFirestore.collection('series_new').doc(id).delete();
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
      'series_name': seriesName,
      'series_type': seriesType,
      'match_number': currentMatchNumber,
      'match_id': documentname
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

  Future<void> postMatchDetails(
      String battingTeam,
      String bowlingTeam,
      int matchNumber,
      int teamRuns,
      int teamWickets,
      String batsman1,
      String batsman2,
      String bowler,
      int runsBatsman1,
      int runsBatsman2,
      int bowlerWickets,
      int bowlerRuns,
      int ballsBatsman1,
      int ballsBatsman2,
      int ballsBowler) async {
    List<String> allIds = [battingTeam, bowlingTeam];
    allIds.sort();
    String mainId = '${allIds[0]}_${allIds[1]}';

    String matchId = 'match_${matchNumber}_$mainId';
    print(matchId);

    await firebaseFirestore
        .collection('series_new')
        .doc(mainId)
        .collection('matches')
        .doc(matchId)
        .collection('match_details')
        .doc('match_details')
        .set({
      'batting_team': battingTeam,
      'bowling_team': bowlingTeam,
      'team_runs': teamRuns,
      'team_wickets': teamWickets,
      'batsman1_name': batsman1,
      'batsman2_name': batsman2,
      'bowler_name': bowler,
      'batsman1_runs': runsBatsman1,
      'batsman2_runs': runsBatsman2,
      'bowler_wickets': bowlerWickets,
      'bowler_runs': bowlerRuns,
      'batsman1_balls': ballsBatsman1,
      'batsman2_balls': ballsBatsman2,
      'bowler_balls': ballsBowler
    });
  }
}
