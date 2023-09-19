import 'package:cloud_firestore/cloud_firestore.dart';

class StaticScreenService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> postGeneralData(String venue,String matchDate,String matchStatus,String? team1Name,String? team2Name,String matchType,String message) async {
    await firebaseFirestore.collection('generalData').doc().set({
      'venue': venue,
      'matchdate': matchDate,
      'matchstatus':matchStatus,
      'team1name':team1Name,
      'team2name':team2Name,
      'matchtype':matchType,
      'message':message,
    });
  }
}
