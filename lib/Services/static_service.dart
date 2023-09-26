import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseServiceProvider extends ChangeNotifier {
  String? _id;
  String? get id => _id;

  String? _team1;
  String? get team1 => _team1;

  String? _team2;
  String? get team2 => _team2;

  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<DocumentSnapshot<Map<String, dynamic>>>> getSeriesData(
      [seriesData]) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firebaseFirestore.collection('series_new').get();
      return snapshot.docs;
    } catch (error) {
      print('Error:$error');
      return [];
    }
  }

  void setId(String id) {
    _id = id;
    notifyListeners();
  }

  void setTeam1(String team1) {
    _team1 = team1;
    notifyListeners();
  }

  void setTeam2(String team2) {
    _team2 = team2;
    notifyListeners();
  }

  Future<List<DocumentSnapshot<Map<String, dynamic>>>> getMatchesData() async {
    try {
      print("called");
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firebaseFirestore
          .collection('series_new')
          .doc('India_Srilanka')
          .collection('matches')
          .get();
      print(snapshot.docs);
      return snapshot.docs;
    } catch (error) {
      print('Error:$error');
      return [];
    }
  }

  Future<List<DocumentSnapshot<Map<String, dynamic>>>> getScoreData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firebaseFirestore
          .collection('series_new')
          .doc('England_India')
          .collection('matches')
          .doc('match_1_England_India')
          .collection('match_details')
          .get();
      
      return snapshot.docs;
    } catch (error) {
      print('Erroor:$error');
      return [];
    }
  }
}
