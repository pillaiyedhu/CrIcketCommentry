import 'package:cloud_firestore/cloud_firestore.dart';

class StaticService {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<void> getData() async {
    await _firebaseFirestore.collection('generalData').get();
  }
}
