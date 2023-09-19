import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sept15_crickbuzz_developer/provider/TeamProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sept15_crickbuzz_developer/screens/all_matches_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ChangeNotifierProvider(
    create: (context) => TeamProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Test(),
      theme: ThemeData(backgroundColor: Colors.grey.shade100),
    );
  }
}
