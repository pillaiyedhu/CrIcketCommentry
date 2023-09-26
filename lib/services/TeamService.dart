import 'package:cloud_firestore/cloud_firestore.dart';


class TeamService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<List<dynamic>> getPlayers(String id) async {
    try {
      // Reference to the "India" team document
      DocumentReference documentReference =
          firebaseFirestore.collection('teams').doc(id);

      // Get the document data
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await documentReference.get()
              as DocumentSnapshot<Map<String, dynamic>>;

      // Check if the document exists and contains a "players" field
      if (documentSnapshot.exists && documentSnapshot.data() != null) {
        // Extract the "players" field as a List<dynamic> and check its type
        final dynamic playersField = documentSnapshot.data()!['players'];
        if (playersField is List<dynamic>) {
          // Extract the player names from the array
          List<dynamic> playerNames = playersField.map((playerData) {
            return playerData['name'] ?? '';
          }).toList();
          print('$id ------');

          print(playerNames);

          return playerNames;
        }
      }

      // Document doesn't exist, 'players' field is not present, or has the wrong type
      return [];
    } catch (error) {
      print('Error retrieving India players: $error');
      return [];
    }
  }
}



