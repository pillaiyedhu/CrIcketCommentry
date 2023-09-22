import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CheckSelectedPlayersList extends StatefulWidget {
  const CheckSelectedPlayersList({super.key});

  @override
  State<CheckSelectedPlayersList> createState() =>
      _CheckSelectedPlayersListState();
}

class _CheckSelectedPlayersListState extends State<CheckSelectedPlayersList> {
  List<String> allPlayers = ['5', '1', '2', '3', '6', '11'];
  List<String> selectedPlayers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TypeAheadField(
              suggestionsCallback: (pattern) {
                return allPlayers.where((player) =>
                    player.toLowerCase().contains(player.toLowerCase()));
              },
              itemBuilder: (context, itemData) {
                return ListTile(
                  title: Text(itemData),
                );
              },
              onSuggestionSelected: (suggestion) {
                setState(() {
                  selectedPlayers.add(suggestion);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
