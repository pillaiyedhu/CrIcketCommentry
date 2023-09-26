import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sept15_crickbuzz_developer/Services/static_service.dart';
import 'package:sept15_crickbuzz_developer/screens/all_series_page.dart';
import 'package:sept15_crickbuzz_developer/screens/completed.dart';
import 'package:sept15_crickbuzz_developer/screens/live_page.dart';
import 'package:sept15_crickbuzz_developer/screens/upcoming.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final matchProvider = Provider.of<FirebaseServiceProvider>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: Text(
            'CricAddu',
          ),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(
              text: 'LIVE',
            ),
            Tab(
              text: 'UPCOMING',
            ),
            Tab(
              text: 'Completed',
            )
          ]),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TabBarView(children: [
                LivePage(),
                Upcoming(),
                Completed(),
              ]),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
                if (_currentIndex == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllSeriesPage(),
                    ),
                  );
                }
              });
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports_cricket), label: 'series'),
            ]),
      ),
    );
  }
}
